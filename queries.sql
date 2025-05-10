--EX. 1
select email
from sales.customers

--Ex. 2
select email, first_name, last_name
from sales.customers

--Ex. 3 
select *
from sales.customers


-- *DISTINCT* PARA QUE SERVE ##########################################################
-- Serve para remover linhas duplicadas e mostrar apenas linhas distintas.
-- Muito usado na etapa de exploração das bases.

-- SINTAXE #################################################################
select distinct coluna_1, coluna_2, coluna_3
from schema_1.tabela_1

-- (Ex. 1) Seleção de uma coluna sem DISTINCT.
-- Liste as marcas de carro que costam na tabela products.
select brand
from sales.products --333 linhas.

-- (Ex. 2) Seleção de uma coluna com DISTINCT.
-- Liste as marcas de carro distintas que constam na tabela products.
select distinct brand 
from sales.products

-- (Ex. 3) Seleção de mais de uma coluna com DISTINCT.
-- Liste as marcas e anos de modelo distintos que constam na tabela products.
select distinct brand, model_year
from sales.products

-- RESUMO #############################################################################################################
-- (1) Comando usado para remover linhas duplicadas e mostrar apenas linhas distintas.
-- (2) Muito utilizado na etapa de exploração.
-- (3) Caso mais de uma coluna seja selecionada, o comando SELECT DISTINCT irá retornar todas as combinações distintas.


-- *WHERE* PARA QUE SERVE##############################################################################################
-- Serve para filtrar as linhas da tabela de acordo com uma condição

-- SINTAXE 
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição = 'true' -- sempre usar aspas simples(''), pois se usar aspas duplas vai dar erro.

-- (EX. 1) Filtro com condição única
-- Liste os emails dos clientes da nossa base que mora no estado de Santa Catarina

select customer_id, email, state
from sales.customers
where state = 'SC'

-- (Ex. 2) Filtro com mais de uma condição (or)
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina ou Mato Grosso do Sul

select customer_id, email, state
from sales.customers
where state = 'SC' or state = 'MS'

-- (Ex. 3) Filtro de condição com data.
-- Liste os emails dos clientes da nossa base que moram no estado de Santa Catarina ou Mato Grosso do Sul e que
-- tenham mais de 30 anos.

select customer_id, email, state, birth_date
from sales.customers
where (state = 'SC' or state = 'MS') and birth_date < '1994-05-08' -- também pode usar '19940508', sem travessão

---- RESUMO #############################################################################################################
-- (1) Comando utilizado para filtrar linhas de acordo com uma condição.
-- (2) No PostgreSQL são utilizadas aspas simples para delimitar strings.
-- (3) string = sequência de caracteres = texto.
-- (4) Pode-se combinar mais de uma condição utilizando os operadores lógicos.
-- (5) No PostgreSQL as datas são escritas no formato 'YYYY-MM-DD' OU 'YYYYMMDD'.


-- *ORDER BY* PARA QUE SERVE##############################################################################################
-- Serve para ordenar a seleção de acordo com uma regra definida pelo usuário.

-- SINTAXE ###############################################################################################################
select coluna_1, coluna_2, coluna_3
from schema_1.tabela_1
where condição = true
order by coluna_1

-- (Ex.1) Ordenação de valores numéricos.
-- Liste produtos da tabela products na ordem crescente com base no preço.

select *
from sales.products
order by price --desc-> adicona esse comando se quiser ver em ordem descrescente

--(Ex.2) Ordenação em texto.
-- Liste os estados distintos da tabela customers na ordem crescente.

select distinct state, count(state) as qtd -- coluna que mostrará a quantidade de estados por tabela
from sales.customers
group by state -- Conta quantos estados a tabela possui.
order by qtd -- ordena em ordem crescente a quantidade de Estados por tabela.

-- RESUMO ###############################################################################################################
-- (1) Comando utilizado para ordenar a seleção de acordo com uma regra definida.
-- (2) Por padrão o comando ordena na ordem crescente. Para mudar para a ordem decrescente usa-se o comando DESC.
-- (3) No caso de strings a ordenação será em ordem alfabetica.

-- *LIMIT* PARA QUE SERVE ###############################################################################################
-- Serve para limitar o nº de linhas da consulta.
-- Muito utilizado na etapa de exploração de dados.

-- SINTAXE ##############################################################################################################
select coluna_1, coluna_2, coluna_3
from schemaa_1.tabela_1
where condição = true
order by coluna_1
limit N

-- (Ex.1) Seleção das N primeiras linhas usando LIMIT.
-- Liste as 10 primeiras linhas da tabela funnel.

select *
from sales.funnel
limit 10

-- (Ex.2) Seleção das N primeiras linhas usando LIMIT e ORDER BY
-- Liste os 10 produtos mais caros da tabela products

select *
from sales.products
order by price desc
limit 10

-- (Ex.3) Seleção das N primeiras linhas usando LIMIT e ORDER BY
-- Liste os 10 produtos mais baratos da tabela products

select *
from sales.products
order by price 
limit 10

-- RESUMO################################################################################################################ 
-- (1) Comando utilizado para limitar o nº de linhas da consulta.
-- (2) Muito utilizado na etapa de exploração dos dados.
-- (3) Muito utilizado em conjunto com o comando ORDER BY quando o que importa são os TOP Nº. Ex: "Nº de Pagamentos mais 
-- recentes", "N produtos mais caros".

-- EXERCÍCIOS ######################################################################

-- (Exercício 1) Selecione os nomes de cidade distintas que existem no estado de
-- Minas Gerais em ordem alfabética (dados da tabela sales.customers)

select distinct state, city
from sales.customers
where state = 'MG'
order by city

-- (Exercício 2) Selecione o visit_id das 10 compras mais recentes efetuadas
-- (dados da tabela sales.funnel)

select *
from sales.funnel
where paid_date is not null
order by paid_date desc
limit 10

-- (Exercício 3) Selecione todos os dados dos 10 clientes com maior score nascidos
-- após 01/01/2000 (dados da tabela sales.customers)

select *
from sales.customers
where birth_date >= '2000-01-01'
order by score desc
limit 10








 
