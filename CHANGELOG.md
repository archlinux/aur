# SQLcl Release Notes 23.1.0.089.0929

## New Features in 23.2.0

### Named Connections

The connmgr command manages a collection of connections. It allows you to list, show, test and clone connections. It also allows you to import connections from Oracle SQL Developer.

```sh
connmgr import <sql-developer-connections.xml>
connmgr list <connection 1> ... <connection n>

connmgr show <connection-name> USER: hr URL: jdbc:oracle:thin:@//hostname:1521/ORCL

connmgr connmgr test DB213P Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production Connection Test Successful

connmgr clone -ORIGINAL DB213P clone ``` connmgr list ... clone ... 
```

### Saved Connections

The Connect command has been further expanded to include functionality to allow a user to save a connection. This has two formats.

While a user is connecting with the connect command, a `-save <connection-name>` parameter is supported which allows the user to name the current connection details used as a named connection.
Secondly, an existing connection previously created, can also be saved using `connect -save <connection-name>`
Connect or reconnect with that saved connection using `connect -name <connection-name>`

### OCI DB Metrics

The ocidbmetrics command collects metrics from the Oracle Database Dictionary and sends them to the Oracle Cloud Infrastructure (OCI) Metrics service.

The command facilitates setting up a new user with the necessary permissions and initiates the collection of metrics with a 15 second time interval between iterations.

You must have an OCI profile setup to use this feature

```sh
ocidbmetrics setup myuser
ocidbmetrics collect -compartmentId [compartmentId_ocid] -region [region_ocid]
```

## Issues Fixed in 23.2.0

- PLSQL: SHOW ERRORS PERFORMANCE ISSUES WHEN CONNECTING WITH PECULIAR PASSWORD
- LIQUIBASE: SQLCL 22.3 HAS \ INSTEAD OF / IN CONTROLLER.XML ON WINDOWS AS COMPARED TO LINUX/UNIX.
- LIQUIBASE: COMMENTS ADDED TO CONTROLLER.XML FILE IN SQLCL 23.1
- LIQUIBASE: APEX EXPORT FEEDBACK TO DEPLOYMENT SYSTEM CONVERTS THE NAME TO LOWERCASE
- LIQUIBASE: SQLCL HAS \ INSTEAD OF / IN CONTROLLER.XML ON WINDOWS AS COMPARED TO LINUX/UNIX.
- CONNECTIONS: ERROR SHOWN WITH SQLCL WHEN LOGIN.SQL HAS "SHOW CONNECTION"

## New features in 23.1.0.089.0929

* New features for 22.4.0
* named connection..
* 

## New features in 22.3.0

* Introduction of new command framework to standardise commands
* Rewrite of Liquibase suppport to include all new flags and commands
* Support for two factor authentication in connections
* Support for connections to ADBs and ADBd with auto creation of Bastions where needed
* Upgrade of JDBC Drivers to 21.8.0.0.0
* Standardised numbering across distributions from ZIPs to RPMs

## Bugs Fixed

### 22.3.0

This is a selection of the bugs fixed in this release, focussing on customers issues, security and usability.

| bug      | Description                                                                    |
|----------|--------------------------------------------------------------------------------|
| 34624954 | FIX ALL VERSIONS SO THEY ALL MATCH FROM ZIP TO 'SHOW VERSION' COMMAND          |
| 34620477 | APEX EXPORT COMMAND TO EXPORT ALL SUPPORTED TYPES. INCLUDES EXPTYPE            |
| 34619719 | SHOW DATAPUMP - UPDATED TO NEW COMMAND STRUCTURE                               |
| 34609419 | UPGRADE JDBC & UCP 22.1.0.0.0_220912                                           |
| 34605409 | VULNERABILITIES CVE-2022-21510/CVE-2022-21511 IN SQLCL 22.2.1.201.1451         |
| 34484571 | NEW -SOCKSPROXY OPTION NOT DOCUMENTED IN SQLCL USAGE HELP                      |
| 34453113 | SQLCL UPDATE TO FULLY SUPPORT JDK17                                            |
| 34432373 | EXTRA KEYWORDS ADDED TO QUERIES WHEN COPY/PASTING THE CODE IN SQLCL            |
| 34430175 | INSIGHT: FAILING TO BRING UP LIST OF COLUMNS FOR A TABLE, VIA A SYNONYM.       |
| 34379593 | ALTER SESSION SET CURRENT SCHEMA SQLCL FAIL ON TRYING TO CREATE CHANGE LOG TABLE|


# Before You Start

## JRE Support

* SQLcl release 22.2.1 requires Oracle Java version 11 or 17.
* If SQLcl cannot find a local JRE, you will be prompted to enter the location path for the JRE. Note that the prompt wants only the folder, not the java.exe.  For example C:\Program Files\Java\jdk-11.0.11

## Known Issues
Invoking SQL Recall for a previous statement which has a line exceeding the width of your display, the in-line editor will be unable to access or edit the line with the overflow. Workaround this issue by resizing your terminal display wide enough to prevent line-wrapping.

## Platform Support

SQLcl release 22.2.1 is available for Windows 10 and Windows Server 2008/2012, Linux or Mac OS X. (See full [Certification] (https://www-sites.oracle.com/database/technologies/appdev/sqldev/certification.html))
If using a OCI “Thick” connection type, a 21c Oracle Client will be required


## Installing or Upgrading

All new releases of SQLcl and SQL Developer require a full installation. Download and unzip the file into an empty folder. Ensure the "Use folder names" checkbox is checked when unzipping the file.

## Support
Production Releases - you are supported by Oracle Support under your current database Support license for SQL Developer production releases. Log SQL Developer bugs and issues using [My Oracle Support] (http://support.oracle.com/) for the product.
## Feedback
There are a number of different forums supporting the features in SQLcl. When using the forums, be sure to use clear subject lines to initiate a thread and try to avoid using old, unrelated threads for a new issue.

For all SQLcl queries, please use the [SQLcl Forum] (https://community.oracle.com/tech/developers/categories/sqlcl)

## SQL*Plus List of Unsupported Commands and Features

### Commands

* REPHEADER
* REPFOOTER
*System Variables and Environment Settings via the SET Command*

 * autoprint
 * autorecovery
 * cmdsep
 * copytypecheck
 * describe
 * eschar
 * flagger
 * flush
 * fullcolname
 * logsource
 * loboffset
 * markup
 * recsep* 
 * recsepchar
 * shiftinout
 * sqlcase
 * sqlprefix
 * sqlterminator
 * tab
 * underline
 * xmloptimizationcheck
