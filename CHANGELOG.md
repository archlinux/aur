# CHANGELOG (SNMPTT)

## v1.4 - November 6th, 2013

* Added snmptt.ini option net_snmp_perl_cache_enable to enable caching of Net-SNMP Perl module OID and ENUM translations.  This may speed up translations and reduce CPU load when net_snmp_perl_enable and translate_* options are enabled.
* Fixed bug with snmptthandler-embedded where IP addresses and OIDs were not being detected properly because they contained 'OID:', 'IpAddress:' etc.
* Fixed bug with MATCH.  The PREEXEC $p variable could not be used with MATCH.  PREEXEC is now executed first if MATCH contains $p.
* Fixed bug with syslog.  Log entries were supposed to be logged with snmptt[pid] but instad of the pid it was actually the effective user ID (2980512).
* Fixed bug where the hostname is not detected properly when snmptrapd is configured to not use DNS.
* Fixed bug where if the spool directory is not defined, files may be deleted from the wrong folder (3020696).
* Fixed bug with syslog logging.  Function was not being called properly (3166749).
* Fixed bug with MATCH where number ranges were not working (3397982).
* Fixed bug with multi-line traps (2915658).
* Fixed bug with LOGONLY severity.  EXEC was being executed even if the trap had a severity of LOGONLY (3567744).
* Fixed bug with snmptt hanging if the log message sent to syslog contained a % symbol.  All %'s are now escaped before sending to syslog (3567748).
* Fixed possible bug with MySQL.  Put CONNECT string on one line.
* Fixed bug with not being able to write to the debug log file when running snmptt as non-root if the debug file didn't already exist with the correct permissions at startup.  The ownership of snmptt.debug is now set to daemon_uid before switching to the new uid.  Patch 3423525.
* Installation documentation updates (bug 3425999).

## v1.3 - November 15th, 2009

* Added snmptthandler-embedded - a Net-SNMP snmptrapd embedded Perl version of snmptthandler.
* Added variable substitutions $Be, $Bu, $BE and $Bn for SNMPv3 securityEngineID, securityName, contextEngineID and contextName (requires snmptthandler-embedded handler).
* Added snmptt.ini option duplicate_trap_window variable for duplicate trap detection.
* Added LSB init keywords and actions to snmptt-init.d and changed the priority for start / stop so that it starts after snmptrapd and stops before snmptrapd.
* Changed the default log path to /var/log/snmptt for Unix and c:\snmpt\log for Windows to make it easier to grant write permission to the snmptt process.
* Changed umask for log files to 002 to ensure they are not created as world writable.
* Fixed a bug where the the PID file was being created using the parent (root) PID instead of the child (daemon_uid) when daemon_uid is used.
* The DEBUG log file will now be re-opened when a HUP signal is sent.
* When debugging is enabled, flush buffers every sleep cycle so we can tail the debug log file.
* Don't print messages to the console when starting in daemon mode unless debugging is enabled or an error occurs.
* 'Could not open debug output file!' is no longer reported when debugging is disabled.
* Added snmptt.logrotate file from Ville Skytta.
* Fixed a bug (1748512) with handling escaped quotes in a trap message.
* Updated snmptt-net-snmp-test to test MIB descriptions.
* SNMPTTConvertMIB:
  * Fixed a bug (1678270) where a TRAP-TYPE / NOTIFICATION-TYPE line would not translate if it was split across two lines.

## v1.2 - June 16th, 2007

