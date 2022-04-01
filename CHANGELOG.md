# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

## [Unreleased]

### Added
- Added Explicit Compliance [#1495](https://github.com/greenbone/gsa/pull/1495)
- added tasktrendgroup component for tasks filter dialog [#1511](https://github.com/greenbone/gsa/pull/1511)
- Added HorizontalSep component for horizontal lists. [#1494](https://github.com/greenbone/gsa/pull/1494)
- added BooleanFilterGroup and changed notes filter dialog [#1493](https://github.com/greenbone/gsa/pull/1493)
- Added grow option to multiselect component [#1485](https://github.com/greenbone/gsa/pull/1485)
- Add LogoutIcon [#1481](https://github.com/greenbone/gsa/pull/1481)
- Added a component "SeverityValuesGroup" enabling user choose the relation they want [#1477](https://github.com/greenbone/gsa/pull/1477)
- Added filter keywords owner, host, cvss base score, vulnerability and location to filter dialog on results page [#1472](https://github.com/greenbone/gsa/pull/1472)
- Add storybook [#1272](https://github.com/greenbone/gsa/pull/1286)
- Added TLS certificates to the asset management.
  [#1455](https://github.com/greenbone/gsa/pull/1455),
  [#1461](https://github.com/greenbone/gsa/pull/1461)
- Add usage type to task and scanconfig commands [#1460](https://github.com/greenbone/gsa/pull/1460)
  [#1466](https://github.com/greenbone/gsa/pull/1466) [#1467](https://github.com/greenbone/gsa/pull/1467)

### Changed
- Use fast xml parser by default [#1556](https://github.com/greenbone/gsa/pull/1556)
- Updated dependencies [#1555](https://github.com/greenbone/gsa/pull/1555)
- Changed schedule dialog (added Now button) to help users jump to current time ASAP [#1519](https://github.com/greenbone/gsa/pull/1519)
- Changed the filter dialogues for tasks and overrides [#1511](https://github.com/greenbone/gsa/pull/1511)
- modified filterdialogs for reports and vulnerabilities [#1503](https://github.com/greenbone/gsa/pull/1503)
- Changed filterdialog for tickets page [#1489](https://github.com/greenbone/gsa/pull/1489)
- Restructured menu categories [#1481](https://github.com/greenbone/gsa/pull/1481)
- Logout and usersettings link got a menu [#1481](https://github.com/greenbone/gsa/pull/1481)
- Modified the BarChart's y-domain to avoid range [0,0]. [#1447](https://github.com/greenbone/gsa/pull/1447)
- Changed FilterTerm to convert all filter keywords to lower case [#1444](https://github.com/greenbone/gsa/pull/1444)
- Use Reacts new ref API (no innerRef anymore [#1441](https://github.com/greenbone/gsa/pull/1441))
- Allow dynamic ref types in NVT model and adjust CertLink to it [#1434](https://github.com/greenbone/gsa/pull/1434)
- Use new ref structure in NVTs [#1424](https://github.com/greenbone/gsa/pull/1424)
- Use HTTPS for documentation links
- Cleanup and improve handling of http parameters and arguments for gmp
  requests in gsad [#1355](https://github.com/greenbone/gsa/pull/1355)

### Fixed
- fixed secinfo severitybars not displaying severity.[#1530](https://github.com/greenbone/gsa/pull/1530)
- Fixed outer click issues for multi select and select boxes
  [#1504](https://github.com/greenbone/gsa/pull/1504)

### Removed
- Removed UserLink component [#1481](https://github.com/greenbone/gsa/pull/1481)
- Remove edit_config command from gsad [#1439](https://github.com/greenbone/gsa/pull/1439)
- Remove copyright from gsad version output [#1379](https://github.com/greenbone/gsa/pull/1379)

[Unreleased]: https://github.com/greenbone/gsa/compare/gsa-8.0...master

## [8.0.2] - unreleased

### Added
- Added an explicit get_capabilities command to gsad [#1538](https://github.com/greenbone/gsa/pull/1538)
- Highlight result diffs at delta reports [#1513](https://github.com/greenbone/gsa/pull/1513)
- Added HorizontalSep component for horizontal lists
  [#1506](https://github.com/greenbone/gsa/pull/1506),
  [#1507](https://github.com/greenbone/gsa/pull/1507)

### Changed
- Redirect to main page when visiting the login page and the user is already
  logged in [#1508](https://github.com/greenbone/gsa/pull/1508)

### Fixed
- Always show an identifier for results [#1543](https://github.com/greenbone/gsa/pull/1543)
- Don't crash Alerts listpage and trashcan when Alert data is missing [#1541](https://github.com/greenbone/gsa/pull/1541)
- Fix calculating the next date of schedules [#1539](https://github.com/greenbone/gsa/pull/1539)
- Fix linking to best OS in host details [#1528](https://github.com/greenbone/gsa/pull/1528)
- Redirect to root URL by default [#1517](https://github.com/greenbone/gsa/pull/1517)
- Fix showing details for tasks [#1515](https://github.com/greenbone/gsa/pull/1515)
- Allow to use additional options for starting gsad via systemd
  [#1514](https://github.com/greenbone/gsa/pull/1514)
- Fix using filename templates from usersettings [#1512](https://github.com/greenbone/gsa/pull/1512)

[8.0.2]: https://github.com/greenbone/gsa/compare/v8.0.1...gsa-8.0

## [8.0.1] - 2019-07-17

### Added
- Added systemd service file and logrotate config to gsad [#1486](https://github.com/greenbone/gsa/pull/1486)
- Additional report-host information [#1468](https://github.com/greenbone/gsa/pull/1468)
- New VerifyNoIcon [#1468](https://github.com/greenbone/gsa/pull/1468)
- Add tests for filter groups [#1419](https://github.com/greenbone/gsa/pull/1419)
- Add tests for severitylevelsgroup, radio button and task trend [#1413](https://github.com/greenbone/gsa/pull/1413)
- Allow to show error details [#1403](https://github.com/greenbone/gsa/pull/1403)
- Add test for solution type group [#1402](https://github.com/greenbone/gsa/pull/1402)
- Add tests for loginpage and structure components [#1390](https://github.com/greenbone/gsa/pull/1390)
- Add getAllEntities() and loadAllEntities() actions and reducers to entities store [#1345](https://github.com/greenbone/gsa/pull/1345)
- Add missing tool tips to credential download icons [#1335](https://github.com/greenbone/gsa/pull/1335)
- Add type column to scan configs to allow filter and sort by scan config type [#1331](https://github.com/greenbone/gsa/pull/1331)
- Add some tests for bar components [#1328](https://github.com/greenbone/gsa/pull/1328)
- Add new DefaultFilterSettings to UserSettings [#1326](https://github.com/greenbone/gsa/pull/1326)
- Add warning for IE11 [#1322](https://github.com/greenbone/gsa/pull/1322)
- Add tests for label and img [#1313](https://github.com/greenbone/gsa/pull/1313)
- German translation
  [#1311](https://github.com/greenbone/gsa/pull/1311),
  [#1323](https://github.com/greenbone/gsa/pull/1323),
  [#1403](https://github.com/greenbone/gsa/pull/1403)
- Add tests for comment and badge [#1309](https://github.com/greenbone/gsa/pull/1309)
- Add error dialog to fix missing error messages in trashcan [#1286](https://github.com/greenbone/gsa/pull/1286)
- Display current result, comparable result and diff between results for delta
  reports and their results in delta state "changed" [#1284](https://github.com/greenbone/gsa/pull/1284)
- Add tooltips to deactivated text fields in AlertDialog [#1269](https://github.com/greenbone/gsa/pull/1269)

### Changed
- Brand the Loading indicator [#1469](https://github.com/greenbone/gsa/pull/1469)
- Always load notes and overrides when getting results [#1446](https://github.com/greenbone/gsa/pull/1446)
- Disable some FileFields when RadioButton is not checked [#1430](https://github.com/greenbone/gsa/pull/1430)
- Change checkboxes for solution types to radio buttons [#1398](https://github.com/greenbone/gsa/pull/1398)
- Link to search in the manual for vulnerabilities [#1391](https://github.com/greenbone/gsa/pull/1391)
- Separate tasks using this scan config with commas [#1384](https://github.com/greenbone/gsa/pull/1384)
- Don't allow to verify predefined report formats [#1378](https://github.com/greenbone/gsa/pull/1378)
- Avoid storing config.js in browser cache [#1372](https://github.com/greenbone/gsa/pull/1372)
- Display data loading errors at list pages [#1349](https://github.com/greenbone/gsa/pull/1349)
- Improve login page [#1347](https://github.com/greenbone/gsa/pull/1347)
- Remove options for not implemented languages [#1344](https://github.com/greenbone/gsa/pull/1344)
- Render all dates in the current configured timezone of the user
  [#1327](https://github.com/greenbone/gsa/pull/1327),
  [#1329](https://github.com/greenbone/gsa/pull/1329),
  [#1332](https://github.com/greenbone/gsa/pull/1332)
- Change default PortList for NewTargetDialog [#1321](https://github.com/greenbone/gsa/pull/1321)
- Update dependencies of react, react-dom, react-redux and create-react-app [#1312](https://github.com/greenbone/gsa/pull/1312)
- Adjust clickable area of Select [#1296](https://github.com/greenbone/gsa/pull/1296)
- Update dialog for Task Wizard, Advanced Task Wizard and Modify Task Wizard [#1287](https://github.com/greenbone/gsa/pull/1287)
- Disable inputs for improper option selection in EmailMethodPart of
  AlertDialog [#1266](https://github.com/greenbone/gsa/pull/1266)
- Cleanup get_report function in gsad [#1263](https://github.com/greenbone/gsa/pull/1263)

### Fixed

- Displaying delta information at result details [#1499](https://github.com/greenbone/gsa/pull/1499)
- Don't crash Alerts listpage and trashcan when Alert data is missing [#1498](https://github.com/greenbone/gsa/pull/1498)
- Show full filter term in content composer [#1496](https://github.com/greenbone/gsa/pull/1496)
- Fix finding python modules
  [#1483](https://github.com/greenbone/gsa/pull/1483)
  [#1484](https://github.com/greenbone/gsa/pull/1484)
- Fix displaying schedules created during migration [#1479](https://github.com/greenbone/gsa/pull/1478)
- Fix showing Loading indicator at entities pages [#1469](https://github.com/greenbone/gsa/pull/1469)
- Show notes and overrides for results and their icon indicator in results rows [#1446](https://github.com/greenbone/gsa/pull/1446)
- Display text if gvm-libs is build without LDAP and/or Radius support [#1437](https://github.com/greenbone/gsa/pull/1437)
- Fix sending related resources in permission.create() [#1432](https://github.com/greenbone/gsa/pull/1432)
- Don't allow bulk tagging vulnerabilities [#1429](https://github.com/greenbone/gsa/pull/1429)
- Fix "given type was invalid" error for saving filters [#1428](https://github.com/greenbone/gsa/pull/1428)
- Fix parsing CVSS authentication SINGLE_INSTANCE [#1427](https://github.com/greenbone/gsa/pull/1427)
- Fix loading data on login [#1426](https://github.com/greenbone/gsa/pull/1426)
- Fix result undefined error on result details [#1423](https://github.com/greenbone/gsa/pull/1423)
- Fix showing Scanner Preferences in EditScanConfigDialog [#1420](https://github.com/greenbone/gsa/pull/1420)
- Don't crash if second result for delta is undefined [#1418](https://github.com/greenbone/gsa/pull/1418)
- Fix xml decoding issues with fast-xml-parser [#1414](https://github.com/greenbone/gsa/pull/1414)
- Fix translation for task status and task trend tooltip [#1409](https://github.com/greenbone/gsa/pull/1409)
- Fix problems with German translation in Add Dashboard dialog, SolutionTypeGroup and SeverityClassLabel [#1412](https://github.com/greenbone/gsa/pull/1412)
- Fix some translation bugs (statusbar, about page, table header tooltips)[#1407](https://github.com/greenbone/gsa/pull/1407)
- Fix checking if an entity is in use [#1406](https://github.com/greenbone/gsa/pull/1406)
- Fix "Invalid date" string for scan times [#1405](https://github.com/greenbone/gsa/pull/1405)
- Fix missing "Applied filter" message for "NVTs by Family" chart [#1404](https://github.com/greenbone/gsa/pull/1404)
- Load all filters and report formats at the report details page [#1401](https://github.com/greenbone/gsa/pull/1401)
- Fix rendering reports list page if user has no report formats [#1400](https://github.com/greenbone/gsa/pull/1400)
- Don't link to hosts not being added to the assets [#1399](https://github.com/greenbone/gsa/pull/1399)
- Fix adding and removing host assets at the report details [#1397](https://github.com/greenbone/gsa/pull/1397)
- Fix displaying the observer group name at tasks list page [#1393](https://github.com/greenbone/gsa/pull/1393)
- Improve EditScanConfigDialog performance (delete styles from svg-Icons) [#1388](https://github.com/greenbone/gsa/pull/1388)
- Fix race condition in EditUserSettingsDialog and loading all default filters [#1383](https://github.com/greenbone/gsa/pull/1383)
- Fix scheduled task tooltip time format [#1382](https://github.com/greenbone/gsa/pull/1382)
- Fix updating Titlebar after session timeout [#1377](https://github.com/greenbone/gsa/pull/1377)
- Use German manual for *DE* locale [#1372](https://github.com/greenbone/gsa/pull/1372)
- Load all container tasks for report import dialog from redux store [#1370](https://github.com/greenbone/gsa/pull/1370)
- Don't render *Invalid Date* [#1368](https://github.com/greenbone/gsa/pull/1368)
- Don't show error message after re-login [#1366](https://github.com/greenbone/gsa/pull/1366)
- Fix creating permissions in Roles dialog [#1365](https://github.com/greenbone/gsa/pull/1365)
- Fix cloning permission for Roles [#1361](https://github.com/greenbone/gsa/pull/1361)
- Use correct loaded filter in entities container [#1359](https://github.com/greenbone/gsa/pull/1359)
- Fix parsing a filter id of '0' [#1358](https://github.com/greenbone/gsa/pull/1358)
- Parse report timestamp as date object [#1357](https://github.com/greenbone/gsa/pull/1357)
- Don't crash topology chart if host has no severity [#1356](https://github.com/greenbone/gsa/pull/1356)
- Fix loading time measurements for list pages [#1352](https://github.com/greenbone/gsa/pull/1352)
- Fix rendering DateTime without dates being passed [#1343](https://github.com/greenbone/gsa/pull/1343)
- Fix restarting reload timers
  [#1341](https://github.com/greenbone/gsa/pull/1341),
  [#1351](https://github.com/greenbone/gsa/pull/1351),
  [#1389](https://github.com/greenbone/gsa/pull/1389),
  [#1396](https://github.com/greenbone/gsa/pull/1396)
- Fix list of excluded hosts formatting [#1340](https://github.com/greenbone/gsa/pull/1340)
- Fix installation of locale files [#1330](https://github.com/greenbone/gsa/pull/1330)
- Fix list of options of possible Filter types [#1326](https://github.com/greenbone/gsa/pull/1326)
- Fix timezone handling at performance page [#1325](https://github.com/greenbone/gsa/pull/1325)
- Fix creating and editing alerts without a result filter [#1315](https://github.com/greenbone/gsa/pull/1315)
- Fix filter selection at report details page [#1314](https://github.com/greenbone/gsa/pull/1314)
- Fix using default results filter at report details page
  [#1314](https://github.com/greenbone/gsa/pull/1314),
  [#1333](https://github.com/greenbone/gsa/pull/1333)
- Fix loading filters at permission list page [#1306](https://github.com/greenbone/gsa/pull/1306)
- Fix filter in Report Results view cannot be saved & Fix error for create filter with no available results [#1303](https://github.com/greenbone/gsa/pull/1303)
- Fix creating permissions via the create multiple permissions dialog [#1302](https://github.com/greenbone/gsa/pull/1302)
- Fix showing host in Scanner dialog [#1301](https://github.com/greenbone/gsa/pull/1301)
- Fix detailslinks in AllSecInfo [#1299](https://github.com/greenbone/gsa/pull/1299)
- Only run libmicrohttp in debug mode if gsad build type is debug [#1295](https://github.com/greenbone/gsa/pull/1295)
- Fix dialog can be moved outside browser frame [#1294](https://github.com/greenbone/gsa/pull/1294)
- Fix permission description [#1292](https://github.com/greenbone/gsa/pull/1292)
- Fix port ranges from file radio button [#1291](https://github.com/greenbone/gsa/pull/1291)
- Don't run more then one reload timer for a page [#1289](https://github.com/greenbone/gsa/pull/1289)
- Set first=1 when starting delta report selection [#1288](https://github.com/greenbone/gsa/pull/1288)
- Fix pagination with default filter (reset filter.id if filter is changed) [#1288](https://github.com/greenbone/gsa/pull/1288)
- Fix setting filters at report details page with less and greater then relations
  and quotes in the value [#1288](https://github.com/greenbone/gsa/pull/1288)
- Fix New Target dialog contains value from Edit Target [#1281](https://github.com/greenbone/gsa/pull/1281)
- Fix opening alert report composer [#1280](https://github.com/greenbone/gsa/pull/1280) [#1276](https://github.com/greenbone/gsa/pull/1276)
- Fix showing authentication methods in user dialog [#1278](https://github.com/greenbone/gsa/pull/1278)
- Fix Result details page [#1275](https://github.com/greenbone/gsa/pull/1275)
- Fix displaying reserved filter keywords in content composer [#1268](https://github.com/greenbone/gsa/pull/1268)
- Fix GSA version at about page [#1264](https://github.com/greenbone/gsa/pull/1264)
- Fix link to protocol documentation at about page [#1264](https://github.com/greenbone/gsa/pull/1264)
- Fix testing alerts [#1260](https://github.com/greenbone/gsa/pull/1260)
- Fix release build [#1259](https://github.com/greenbone/gsa/pull/1259), [#1265](https://github.com/greenbone/gsa/pull/1265)

### Removed
- Remove old tool tips from credential download icons because they are not visible and update new tool tips [#1338](https://github.com/greenbone/gsa/pull/1338)
- Remove sort by credential from Target view [1300](https://github.com/greenbone/gsa/pull/1300)
- Remove fifth from schedule [#1279](https://github.com/greenbone/gsa/pull/1279)
- Removed obsolete CLI arguments [#1265](https://github.com/greenbone/gsa/pull/1265)
  - --login-label
  - --http-guest-chart-frame-opts
  - --http-guest-chart-csp
  - --guest-username
  - --guest-password

[8.0.1]: https://github.com/greenbone/gsa/compare/v8.0.0...gsa-8.0

## [8.0.0] - 2018-04-05

This is the first release of the gsa module 8.0 for the Greenbone
Vulnerability Management (GVM) framework.

This release introduces an entirely re-written version of GSA with an overhauled
new user interface technology, switching from XSLT-generated web pages per
request to a single page JavaScript application. The XSLT got removed
completely and was replaced by a modern JS application allowing to add features
and usability improvements faster and easier in future.

The web server daemon (gsad) got a big code cleanup and improvements. Due to
changing to a JS application it doesn't generate any HTML code anymore. Now gsad
only ships static files and acts as some kind of http proxy between the JS
based GSA and gvmd.

Apart from this, the module covers a number of significant advances
and clean-ups compared to the previous gsa module.

### Added
- Display error message if an entity couldn't be loaded [#1252](https://github.com/greenbone/gsa/pull/1252)
- Support old secinfo URLs and redirect to replacement pages [#1247](https://github.com/greenbone/gsa/pull/1247)
- Add guest user login support [#1246](https://github.com/greenbone/gsa/pull/1246)
- Allow to set default host and operating system filters [#1243](https://github.com/greenbone/gsa/pull/1243)
- Add confirmation dialog when creating a user without a role [#1224](https://github.com/greenbone/gsa/pull/1224)
- Use dialogs to edit LDAP and RADIUS authentication [#1212](https://github.com/greenbone/gsa/pull/1212),
  [#1213](https://github.com/greenbone/gsa/pull/1213)
- Add link referencing the performance during scan time to the report details
- Allow to pass start time, end time and sensor/slave id as URL parameters to
  performance page.
- New feature: Remediation Tickets [#1126](https://github.com/greenbone/gsa/pull/1126)
- Allow to sort the nvts table at the edit scan config families dialog by
  name, oid, severity, timeout and selected [#1210](https://github.com/greenbone/gsa/pull/1210)
- Add feature: Scan Report Content Composer [#1073](https://github.com/greenbone/gsa/pull/1073),
  [#1084](https://github.com/greenbone/gsa/pull/1084), [#1086](https://github.com/greenbone/gsa/pull/1086),
  [#1090](https://github.com/greenbone/gsa/pull/1090)
- Add solution type to report details powerfilter [#1091](https://github.com/greenbone/gsa/pull/1091)
- Add Alemba vFire alert to GUI [#1100](https://github.com/greenbone/gsa/pull/1100)
- Add Sourcefire PKCS12 password support [#1150](https://github.com/greenbone/gsa/pull/1150)

### Changed
- Change order of options in target dialog [#1233](https://github.com/greenbone/gsa/pull/1233)
- Don't limit the input field lengths anymore [#1232](https://github.com/greenbone/gsa/pull/1232)
- Renamed "PGP Key" credential to "PGP Encryption Key" [#1208](https://github.com/greenbone/gsa/pull/1208)
- Sort alerts at task details alphanumerically [#1094](https://github.com/greenbone/gsa/pull/1094)
- Disable tag selection if no task should be added in create task dialog [#1220](https://github.com/greenbone/gsa/pull/1220)
- Don't show add tag fields when editing a task [#1220](https://github.com/greenbone/gsa/pull/1220)
- Use "Do not automatically delete reports" as default again in task dialog
  [#1220](https://github.com/greenbone/gsa/pull/1220)

### Fixed
- Don't crash if start or end date for performance page are invalid [#1237](https://github.com/greenbone/gsa/pull/1237)
- Convert first filter keyword values less then one to one [#1228](https://github.com/greenbone/gsa/pull/1228)
- Always use equal relation for first and rows filter keywords [#1228](https://github.com/greenbone/gsa/pull/1228)
- Fix issues with updating user authentication and logging out active
  sessions after changing the password of a user [#1159](https://github.com/greenbone/gsa/pull/1159)
- Tags can now contain backslashes, forward slashes and percent signs in the
  value as well as hyphens in the name to allow using the special task tag
  "smb-alert:file_path" [#1107](https://github.com/greenbone/gsa/pull/1107),
  [#1142](https://github.com/greenbone/gsa/pull/1142), [#1145](https://github.com/greenbone/gsa/pull/1145)
- Fix crash of Task dialog without user having get_config, get_scanner,
  get_tags and get_targets permissions [#1220](https://github.com/greenbone/gsa/pull/1220)
- Ensure host ordering is valid in task dialog [#1220](https://github.com/greenbone/gsa/pull/1220)
- Fix race condition resulting in not displaying scan config details at task
  dialog when opening the dialog for the first time [#1220](https://github.com/greenbone/gsa/pull/1220)
- Fix saving run schedule once setting from Task dialog [#1220](https://github.com/greenbone/gsa/pull/1220)
- Don't create a container task from the task dialog accidentally [#1220](https://github.com/greenbone/gsa/pull/1220)

[8.0.0]: https://github.com/greenbone/gsa/compare/v8.0+beta2...v8.0.0

## [8.0+beta2] - 2018-12-04

### Added
- Allow rename main dashboards [#1076](https://github.com/greenbone/gsa/pull/1076)
- Allow to encrypt alert emails via S/MIME and PGP [#1070](https://github.com/greenbone/gsa/pull/1070)
- New credential types S/MIME and PGP for alert email encryption [#1070](https://github.com/greenbone/gsa/pull/1070)
- Add cancel button to all dialogs [#1048](https://github.com/greenbone/gsa/pull/1048)
- Allow to store dashboard chart specific data [#1022](https://github.com/greenbone/gsa/pull/1022)
- Allow to toggle chart legend and 2D/3D view of pie charts [#989](https://github.com/greenbone/gsa/pull/989)
- Support for cmake and cmake3 executables [#936](https://github.com/greenbone/gsa/pull/926)
- Support for yarn offline mode [#935](https://github.com/greenbone/gsa/pull/935)
- Automatically logout user after session has timed out [#908](https://github.com/greenbone/gsa/pull/908)
- Adjusted auto reload interval automatically [#917](https://github.com/greenbone/gsa/pull/917)
- Allow to filter results by solution type via powerfilter dialog [#906](https://github.com/greenbone/gsa/pull/906)
- Extend the session timeout on user interaction
  [#865](https://github.com/greenbone/gsa/pull/), [#902](https://github.com/greenbone/gsa/pull/902),
  [#905](https://github.com/greenbone/gsa/pull/905)
- Added indicators for notes and overrides applied to results [#898](https://github.com/greenbone/gsa/pull/898)
- Added comments to Target table [#870](https://github.com/greenbone/gsa/pull/870)
- Added remove filter button to powerfilters [#863](https://github.com/greenbone/gsa/pull/863),
  [#893](https://github.com/greenbone/gsa/pull/893)
- Clear/Flush redux store on logout [#797](https://github.com/greenbone/gsa/pull/797)
- Allow to add multiple tags simultaneously
  [#701](https://github.com/greenbone/gsa/pull/701), [#723](https://github.com/greenbone/gsa/pull/723),
  [#728](https://github.com/greenbone/gsa/pull/728), [#748](https://github.com/greenbone/gsa/pull/748),
  [#752](https://github.com/greenbone/gsa/pull/752), [#768](https://github.com/greenbone/gsa/pull/768),
  [#771](https://github.com/greenbone/gsa/pull/771), [#786](https://github.com/greenbone/gsa/pull/786),
  [#871](https://github.com/greenbone/gsa/pull/871), [#887](https://github.com/greenbone/gsa/pull/887)
- Added host name to result hosts [#765](https://github.com/greenbone/gsa/pull/765)
- Added delta reports to alerts [#743](https://github.com/greenbone/gsa/pull/743),
  [#754](https://github.com/greenbone/gsa/pull/754)
- Extended Schedules based on ical data
  [#720](https://github.com/greenbone/gsa/pull/729), [#724](https://github.com/greenbone/gsa/pull/724),
  [#729](https://github.com/greenbone/gsa/pull/729), [#731](https://github.com/greenbone/gsa/pull/731),
  [#739](https://github.com/greenbone/gsa/pull/739)
- Allow to add Tags to scanners [#702](https://github.com/greenbone/gsa/pull/702)

### Changed
- Refined appearance of the GUI
  [#987](https://github.com/greenbone/gsa/pull/987), [#991](https://github.com/greenbone/gsa/pull/991),
  [#995](https://github.com/greenbone/gsa/pull/995), [#998](https://github.com/greenbone/gsa/pull/998),
  [#1004](https://github.com/greenbone/gsa/pull/1004), [#1021](https://github.com/greenbone/gsa/pull/1021),
  [#1025](https://github.com/greenbone/gsa/pull/1025), [#1026](https://github.com/greenbone/gsa/pull/1026),
  [#1030](https://github.com/greenbone/gsa/pull/1030), [#1037](https://github.com/greenbone/gsa/pull/1037),
  [#1043](https://github.com/greenbone/gsa/pull/1042), [#1053](https://github.com/greenbone/gsa/pull/1053),
  [#1058](https://github.com/greenbone/gsa/pull/1058)
- Don't close dialog on outer clicks [#1074](https://github.com/greenbone/gsa/pull/1074)
- New reworked icon set [#1053](https://github.com/greenbone/gsa/pull/1053)
- Don't show links to details pages for entities in Trashcan [#1035](https://github.com/greenbone/gsa/pull/1035)
- Updated and improved Line Charts [#1012](https://github.com/greenbone/gsa/pull/1012),
  [#1022](https://github.com/greenbone/gsa/pull/1022)
- Cleaned up wizards [#1001](https://github.com/greenbone/gsa/pull/1001)
- Split Results Host column into IP and Name [#999](https://github.com/greenbone/gsa/pull/999),
  [#998](https://github.com/greenbone/gsa/pull/998)
- Update to Create React App 2.0 [#997](https://github.com/greenbone/gsa/pull/997)
- Put NVT preferences into own tab on details page [#991](https://github.com/greenbone/gsa/pull/991)
- Change report summary table appearance [#991](https://github.com/greenbone/gsa/pull/991)
- Changed visual appearance of Tables [#983](https://github.com/greenbone/gsa/pull/983)
- Changed Donut Chart to a Pie Chart [#982](https://github.com/greenbone/gsa/pull/982)
- Improved visual appearance of Donut Charts while resizing [#979](https://github.com/greenbone/gsa/pull/979)
- Require NodeJS >= 8 [#964](https://github.com/greenbone/gsa/pull/964)
- Replaced glamorous with styled-components for settings styles
  [#913](https://github.com/greenbone/gsa/pull/913), [#919](https://github.com/greenbone/gsa/pull/919),
  [#922](https://github.com/greenbone/gsa/pull/922), [#924](https://github.com/greenbone/gsa/pull/924),
  [#925](https://github.com/greenbone/gsa/pull/925), [#929](https://github.com/greenbone/gsa/pull/929),
  [#934](https://github.com/greenbone/gsa/pull/934), [#938](https://github.com/greenbone/gsa/pull/938),
  [#948](https://github.com/greenbone/gsa/pull/948), [#949](https://github.com/greenbone/gsa/pull/949),
  [#950](https://github.com/greenbone/gsa/pull/950)
- Use Tabs for structuring data at User Settings [#927](https://github.com/greenbone/gsa/pull/927)
- Don't show external link dialog when clicking on Greenbone links [#904](https://github.com/greenbone/gsa/pull/904)
- Always load data into the redux store
  [#748](https://github.com/greenbone/gsa/pull/748), [#753](https://github.com/greenbone/gsa/pull/753),
  [#776](https://github.com/greenbone/gsa/pull/776), [#777](https://github.com/greenbone/gsa/pull/777),
  [#828](https://github.com/greenbone/gsa/pull/828), [#833](https://github.com/greenbone/gsa/pull/833),
  [#836](https://github.com/greenbone/gsa/pull/836), [#853](https://github.com/greenbone/gsa/pull/853),
  [#861](https://github.com/greenbone/gsa/pull/861), [#897](https://github.com/greenbone/gsa/pull/897),
  [#923](https://github.com/greenbone/gsa/pull/923), [#939](https://github.com/greenbone/gsa/pull/939)
- Improved login page layout [#859](https://github.com/greenbone/gsa/pull/859)
- Refined the menu appearance [#852](https://github.com/greenbone/gsa/pull/852),
  [#869](https://github.com/greenbone/gsa/pull/869)
- Reduced default max height for dialogs to 400px [#843](https://github.com/greenbone/gsa/pull/843)
- Show Report page header before report is loaded [#825](https://github.com/greenbone/gsa/pull/825)
- Renamed Task status "Internal Error" to "Interrupted" [#718](https://github.com/greenbone/gsa/pull/718),
  [#719](https://github.com/greenbone/gsa/pull/719)

### Fixed
- Fixed displaying the Observer icon [#1053](https://github.com/greenbone/gsa/pull/1053)
- Don't crash GSA completely if an unexpected error did occur [#1046](https://github.com/greenbone/gsa/pull/1046)
- Fix saving nvt preferences in gsad [#1045](https://github.com/greenbone/gsa/pull/1045)
- Fix "Current User" inheritance on "Delete User" [#1038](https://github.com/greenbone/gsa/pull/1038)
- Set min size for Line Charts and reduce number of x-axis labels to not
  overlap [#977](https://github.com/greenbone/gsa/pull/977)
- Don't set an unknown locale [#966](https://github.com/greenbone/gsa/pull/966)
- Fixed sorting of tables at Report details [#929](https://github.com/greenbone/gsa/pull/929)
- Fixed saving the default severity [#907](https://github.com/greenbone/gsa/pull/907)
- Fixed displaying Nvt tags [#880](https://github.com/greenbone/gsa/pull/880)
- Update locales if they are changed at the User Settings [#856](https://github.com/greenbone/gsa/pull/856)
- Don't show default dashboard if settings haven't been loaded yet [#714](https://github.com/greenbone/gsa/pull/714)

### Removed
- Remove max length of hosts for notes and overrides [#1033](https://github.com/greenbone/gsa/pull/1033)
- Removed Scan, Asset, SecInfo Dashboards and added Dashboard "templates" to
  the main dashboard [#974](https://github.com/greenbone/gsa/pull/974)
- Removed Dashboard Display menus with an icon overlay [#971](https://github.com/greenbone/gsa/pull/971),
  [#972](https://github.com/greenbone/gsa/pull/972)
- Removed sticky menu in header [#857](https://github.com/greenbone/gsa/pull/857)
- Removed support for severity class OpenVAS Classic [#709](https://github.com/greenbone/gsa/pull/709)

[8.0+beta2]: https://github.com/greenbone/gsa/compare/v8.0+beta1...v8.0+beta2

## [8.0+beta1] - 2018-05-25

This is the first beta release of the gsa module 8.0 for the Greenbone
Vulnerability Management (GVM) framework.

This release introduces an entirely re-written version of GSA with an overhauled
new user interface technology, switching from XSLT-generated web pages per
request to a single page JavaScript application. The XSLT got removed
completely and was replaced by a modern JS application allowing to add features
and usability improvements faster and easier in future.

The web server daemon (gsad) got a big code cleanup and improvements. Due to
changing to a JS application it doesn't generate any HTML code anymore. Now gsad
only ships static files and acts as some kind of http proxy between the JS
based GSA and gvmd.

Apart from this, the module covers a number of significant advances
and clean-ups compared to the previous gsa module.

### Added
- The 'excluded' list option when a New Target is created has been added.
- New view on scan results by vulnerability has been added.
- A link to Scanconfigs from scanner details has been added.
- Multiple dashboards can be defined by the user at the main entry page.

### Changed
- The web user interface has been transformed into a single page application
  which is loaded once and then only updates the in-browser data from the
  server.
- All data loading processes are asynchronous and don't block the GUI from
  reacting to user input.
- Refreshing of data is done in the background now. Therefore the user doesn't
  need to specify a refresh rate anymore.
- The extra help pages has been replaced by links to the documentation.
- The edit dialog for overrides and notes has been improved and is now more
  flexible.
- The report details view has been overhauled.
- nodejs >= 6 is required to generate the new JS based version of GSA.
- npm or yarn is required for installing the JavaScript dependencies.
- Minimum required version of glib has been raised to 2.42.
- Minimum required version of cmake has been raised to 3.0.

### Removed
- The its "face" has been removed.
- The 'classic hosts' asset has been removed.
- The edit mode of the dashboards has been removed. Dashboards are always
  editable now.
- libxslt is no longer required because all XSLT has been removed.
- The required minimum version of new dependency GVM Libraries is 1.0 and
  the dependency to the openvas-libraries module has been removed. Therefore
  many include directives have been adapted to the new source code.

[8.0+beta1]: https://github.com/greenbone/gsa/compare/gsa-7.0...v8.0+beta1
