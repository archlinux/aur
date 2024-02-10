# New Features in 23.4.0

- Updated the underlying open-source Liquibase version from 4.18 to 4.24 for SQLcl's Oracle enhanced Liquibase commands
    - Schema Names in Liquibase Changelogs Tokenized In 23.4 and Moving Forward:
        - In order to properly support the schema possibilities that can be used by the changeset section of a changelog, it became necessary to tokenize the schema name stored in changesets through the format %USER_NAME% in SQLcl 23.4 and moving forward. This tokenization allows for the proper setting of the schema name when generating the database object data definition language (DDL) and avoids edge case complications.
        - For changelogs you have generated prior to 23.4, in order for them to be fully supported in 23.4 and beyond, you will either need to regenerate these changelogs in SQLcl 23.4 or a future version or manually alter your changelogs with %USER_NAME% as so:
            - For changelogs with the <SCHEMA></SCHEMA> XML element, replace the content inside with %USER_NAME%
                - Example: <SCHEMA>%USER_NAME%</SCHEMA>
        - For changelogs that utilize SQL within the CDATA field, attach "%USER_NAME%". to the front of all database object references. If a schema name is in these locations, replace it with "%USER_NAME%".
            - Example:  <n0:source><![CDATA[CREATE OR REPLACE EDITIONABLE PROCEDURE "%USER_NAME%"."P_SQLCLERROR_PROCEDURE" ...
            - Example:  <n0:source><![CDATA[ALTER TABLE "%USER_NAME%"."EMPLOYEES" ADD CONSTRAINT "EMP_JOB_FK" FOREIGN KEY ("JOB_ID") REFERENCES "%USER_NAME%"."JOBS" ("JOB_ID") ENABLE;]]></n0:source>
        - The need for these alterations are only necessary if you are changing schema names between your export and import.
    - The new alias search command allows you to search for aliases and return a resulting list in the syntax of alias search [search string]. The search string will check the contents of your aliases’ name, description, and query.
        - To learn more use the help alias search command in SQLcl
    - Aliases that ship with SQLcl have been updated to have `nulldefaults` set to on by default for bind arguments. For user defined aliases, the user still needs to include the `-nulldefaults` optional parameter when creating their alias for this to be set to on
        - When using an alias, null defaults sets internal binds to NULL where a bind is not declared
    - Introduced command completion for SQLcl commands. Press TAB while typing to autocomplete command names, show available parameters, and cycle through parameter options. First wave of commands with code completion functionality:
        - Alias [`ALIAS`]
        - APEX [`APEX`]
        - Advanced Queuing [`AQ`]
        - Background [`BACKGROUND`]
        - Connect [`CONNECT`]
        - Connection Manager [`CONNMGR`]
        - Jobs [`JOBS`]
        - Liquibase [`LIQUIBASE`]
        - Migration Advisor [`MIGRATEADVISOR`]
        - Secret [`SECRET`]

# Issues Fixed in 23.4.0

There have been many issues fixed in this quarterly release. The main ones of note are:
- Thick Driver Support - Changed -oci to -thick on commandline. sql -thick <url>
- MKStore command upgraded to removed Java SecurityManager restriction
- JDBC upgraded to 21.12.0.0.230906
- SQLCL now checks for java in this order: Embedded JRE > JAVAHOME > $ORACLEHOME > PATH
- SQLCL checks Java version when using $ORACLE_HOME before loading thick client jars
- TNSAdmin search order fixed to: $HOME > $CWD > (windows registry) > $ORACLE_HOME
- SQL Parser fully supports Database 23c updated syntax
- SQL Error positions now correctly reported
- Help for commands now standardized to help <command>
- liquibase update -changelog-file controller.xml fails to update table object at target if constraints are deleted at source
- SQLcl liquibase changelog tables showing in the controller if they are renamed
- SQLcl liquibase removing schema name from strings inside pl/sql objects
- liquibase generate-schema can fail to order scripts correctly based on dependency; e.g. w/ popular logger_user
- Generated trigger SQL file create invalid trigger due to enable trigger statement at the end
- liquibase update fails with npe when the user has the binary_ci default collation
- liquibase generate-apex-object adds spaces to trigger code
- liquibase update overwrites sequences
- SQLcl Liquibase default search path should include the directory in which Liquibase is run
- liquibase generate-apex-object command not placing apex_install.xml in the specified directory when using the -dir parameter
- liquibase generate-schema fails to give an error message when the -filter parameter is used with an invalid filter

# New Features in 23.3.0

- Named Connections, import secure connections
- Enhanced Error Reporting
- Enhanced OCI configuration Support
- Blockchain & Immutable Tables with Certificates
- Codescan command Check .sql, .pls, .plb files for for best practice

## Named Connections

The connmgr command was introduced in 23.2.0 and it has been extended to include more support for importing connections from SQL Developer.

- `connmgr import <sql-developer-connections.xml>`
- `connmgr list <connection 1> ... <connection n>`
- `connmgr show <connection-name> USER: hr URL: jdbc:oracle:thin:@//hostname:1521/ORCL`
- `connmgr connmgr test DB213P Oracle Database 21c Enterprise Edition Release 21.0.0.0.0 - Production Connection Test Successful`
- `connmgr clone -ORIGINAL DB213P clone`

```
connmgr list

<connection 1>
...
clone
...
<connection n>
```

On Windows, the location for storing connections has changed. In 23.2, connection definitions were stored in %HOME%\DBTools; in 23.3, they have been moved to %APPDATA%\DBTools. The command-line flag -migrateconns can be used to migrate 23.2 connections to the new location.

For handling ecrypted connections, the following have been added

- SECRET command for registering secure values
- Adds -key option to connmgr import command to specify a SECRET name for the encryption key
- Adds -strip_passwords flag to connmgr import to automatically strip passwords from imported connections
- This release now reports an error on connmgr import with a bad encryption key subsequently imports the connections with stripped passwords (previously, would skip the import of the file).

For example:

```
SQL>secret set mysecret oracle
Secret mysecret stored

SQL>secret list
mysecret

SQL>connmgr import -key mysecret Connections.json
Importing connection conn1: Success
Importing connection conn2: Success
Importing connection conn3: Success
Importing connection conn4: Success
4 connection(s) processed
```

## Enhanced Error Reporting

As part of 23c Database release, all oracle errors were updated with better explanations and recommendations. In this SQLCL release, links have been added to help clarify error codes that are thrown when there is an issue with a command. The index for all Oracle Errors is now published here

For a SQL query, this looks like
```
SQL>select * from non-existing-tables;

Error starting at line : 1 in command -
select * from non-existing-tables
Error at Command Line : 1 Column : 18
Error report -
SQL Error: ORA-00933: SQL command not properly ended
00933. 00000 -  "SQL command not properly ended"
*Cause:    
*Action:

More Details :
https://docs.oracle.com/error-help/db/ora-00933/
```

For any other Oracle errors thrown, we will display the link to the appropraite page. E.g., for PL/SQL
```
SQL> BEGIN

    non-existing-procedure;
    END;
/
Error starting at line : 1 in command -
BEGIN
non_existing_procedure;
END;
Error report -
ORA-06550: line 2, column 1:
PLS-00201: identifier 'NON_EXISTING_PROCEDURE' must be declared
ORA-06550: line 2, column 1:
PL/SQL: Statement ignored
06550. 00000 -  "line %s, column %s:\n%s"
*Cause:    Usually a PL/SQL compilation error.
*Action:

More Details :
https://docs.oracle.com/error-help/db/ora-06550/
https://docs.oracle.com/error-help/db/pls-00201/
```

## Enhanced OCI configuration Support

- If user has a DEFAULT OCI profile installed, SQLCL will now load it on startup.
```
SQLcl: Release 23.3 Production on Fri Sept 08 13:13:13 2023

Copyright (c) 1982, 2023, Oracle.  All rights reserved.

Connected to:
Oracle Database 23c Enterprise Edition Release 23.0.0.0.0 - Production
Version 23.3.0.23.09

HR@23c >oci profile
Configured Profiles:
    *DEFAULT
        UKWEST
HR@23c >     
``````
- SQLCL now supports OCI configuration inheritance
```
[DEFAULT]

user=ocid1.user.oc1..baabaa
fingerprint=a9:5b:f3:a1:27:d3:89:f8
key_file=/Users/user/.oci/oci_api_key.pem
tenancy=ocid1.tenancy.oc1..baabaatenancy
region=us-phoenix-1
[UKWEST]
region=uk-cardiff-1
```
## Blockchain & Immutable Tables with Certificates

In this release, we are including support for managing blockchain and immutable tables and certificates which are used in them.

The commands create a user friendly way to manage these objects and use extensions of the PL/SQL packages DBMS_BLOCKCHAIN_TABLE, DBMS_IMMUTABLE_TABLE and DBMS_USER_CERTS

- A blockchain table is an append-only table designed for centralized blockchain applications. V2 blockchain tables support schema evolution, delegate signatures, and countersignatures in addition to the functionality found in V1 blockchain tables. Blockchain tables support only DER encoding for X.509 certificates, not PEM encoding.
- Immutable tables are read-only tables that protect data against unauthorized modification. They also prevent against accidental data modifications that may be caused by human errors.
- The certificates command adds and deletes X.509 certificates which are used for signature verification for blockchain tables.

Get more details by using the help for each command

```
help certificate

help blockchain_table
help immutable_table
```

## CODESCAN Command

Check .sql, .pls, .plb files in the directory for SQL Best Practices violations.

This command identifies issues with code using the Trivadis Coding Guidelines which are available on github

For example:

    SQL>set codescan on

    SQL>BEGIN
        BEGIN
            null; 
        END;
    END;
    /

    SQL best practice warning (1,7): G-1010: Try to label your sub blocks 

    PL/SQL procedure successfully completed.

Then fix the problem

    SQL >begin

        <<label>> 
            BEGIN
            NULL;
            END label;
        END;
    /

    PL/SQL procedure successfully completed.

You can also codescan a directory

```
SQL> cd <my code dir>

SQL> CODESCAN
***** /Users/user/source/file1.sql
*** 1 distinct warnings
Warning (25,14): G-2180: Never use quoted identifiers
***** /Users/user/source/file2.sql
*** 1 distinct warnings
Warning (3,15): G-2180: Never use quoted identifiers
***** /Users/user/source/file3.sql
*** 2 distinct warnings
Warning (6,4): G-3130: Try to use ANSI SQL-92 join syntax
Warning (14,4): G-3145: Avoid using SELECT * directly from a table or view
```

## Issues Fixed in 23.3.0

- ALL 3RD PARTY LIBRARIES UPDATED TO LATEST AVAILABLE AND CVE FREE
- SQLCL CANNOT START ON READ-ONLY FILE SYSTEM
- CONNMGR IMPORT IS NOT SUCCESSFUL IF EXPORTED JSON FILE IS FROM OLDER VERSIONS OF SQL DEVELOPER
- CONNECT -NAME NOT ABLE TO CONNECT WITH A SAVED ROLE
- IMPORTING AUTONOMOUS (WALLET) CONNECTIONS FROM SQL DEVELOPER FAILS
- CONNECT SAVE DOES NOT SAVE THE CONNECTION DETAILS IF SQLCL IS NOT CONNECTED TO ANY USER
- LIQUIBASE GENERATE APEX OBJECT COMMAND IS CAPTURING WORKSPACEDISPLAYNAME INSTEAD OF WORKSPACE NAME
- LIQUIBASE COMMANDS ASKING FOR A PASSWORD WHEN IT IS ALREADY CONNECTED
- LIQUIBASE CLONE CONNECTION IS NOT MAINTAINING CURRENT CONTAINER FOR SOME COMMANDS
- LIQUIBASE PARSING ERROR USING LOADUPDATEDATA COMMAND
- LIQUIBASE DATA ISSUE WHEN USING -LIQUIBASE-SCHEMA-NAME
- LIQUIBASE GENERATE APEX OBJECT COMMAND IS CAPTURING WORKSPACEDISPLAYNAME INSTEAD OF WORKSPACE NAME
- LIQUIBASE GEO REMOVES ALL BLANK LINES FROM CODE
- DATAPUMP EXPORT -COPYCLOUD DOES NOT UPLOAD FILES FROM SUBST. VARIABLES
- OCI PROFILE INHERITANCE NOT SUPPORTED
- OCI PROFILE SETTING FAILS ON WINDOWS
- OCI PROFILE AUTHENTICATION ERROR WHEN USING TILDE (~) IN KEY_FILE PROPERTY
- ANONYMOUS BLOCK WITH PRAGMA FAILS TO RUN WITH SQLCL
- INVALID COLUMN INDEX ERROR WHEN RUN SQL STATEMENT WITH "Q" NOTATION
- SERVEROUTPUT OFF SIZE UNLIMITED YET STILL ORU-10027: BUFFER OVERFLOW
- ACCEPT COMMAND WITH HIDE OPTION DOES NOT WORK WITH REDIRECTION

## Restrictions

This section describes the restrictions on use that upgrading has introduced.

**ORACLE_HOME usage**

When using sqlcl in an ORACLE_HOME, it must be a minimum version of 21c.