* When daemon_uid is used, two processes will now be spawned. The first process will be run as the same user that started SNMPTT (which should be root). The second will run as the daemon_uid user. This was changed so that SNMPTT could properly clean up the pid file on exit.
* Added snmptt.ini option pid_file to allow for custom pid file locations when running in daemon mode.
* Fixed bug where pid file did not contain the current pid of snmptt.
* Added snmptt.ini options date_format, time_format, date_time_format, date_time_format_sql and stat_time_format_sql to allow the output format for $x and $X substitution variables, and the format of the date/time for text logs and SQL to be changed using strftime() variables. This allows for proper date/time data types to be used in SQL databases.
* Added logging of trap statistics to a SQL table. Added *table_statistics snmptt.ini variable to define the table to be used.
* Added ability to add custom columns to *_table and *_table_unknown tables. Added sql_custom_columns and sql_custom_columns_unknown snmptt.ini options.
* Added snmptt.ini option unknown_trap_exec_format to allow custom output with substitutions.
* Added the ability to log system messages to a text file in addtion to the existing syslog and Event Log.  Added snmptt.ini options log_system and log_system_file.
* Added a work-around to the Net-SNMP v5.4 traphandle bug (1638225) where the host name was set to <UNKNOWN>. When detected, SNMPTT will use the host IP address instead.
* Added a $H variable substitution to give the host name of the computer that is running SNMPTT, or a user defined value specified in the new snmptt_system_name snmptt.ini option.
* Added MATCH support for bitwise AND
* Added snmptt.ini option exec_escape to escape wildards (* and ?) in EXEC, PREEXEC and the unknown_trap_exec commands. This is enabled by default for Linux and Unix (or anything non-Windows) to prevent the wildcards from being expanded by the shell.
* Moved unknown_trap_exec to Exec section in snmptt.ini.
* Added 'use strict' pragma in source code.
* Experimental:  Added threads (Perl ithreads) support for EXEC. When enabled, EXEC commands will launch in a thread to allow SNMPTT to continue processing other traps. Added snmptt.ini options threads_enable and threads_max.
* Fixed bug where snmptt tried to log to syslog when changing UIDs even if syslog_system_enable was set to 0.
* Fixed a bug in REGEX with handling of captures.  Text::Balanced module is now required.
* Fixed a bug under Windows where SNMPTT was trying to log to syslog instead of the event log.
* Fixed a bug where SNMPTT was attempting to log to syslog / eventlog when using the --time option.
* Fixed a bug in MATCH where the i modifier was not handled correctly.
* Added information to Nagios section of documentation for using SNMP traps as heartbeats by using freshness checks.
* Added information to Nagios section of documentation for using freshness checks to automatically clear trap alerts.
* SNMPTTConvertMIB:
  * Fixed a bug (1438394) where ARGUMENTS lines that have $1, $2 etc instead of %0, %1 would not translate.
  * Fixed a bug where a --#SEVERITYMAP line would be used instead of --#SEVERITY.

## v1.1 - January 17th, 2006

* Added PREEXEC snmptt.conf file option to allow an external program to be run before processing the FORMAT and EXEC lines. The output of the external program is stored in the $pn variable where n is a number starting from 1. Multiple PREEXEC lines are permitted. The first PREEXEC stores the result of the command in $p1, the second in $p2 etc. Any ending newlines are removed. The snmptt.ini parameter pre_exec_enable can be used to enable / disable it.
* MATCH statement now accepts any variable name instead of only enterprise variables. Example: MATCH $s:(Normal)
* Added NODES MODE= snmptt.conf file option to allow you to select either POS (positive - the default) or NEG (negative) for NODES matches. If set to NEG, then NODES is a 'match' only if none of the NODES entries match.
* Added unknown_trap_exec snmptt.ini option. If defined, the command will be executed for ALL unknown traps. Passed to the command will be all standard and enterprise variables, similar to unknown_trap_log_file but without the newlines.
* snmptt --dump which dumps all the configured EVENTs, now displays duplicate EVENT entries to assist with troubleshooting duplicate entries trap logs.
* If the debug log file can not be opened, a message is now logged to syslog if syslog_system_enable is enabled, and to the Event Log if eventlog_system_enable is enabled
* Fixed bug with PostgreSQL where some trap data was interpreted as 'placeholders' in the INSERT statement which caused logging errors. PostgreSQL now uses PREPARE / EXECUTE statements instead.
* MySQL now uses PREPARE / EXECUTE statements instead of a single INSERT statement.
* Fixed bug in NODES where NODES entries from previous EVENTs were not being purged correctly.
* Fixed bug where snmptt --dump would attempt to log to syslog or the Event Log.
* Fixed bug that prevented the wildcard .* from being accepted on the EVENT line.
* Added Windows Event Log forwarding documentation to integration section.
* SNMPTTConvertMIB:
  * Fixed a bug when --format_desc=n was used that caused extra trailing whitespaces to be added for every non existent line in the description.
  * Fixed bug that prevented some MIBs from being accepted due to spacing in the DEFINITIONS::= line.
  * Fixed bug in that prevented --ARGUMENTS {} from being parsed due to spacing.

