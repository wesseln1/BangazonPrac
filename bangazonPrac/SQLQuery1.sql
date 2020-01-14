--1. SELECT LastName, FirstName, IsSupervisor, DepartmentId, d.Id, [Name] FROM Employee JOIN Department d ON DepartmentId = d.Id ORDER BY [Name] ASC, LastName ASC, FirstName ASC--

--2. SELECT * FROM Department ORDER BY Budget DESC--

--3. SELECT FirstName, LastName, IsSupervisor, DepartmentId, d.Id, [Name] FROM Employee JOIN Department d ON DepartmentId = d.Id WHERE IsSupervisor = 1

--4. SELECT [Name], COUNT(DepartmentId) as EmployeeCount FROM Department d JOIN Employee e ON d.Id = e.DepartmentId GROUP BY [Name]

--5. UPDATE Department SET Budget += Budget*0.2

--6. SELECT e.Id, e.FirstName, e.LastName, COUNT(EmployeeId) AS TrainingCount FROM Employee e LEFT JOIN EmployeeTraining ON e.Id = EmployeeId GROUP BY e.Id, e.FirstName, e.LastName HAVING COUNT(EmployeeId) = 0;

--7. SELECT e.Id, FirstName, LastName, COUNT(EmployeeId) AS TrainingCount FROM Employee e LEFT JOIN EmployeeTraining ON e.Id = EmployeeId GROUP BY e.Id, FirstName, LastName HAVING COUNT(EmployeeId) >= 1;

--8. SELECT e.Id, FirstName, LastName, COUNT(EmployeeId) AS TrainingCount, t.Name FROM Employee e LEFT JOIN EmployeeTraining ON e.Id = EmployeeId LEFT JOIN TrainingProgram t ON TrainingProgramId = t.Id GROUP BY e.Id, FirstName, LastName, t.Name HAVING COUNT(EmployeeId) > 0;

--9. SELECT t.Id, [Name], MaxAttendees, COUNT(EmployeeId) AS EmployeeCount FROM TrainingProgram t LEFT JOIN EmployeeTraining et ON t.Id = TrainingProgramId LEFT JOIN Employee e ON et.EmployeeId = e.Id GROUP BY t.Id, [Name], MaxAttendees HAVING COUNT(EmployeeId) >= MaxAttendees;

--10. SELECT Id, [Name], StartDate, EndDate FROM TrainingProgram WHERE StartDate >= GETDATE() ORDER BY StartDate ASC;

--11. 
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (6, 5)
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (4, 3)
--INSERT INTO EmployeeTraining (EmployeeId, TrainingProgramId) VALUES (2, 5)

--12.
--SELECT top 3 t.Id, 
--COUNT(et.Id) AS AttendeeCount, t.[Name] 
--FROM EmployeeTraining et 
--LEFT JOIN TrainingProgram t ON t.Id = TrainingProgramId 
--GROUP BY t.Id, t.[Name] 
--ORDER BY COUNT(et.Id) DESC;

--13.
--SELECT top 3 t.[Name],
--COUNT(e.Id) AS AttendeeCount, t.[Name]
--FROM EmployeeTraining e
--LEFT JOIN TrainingProgram t ON t.Id = e.Id
--GROUP BY t.[Name]
--ORDER BY COUNT(e.Id);

--14. 
--SELECT e.Id, e.FirstName, e.LastName 
--FROM Employee e
--LEFT JOIN ComputerEmployee ce ON e.Id = ce.EmployeeId
--WHERE ce.Id Is Null;

--15.
--SELECT e.FirstName, e.LastName, IsNull(c.Make + ' ' + c.Model, 'N/A') AS ComputerInfo
--FROM Employee e
--LEFT JOIN Computer c ON e.ComputerId = c.Id

--16. 
--SELECT c.Id, c.Make, c.Manufacturer, c.PurchaseDate, c.DecomissionDate
--FROM Computer c
--WHERE c.PurchaseDate < FORMAT(CURRENT_TIMESTAMP, '07-01-2019')
--AND DecomissionDate Is Null;

--17.
--SELECT e.FirstName,
--COUNT(ce.EmployeeId) AS NumberOfComputers
--FROM Employee e
--LEFT JOIN ComputerEmployee ce ON e.Id = ce.EmployeeId
--GROUP BY e.FirstName
--HAVING COUNT(ce.EmployeeId) Is Not NULL

--18.
--SELECT COUNT(pt.[Name]) AS PaymentTypeCount, pt.[Name]
--FROM PaymentType pt
--GROUP BY pt.[Name]

--19. 
--SELECT p.Id, c.FirstName, c.LastName, p.Price
--FROM Product p
--LEFT JOIN Customer c ON p.CustomerId = c.Id
--ORDER BY p.Price DESC;

--20.
--SELECT p.Id, c.FirstName, c.LastName, p.Quantity
--FROM Product p
--LEFT JOIN Customer c ON p.CustomerId = c.Id
--ORDER BY p.Quantity DESC;

--21.
--SELECT c.Id, c.FirstName, c.LastName, COUNT(o.CustomerId) AS OrderCount
--FROM [Order] o
--LEFT JOIN Customer c ON c.Id = o.CustomerId
--GROUP BY c.FirstName, c.LastName, c.Id
--ORDER BY COUNT(o.CustomerId) DESC

--22.
--SELECT pt.Id AS ProductTypeId, pt.[Name], COUNT(p.ProductTypeId) AS NumberOfProductTypesOrdered
--FROM OrderProduct op
--LEFT JOIN Product p ON p.Id = op.ProductId
--LEFT JOIN ProductType pt ON pt.Id = p.ProductTypeId
--GROUP BY pt.Id, pt.[Name]
--ORDER BY COUNT(p.ProductTypeId) DESC

--23.
--SELECT c.FirstName + ' ' + c.LastName AS SellerName, IsNull(SUM(sales.Price),0) as TotalAmount 
--FROM Customer c
--LEFT JOIN (SELECT p.Price, p.CustomerId 
--FROM Product p 
--INNER JOIN OrderProduct op ON op.ProductId = p.Id)
--Sales ON Sales.CustomerId = c.Id
--Group By c.FirstName,c.LastName
--Order By c.FirstName

