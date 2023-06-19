# SQLcl Release Notes 23.1.0.089.0929

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