## 1.0 - August 30, 2004

* SQL database connections are now opened after forking to the background when running in daemon mode, and after changing users when running SNMPTT as a non-root user. This should prevent 'gone away' and other connection problems with SQL databases due to lost handles.
* Added mysql_ping_on_insert, postgresql_ping_on_insert and dbd_odbc_ping_on_insert options to 'ping' the database before doing an INSERT. Also added the options mysql_ping_interval, postgresql_ping_interval and dbd_odbc_ping_interval to periodically ping the database. These options will help ensure the connection to the database remains available. If an error is returned, it will attempt to reconnect to the database. This should prevent SNMPTT from having to be restarted if the SQL server is not available due to an outage or a connection timeout due to no activity.
* Added variable substitution $Fz which when used on an EXEC line will dump the translated FORMAT line. This will allow for simplified EXEC lines when they are the same as the FORMAT line (minus the command to execute of course).
* Added variable substitutions $Fa, $Ff, $Fn, $Fr, $Ft, for alarm (bell), form feed (FF), newline (LF, NL), return (CR) and tab (HT, TAB)
* Added variable substitution $D to dump the description text for FORMAT and EXEC lines. The descriptions can be pulled from either the SNMPTT.CONF or MIB files. This is controlled by the description_mode and description_clean snmptt.ini options.
* Added support for logging unknown traps to a SQL table
* Added logging of statistical information for total traps received, total traps translated, total traps ignored and total unknown traps. Statistics are logged at shut down, and optionally at a defined interval defined by the new snmptt.ini variable statistics_interval. Logging can also be forced by sending the SIGUSR1 signal, or by creating a file called !statistics in the spool folder.
* Added the error number reported by MySQL to MySQL errors (system syslog, eventlog etc)
* Added /usr/local/etc/snmp and /usr/local/etc paths to the list of default directories searched for snmptt.ini.
* Added some friendly error messages when required Perl modules are not available
* Fixed bug with with handling traps in symbolic format (snmptrapd without -On)
* Fixed bug with with using printing $ symbols in FORMAT and EXEC lines
* Added Simple Event Correlator (SEC) integration documentation
* SNMPTTConvertMIB:
  * Fixed bug that prevented the variable list (OBJECTS) of V2 MIB files from being converted
  * Fixed bug that caused an infinite loop processing the VARIABLES/OBJECTS section if the line in the MIB file contained spaces after the closing bracket

## 0.9 - November 3rd, 2003

* Syslog messages are now logged with snmptt[pid] instead of TRAPD for traps, and snmptt-sys[pid] instead of SNMPTT for system messages
* Added the option daemon_uid which causes snmptt to change to a different user (uid) after launching on Unix systems running in daemon mode
* Fixed bug that prevented ip addresses from being detected correctly with translate_value_oids
* Fixed bug with MATCH that caused integer ranges from not being handled correctly
* Separated SNMPTT, SNMPTTCONVERT, SNMPTTCONVERTMIB and FAQ / Troubleshooting documentation into separate documents

## 0.8 - September 16th, 2003

* Added MATCH keyword support to allow trap matching based on values contained inside the trap enterprise variables
* REGEX now supports substitution with captures and the modifiers i, g and e.  The e modifier allows for complex REGEX expressions.
* Added support for remote MySQL and PostgreSQL databases
* Added PostgreSQL support for DBD:Pg
* An EVENT can now contain mulitple EXEC lines
* An EVENT can now contain mulitple NODES lines
* Added the option dynamic_nodes to allow NODES files to be either loaded at startup or loaded each time an EVENT is processed
* Added trapoid column for database logging to contain the actual trap received.  The eventid column will contain the actual matched entry from the .conf file (which could be a wildcard OID)
* Fixed bug that prevented some variables from displaying the correct values because the received trap OID was replaced with the actual EVENT entry
* Fixed bug that caused OIDs not to be translated correctly with translate_value_oids enabled
* Agent IP address is now used instead of 'host' IP address for NODES matches, the 'hostname' column in database logs and the $A variable
* Variable $A now prints the agent host name.  $aA prints the agent IP address.
* Variable $E now prints the enterprise in symbolic form.  $e prints the numeric OID
* Variable $O now prints the trap in symbolic form.  $o prints the numeric OID
* Added new variable substitution $i to print the actual matched entry from the .conf file (which could be a wildcard OID)
* Added the configuration option dns_enable to enable DNS lookups on host and agent IP addresses
* If DNS is enabled, NODES entries are resolved to IP addresses and the IP address is used to perform the match.  This will allow for aliases to be used.
* Added the option resolve_value_ip_addresses to resolve ip addresses contained inside enterprise variable values
* Changed snmptt.ini setting translate_trap_oid to translate_log_trap_oid
* Changed snmptt.ini setting translate_oids to translate_value_oids
* Added configuraiton settings: translate_enterprise_oid_format, translate_trap_oid_format, translate_varname_oid_format and db_translate_enterprise
* $O follows translate_trap_oid_format, and $o is always the numerical trap OID
* $E follows translate_enterprise_oid_format, and $e is always the numerical enterprise OID
* The enterprise column when logging to a database now follows the db_translate_enterprise setting
* Fixed bug with $# to report the correct number of enterprise variables (was 1 lower than it should have been)
* Fixed bug with handling traps that contain quoted values that span multiple lines
* PID file now created (/var/run/snmptt.pid or ./snmptt.pid) when running in daemon mode on Linux / Unix.  snmptt-init.d script updated to remove the pid file when shutting down snmptt.
* Added Nagios / Netsaint integration documentation
* Added contrib folder
* Snmpttconvertmib
  * Now prints the variables contained in each trap definition unless --no_variables is set.  When using --net_snmp_perl it will also resolve the Syntax (INTEGER, OCTETSTR etc) and Description.  If it's an INTEGER, will also print out the enumeration tags if any exist.
  * Improved compatability with MIB files

## 0.7 - April 17th, 2003

* Fixes a vulnerability that prevents the possibility of injected commands contained in traps from being executed when using the EXEC feature
* Added the ability for traps passed from snmptrapd or loaded from the snmptt.conf files to contain symbolic OIDs such as linkDown and IF-MIB::linkUp.  This feature requires the UCD-SNMP / Net-SNMP Perl module
* Added the configuration options translate_trap_oid and translate_oids to have the trap OID and OID values contained in the trap variables converted from numerical OID to symbolic form before logging.  This feature requires the UCD-SNMP / Net-SNMP Perl module
* Added support for logging of traps using PostgreSQL via DBI / DBD::PgPP
* Added REGEX keyword support to allow user definable search and replace on FORMAT / EXEC lines
* NODES entry can now contain a CIDR address (eg: 192.168.10.0/23), or a network range (192.168.10.0-192.168.11.255)
* NODES entry can now contain a mix of host names, IP addresses, CIDR addresses, network ranges and filenames
* Added the ability to force a reload of the configuration files while running in daemon mode by placing a file called !reload in the spool directory
* Added snmptt-net-snmp-test program to perform various translations of numeric and symbolic OIDS to assist with determining if the installed Perl module
* will function as expected with SNMPTT
* Fixed bug that prevented quoted text from being logged correctly to SQL databases
* Fixed bug that would prevent the translation of integer values to enumeration tags and variable name substitutions when using Net-SNMP 5.0.x
* Snmpttconvertmib
  * FORMAT / EXEC line can now contain any of the following:
    * --#SUMMARY or DESCRIPTION (use DESCRIPTION only if --#SUMMARY does not exist)
    * description or --#SUMMARY (use --#SUMMARY only if DESCRIPTION does not exist)
    * --#SUMMARY and DESCRIPTION
    * DESCRIPTION and --#SUMMARY
  * When using the DESCRIPTION to build the FORMAT / EXEC line, can now choose between using the first line of the DESCRIPTION field, or the first x number of sentences
  * The use of the --#SUMMARY and DESCRIPTION line for the FORMAT / EXEC line can be disabled
  * Support for multiple --#SUMMARY lines
  * Support for --#SEVERITY lines
  * The default of using the $* wildcard can be disabled
  * Conversion of the DESCRIPTION section to SDESC / EDESC can be disabled
  * EXEC line can be specified on the command line
  * NODES line can be specified on the command line

## 0.6 - March 25th, 2003

* Logging:
  * Added support for logging of traps using DBD::ODBC
  * Fixed bug with Win32::ODBC connection not being closed on exit of SNMPTT
  * MySQL code cleanup
  * Added support for logging traps to the NT Event Log including the ability to select the Event Log level based on the severity level defined in the snmptt.conf file
  * Improved syslog support by adding the ability to select the syslog level based on the severity level defined in the snmptt.conf file
  * Added syslog and NT Event Log support for SNMPTT 'system' events such as startup, shutdown, errors handling spool directory / files, database connectivity errors etc
  * Added the option keep_unlogged_traps to have SNMPTT erase the spooled trap file only after it successfully logs to at least one or all log systems.  This will help prevent traps from being lost due to logging problems.
* Added ability to translate integer values to enumeration tags defined in MIB files.  This feature requires the UCD-SNMP / Net-SNMP Perl module
* Added new variable substitutions: $vn (variable name), $+n(variable name:value), $-n (variable name (type):value), $+* (same as $+n but wildcard), and $-* (same as $-n but wildcard).  Translation of the variable name using the MIB requires the UCD-SNMP / Net-SNMP Perl module.
* If a variable is passed from snmptrapd that is blank, snmptt will replace it with (null)
* Fixed bug that would prevent variables numbered 10 or higher from being translated correctly
* Fixed bug with handling trap data that contains spaces but is not inside of quotes
* Code cleanup to remove Perl warnings (-w)
* Added separate debug file for snmptthandler
* Cleaned up defaults code for snmptthandler
* Added examples folder containg a sample snmptt.conf file and sample trap file
* Added FAQ section to this document
* Snmpttconvertmib
  * Code cleanup
  * Now uses new command line arguments (snmpttconvertmib -h for help).
  * Can now use either snmptranslate or the SNMP Perl module (Net-SNMP) to process MIB files
  * Can now add a NODES line when converting MIB files
  * Now checks the version of snmptranslate before converting the mib to ensure snmptranslate is called correctly
  * Fixed bug which would cause the last notification of a v2 MIB file not to be converted correctly

## 0.5 - February 12th, 2003

* Spool file list sorted before processing to ensure traps are processed in the order they are received when in daemon mode
* Added use_trap_time variable to config file for daemon mode to have SNMPTT use either the time from the spool file, or the current time.  Changed SNMPTTHANDLER to output the current date and time on the first line of the spool file
* Fixed bug with default variable settings being ignored.  Defaults were not being set correctly if variable was not defined in the .ini file.
* Fixed bug with SNMPTT ignoring the daemon mode parameter in the .ini file
* Fixed bug with Nodes list not being flushed out for each processed trap when running in daemon mode
* Added strip_domain and strip_domain_list configuration options to enable / disable the removal of the domain name from the host name passed to SNMPTT.  Defaults to disabled (do not  strip domain name)
* SNMPTTCONVERTMIB now prepends the contents of the --#TYPE line (if present) to the --#SUMMARY line to provide a more descriptive FORMAT / EXEC line

## 0.4 - November 18th, 2002

* Variable substitution changes:
  * $X = Date, $x = Time instead of $x being both date and time
  * $N = Event name instead of $S
  * Added $c, $@, $O, $o, $ar, $R, $aR, $G, $S
* Configuration moved to a .ini file
* MySQL support via DBI under Linux and Windows
* ODBC support via Win32::ODBC under Windows

## 0.3 - September 11th, 2002

* Daemon mode support for SNMPTT.  When running as a daemon, SNMPTTHANDLER script is used to spool traps from SNMPTRAPD.
* SNMPTTCONVERTMIB utility to convert trap / notify definitions from MIB files
* Sample trap file (sample-trap) for testing
* Command line options to SNMPTT
* SNMPTT now strips UDP: and :port from IP addresses when using Net-SNMP 5.0+
* NODES files can now contain comments
* NODES files can now contain either host names or IP addresses
* You can now have multiple definitions of the same trap so that different hosts / nodes can have different actions or one host have multiple actions
* Configuration file can now contain a list of other configuration files to load

## 0.2 - July 10th, 2002

* Improved debugging output
* Severity substitution bug fix
* SNMP V2 trap bug fix
* UCD-SNMP v4.2.3 problem workaround

## 0.1 - April 18th, 2002

* Initial release
