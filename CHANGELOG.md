# Changelog
All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.4.11]

### Added
- Support for Scan UUID (`last_scan_id`) filter for assets exports.

[1.4.11]: https://github.com/tenable/pyTenable/compare/1.4.10...1.4.11 

## [1.4.10]

### Added
- Support for `scan_uuid` filter for vulnerability exports.

### Fixed
- Bug in `tenable/io/scanners.py` that invoked the `/settings/{}` endpoint instead of the correct `/scanners/{}` endpoint.
- Error in the documentation of the `sc.scans.edit()` method. The property - `policy` was renamed to `policy_id`.
- tests module getting into the pypi package. Now, the module will no longer be part of pypi package.

### Removed
- `plugin_id` param from the `sc.scans.create()` method as it is no longer supported by Tenable.sc.
- Python 3.6 references from all documentation.
- `search_host_audit()` method from `io/v3/explore/findings`.

[1.4.10]: https://github.com/tenable/pyTenable/compare/1.4.9...1.4.10 

## [1.4.9]
### Added

- Support for initiating exports (and getting the export UUID).
- Support for Tenable.ot plugins, events, more support for asset details.

### Fixed

- Bug in `tio.scans.results()` fixed to pass `history_id` and `history_uuid`.

### Changed

- Refactored Tenable.ot session client.

### Removed

- Support for Python Version 3.6.


 [1.4.9]: https://github.com/tenable/pyTenable/compare/1.4.8...1.4.9 

## [1.4.8]
### Added

- Support for Role Based Access Control endpoints.
- Support for specifying Agent UUIDs instead of numeric IDs for bulk group addition.

[1.4.8]: https://github.com/tenable/pyTenable/compare/1.4.7...1.4.8 

## [1.4.7]
### Added

- Added support for querying v3 Findings for Hosts, Cloud Resources, Web Applications and Host Audits modules. #592 #595
- Added support for querying v3 Assets data for Hosts, Cloud Resources, and Web Applications modules. #592 #594

### Fixed

- Fixed Tenable.io - Tags example #590
- Fixed Nessus import issue #589

[1.4.7]: https://github.com/tenable/pyTenable/compare/1.4.6...1.4.7

## [1.4.6]
### Added

- Initial support for Nessus #556
- Wheels published to PyPi #536
- Python 3.10 support #540

### Fixed

- Corrected broken security step in pipeline #563
- Export param regression with plugin family #555
- NessusReportv2 doesnt handle Nonetype in cvss scoring #552

[1.4.6]: https://github.com/tenable/pyTenable/compare/1.4.4...1.4.6

## [1.4.4]
### Added

- Initial support for additional Tenable.ad APIs

### Changed

- Upgraded restfly to 1.4.5

### Fixed

- Issue with Content-Type errors around case sensitivity #520

[1.4.4]: https://github.com/tenable/pyTenable/compare/1.4.3...1.4.4

## [1.4.3]
### Added

- Initial support for Tenable.ad #487 #484 #468 #466

### Fixed

- Fixed PR pipeline issue #490
- typing-extension requirement fixed #489
- Added required init files #491
- deprecated use of "default" in marshmallow schemas #493

[1.4.3]: https://github.com/tenable/pyTenable/compare/1.4.2...1.4.3

## [1.4.2]
### Added

- TenableSC version checking refactored to handle an APIError on the response
  when unauthenticated. (breaking issue for 5.20.0) #475
- GraphQL support for TenableOT #461
- hard_delete param #465

### Changed

- Updated Github Actions to add style checking and security checking
- Refactored the API Docsite to be easier to navigate, read, and link. #460 #464
- Rebased low-level connection logic to use RESTfly instead. (v2 work) #457
- Refactored Container Security Package to be within the IO package and
  recoded to properly follow the API docs.  #459 #474
- Refactored Exports API code to follow v2 standard #463

### Fixed

- OrgID should be optional for repositories #444

[1.4.2]: https://github.com/tenable/pyTenable/compare/1.3.3...1.4.2

## [1.4.1]: yanked - broken build
## [1.4.0]: yanked - broken build

## [1.3.3]
### Added

- Added Python 3.9 in the pypi changes #380 #376
- Added pylint to JenkinsFile #378
- code owners file is added #366
- Added export compliance API in IO package #358
- Added for the session object,in logout ,session close in tenable.sc
  and Added 'UnknownError' and 'RetryError' (PR #386,PR #363 closed)
  added that changes in PR #387

### Changed

- Deprecation warning for io session API #391
- For attribute plugin_version in plugin_detail #389
- Reverse of Appsdir dependencies PR #382
- Requirements patch 1.3.2 for library appdir #379

### Fixed

- had added the fix for the issue #236 and fix done for credentials safe in PR #388
- Bugfix asset details PR #384
- Fixed pylint issues in tenable.sc PR #381
- Fixed self log in tenable.io, base, cs, downloads, dl, ot, reports #353 #370,#371
- Fixed Remediation and Compliance doc #365
- Fixed Remediation scan with selected plugins only #362
- Fixed github issue 321 update_assets_ttl_days #360
- Fixed github issue 304 tags.create() function #357
- Fixed github issue 298 io_exception_handling #354
- Fixed the documentation issue in exclusions #352
- Fixed the import os problem of PR 299 #351
- Fixed invalid creation date in row num  #341


[1.3.3]: https://github.com/tenable/pyTenable/compare/1.3.1...1.3.3

## [1.3.2] : yanked - broken build

## [1.3.1]
### Added
- add tio.remediationscans endpoints #339

### Changed
- added stream_hook param to tio.scans.export endpoint #332

### Fixed
- fix all_permisisons var in tio.tags to have correct values #340
- fix tests and test coverage #336, #328, #344, #338
- fix links and typos in documentation #335, #323
- update semver version #334
- fixed endpoints in sc.organizations #330, #331
- missing import in ContainerSecurity class #299


[1.3.1]: https://github.com/tenable/pyTenable/compare/1.3.0...1.3.1


## [1.3.0]
### Added
- PyLint and Codacy checks as part of PyTenable test suite / pipeline #316
- move assets endpoint in tio.assets.move_assets #312
- access group v2 endpoints added in tio.access_groups_v2 #308
- add support for "schedule_scan" in tio.scans endpoints #288
- add list_routes and edit_routes in tio.scanner_groups #290
- add exclusions_import in tio.exclusions #293
- add list_auths and edit_auths in tio.users #296
- add check_auto_targets in tio.scans #301
- add bulk_delete in tio.assets #302
- add network_asset_count in tio.networks #303

### Changed
- tags.create and tags.edit now have access_control and filter #309
- updated tio.exclusions.edit arguments #282
- added sort arg in tio.scans.history, fixed sort in tio.tags #283
- added network_id arg to tio.exclusions create/edit #284
- support bulk delete in tio.tags.delete #295
-
### Fixed
- many errors and warnings across the code base #320, #317, #314, #313, #281
- tio.agent_config.edit now returns payload #287
- error handling in tio.plugins #291


[1.3.0]: https://github.com/tenable/pyTenable/compare/1.2.8...1.3.0

## [1.2.8]
### Changed
- Centralized the SSL Verification process and support passing the verify param
  to Python Requests regardless of the of the session setting.  This addresses
  the requests issue identified https://github.com/psf/requests/issues/3829
  #265 #166 #139

[1.2.8]: https://github.com/tenable/pyTenable/compare/1.2.7...1.2.8

## [1.2.7]
### Fixed
- Tenable.io policy template details required type #271
- Editing a user would fail if no account name existed #270
- Export iterator could potentially restart #263

### Added
- TenableIO.credentials.upload method added #269

[1.2.7]: https://github.com/tenable/pyTenable/compare/1.2.6...1.2.7

## [1.2.6]
### Fixed
- Removed integer checks for tio.editor.obj_details
- Fixed Plugin Family URL for scan policies when using mixed families #255

### Added
- `timeout` and `when_done` are now documented and supported for both vuln and asset exports.

[1.2.6]: https://github.com/tenable/pyTenable/compare/1.2.5...1.2.6


## [1.2.5]
### Fixed
- Updated docs to replace "category_name" with "name" in the example in tagging. #241
- Updated export None checking added in 1.2.3 to check for None correctly #248
- Updated filter schema to always return the rule.
- Incorrect endpoint used for sc.organizations.recast_risk_rules #256

### Added
- Added pagination support in tio.agent_groups_details #251
- Added "linked" to accepted account types #257

### Changed
- Tenable.ot base version is now 3.7
- TenableOT object now uses `secret_key` over `api_token`.
- Updated VulnInternmixer iterator in Tenable.ot to support new format.

[1.2.5]: https://github.com/tenable/pyTenable/compare/1.2.3...1.2.5


## [1.2.4]

This version was pulled due to a dirty build environment.  All 1.2.4 notes are in 1.2.5


## [1.2.3]
### Fixed
- Corrected documentation issue #239

### Changed
- Corrected behavior in tio.exports.ExportsIterator now that the API has changed

[1.2.3]: https://github.com/tenable/pyTenable/compare/1.2.2...1.2.3


## [1.2.2]
### Fixed
- Reverted Tenable.sc credential issue #210 as the docs are incorrect.
- Fixed documentation issues #228 #225 #233 #229
- Fixed regex escaping in test suite #230

[1.2.2]: https://github.com/tenable/pyTenable/compare/1.2.1...1.2.2


## [1.2.1]
### Changed
- Removed ipaddress requirement as it's part of the standard library #226

[1.2.1]: https://github.com/tenable/pyTenable/compare/1.2.0...1.2.1


## [1.2.0]
### Added
- Embedded new base classes leveraging RESTfly for connection logic instead of the custom-coded ones.
- Added base schema for filtering using marshmallow.
- Added Tenable.ot support using new base class.
- Refactored the Downloads class to use the new RESTfly-based classes.
- New unit tests will now start to use responses over pytest-vcr when possible.

### Changed
- tenable.downloads.Downloads now will warn about deprecation.

[1.2.0]: https://github.com/tenable/pyTenable/compare/1.1.3...1.2.0


## [1.1.3]
### Added
- history_uuid is now a field that can be used in TenableIO.scans

### Changed
- Relaxed type checking for scan_id in TenableIO.scans

[1.1.3]: https://github.com/tenable/pyTenable/compare/1.1.2...1.1.3


## [1.1.2]
### Fixed
- TenableSC.FeedsAPI.process pointed to the wrong URL. #201

### Changed
- TenableIO.ScansAPI didn't distinctly call out that unknown keyword args are shunted to settings #202
- Explicitly called out the common themes section of the documentation for TenableSC #200
- Adjusted case sensitivity guidelines for plugin_family in TenableIO.exports.vulns #199

[1.1.2]: https://github.com/tenable/pyTenable/compare/1.1.1...1.1.2


## [1.1.1]
### Added
- Added assign tags method to TenableIO.assets package #194

### Fixed
- Errant id check in audit file template list #195
- BytesIO import didn't exist in TenableSC.audit_files package #197

[1.1.1]: https://github.com/tenable/pyTenable/compare/1.1.0...1.1.1


## [1.1.0]
### Added
- Response timeout settings exposed and defaults set. #192 #193

### Changed
- Improved handling of export chunks.
    - Added Error handling of JSON decode errors
    - Added retry logic of chunks that appear to be broken (networking issue?)
    - Added automatic retiring and re-fetch to ignore empty chunks of data.

### Fixed
- Retry documentation wasn't correct, adjusted the default values as necessary.

[1.1.0]: https://github.com/tenable/pyTenable/compare/1.0.7...1.1.0


## [1.0.7]
### Fixed
- TenableSC.queries.create() did not pass filters to the constructor #191

[1.0.7]: https://github.com/tenable/pyTenable/compare/1.0.6...1.0.7


## [1.0.6]
### Fixed
- TenableIO.tags.list_categories() was pointing to values instead of categories #186
- TenableSC instantiation does not support base path customization #187

[1.0.6]: https://github.com/tenable/pyTenable/compare/1.0.5...1.0.6


## [1.0.5]
### Fixed
- Documentation Examples for TenableSC.feeds use feed instead of feeds #178
- Documentation Examples for TenableSC.files used feed instead of files. #179
- TenableSC.credentials used the incorrect parameter for oracleAuthType. #180

[1.0.5]: https://github.com/tenable/pyTenable/compare/1.0.4...1.0.5


## [1.0.4]
### Fixed
- TenableSC.AssetListAPI constructor improperly referred to fobj instead of kw['fobj'] #177
- TenableSC.ScannerAPI.edit improperly attempted to merge the scanner details into the PATCH call #176

### Changed
- Increased default chunk sizing for TenableIO.exports.assets to 1000
- Increased default num_assets chunk sizing for TenableIO.exports.vulns to 500
- Increased default page sizing for TenableSC.analysis calls to 1000
- Improved debug logs for all API calls.  Debug logs now effectively log before, during, and after.
- Improved debug log format.  Pre-Request logs now output a standard JSON format.

[1.0.4]: https://github.com/tenable/pyTenable/compare/1.0.3...1.0.4


## [1.0.3]
### Added
- Will now attempt to retry on lower-level ConnectionErrors.

### Changed
- ExportIterator will now backoff on status calls up to 30 seconds between calls.

[1.0.3]: https://github.com/tenable/pyTenable/compare/1.0.2...1.0.3


## [1.0.2]
### Added
- Exporting WAS scans nor functions as intended. #175

### Fixed
- TenableIO.TagAPI filter check erroneously used self.check instead of self._check

[1.0.2]: https://github.com/tenable/pyTenable/compare/1.0.1...1.0.2


## [1.0.1]
### Added
- API Key support for TenableSC as Tenable.sc version 5.13 introduced key support.
- TenableSC now supports context management for authentication. (with TenableSC...)
- Dyanamic tag filter field support for TenableIO.tags create and edit methods. #174

### Changed
- TenableSC.login user && passwd parameters now called username && password

[1.0.1]: https://github.com/tenable/pyTenable/compare/1.0.0...1.0.1


## [1.0.0]
### Changed
- Upped Revision on 0.3.29

### Added
- Testing in travis for Python 3.7 and 3.8

[1.0.0]: https://github.com/tenable/pyTenable/compare/0.3.29...1.0.0


## [0.3.29]
### Fixed
- New UA String code was failing on windows hosts as os.uname isn't x-platform #164
- Implicit "all" hostType was not set when creating an accepted risk. #162

[0.3.29]: https://github.com/tenable/pyTenable/compare/0.3.28...0.3.29


## [0.3.28]
### Changed
- Converted to new UA String format in an effort to normalize UA strings.

[0.3.28]: https://github.com/tenable/pyTenable/compare/0.3.27...0.3.28


## [0.3.37]
### Changed
- Query filters can now be overloadable and removable for TenableSC.analysis

### Fixed
- Documentation was incorrectly calling the wrong method #156
- Incorrect timezone documentation for SC #145
- repeatRule parameter for schedules was incorrectly documented as rrule #144
- host_tracking for scans constructor was documented, however unimplemented #152
- Unable to set the max scan time to unlimited #149

[0.3.27]: https://github.com/tenable/pyTenable/compare/0.3.26...0.3.27


## [0.3.26]
### Fixed
- Failed to add necessary requirement for the "ipaddress" python package.

[0.3.26]: https://github.com/tenable/pyTenable/compare/0.3.25...0.3.26


## [0.3.25]
### Added
- Added the Tenable.io ScansAPI.history endpoint #141
- Added the ability for Tenable.io's PolicyAPI.list() iterator to graft on plugin family details.

### Fixed
- Spelling type in Tenable.sc ScansAPI.launch when generating diagnostic passwords #142
- Incorrect policy UUID passed to scans created in Tenable.io w/ an existing policy. #143

[0.3.25]: https://github.com/tenable/pyTenable/compare/0.3.24...0.3.25


## [0.3.24]
### Changed
- Switched the Nessusv2 file parser to diffusedxml per recommendation with bandit

### Fixed
- TenableSC SSL verification flags were not set in the session builder, which meant that login was a one-time event. #139

[0.3.24]: https://github.com/tenable/pyTenable/compare/0.3.23...0.3.24


## [0.3.23]
### Changed
- Improved documentation for creating scans to include credentials

### Added
- Tenable.io Access Group API Added and Tested #98
- Tenable.io Networks API Added and Tested #129
- Tenable.io Managed Credentials API Added and Tested #130

### Fixed
- tio.policies.template_details wasn't correctly constructing the document from the editor API #136
- tio.agent_groups.list was missing from the documentation

[0.3.23]: https://github.com/tenable/pyTenable/compare/0.3.22...0.3.23


## [0.3.22]
### Added
- Tenable.sc Asset List API Added and Tested #13

### Changed
- Export wait logic is now centralized.  Both scan export and workbench export now use this new method.

### Fixed
- Multiple chapters should be merged with ; and not , in Workbenches exports
- Chapter "vuln_by_asset" was missing from the choices for workbench export #127
- Docstrings incorrectly state that chapters are only necessary for PDF and HTML #127
- Scan types weren't being set when passing the subordinate attribute #128

[0.3.22]: https://github.com/tenable/pyTenable/compare/0.3.21...0.3.22


## [0.3.21]
### Changed
- Tenable.io scans.export now supports explicitly defining the filters attribute as well as the implicit argument list #124

### Fixed
- Doc examples for TenableSC credentials.create were incorrect. #122
- SC API Reference incorrectly stated authType of "publickey" instead of "publicKey". #122
- SC Analysis Query Expander wasn't expanding numerid ids https://community.tenable.com/s/question/0D7f2000005b5OX/filter-on-asset-via-api-call-to-analysis-resource-using-pytenable
- SC Credential privilegeEscalation attr pre-fill wasn't restricted to just specific types #126
- SC Users docs weren't linked into the documentation.

[0.3.21]: https://github.com/tenable/pyTenable/compare/0.3.20...0.3.21


## [0.3.20]
### Added
- Added support for the new plugins list endpoint.
- Support for extensible retry logic using the retry_on param.
- Tested out CSv2 API endpoints #8 #9

### Changed
- Homogenized the docstrings for TenableSC #115
- Updated docs in tio.scans.create to denote that the name is required. #118

### Fixed
- Streaming responses in TenableSC weren't working as expected #114
- Files weren't uploading properly in TenableSC Credentials endpoints #122
- User permissions parameter type #121
- Typo in docs #120
- Scanner listing when WAS wasn't enabled caused an error #117

[0.3.20]: https://github.com/tenable/pyTenable/compare/0.3.19...0.3.20


## [0.3.19]
### Changed
- All Tenable.io API doc links have been re-pointed to the new developer portal. #111
- tio.editor.edit has been renamed to tio.editor.template_details as it was misnamed.
- tio.editor.list has been renamed to tio.editor.template_list to more accurately describe it's function.

### Added
- Added the asset delete method to the workbenches TenableIO module #110
- Added and tested out the TenableSC plugin family additions to the plugins module #78
- Added and tested out the TenableSC OrganizationAPI module #77
- Added and tested out the TenableSC QueryAPI module #79

### Fixed
- Various documentation issues reported by sphinx addressed
- TenableSC.scan_instances.list can now support non-standard timeframes #108

[0.3.19]: https://github.com/tenable/pyTenable/compare/0.3.18...0.3.19


## [0.3.18]
### Added
- Added and tested out support for TenableSC Credentials #76

[0.3.18]: https://github.com/tenable/pyTenable/compare/0.3.17...0.3.18


## [0.3.17]
### Added
- Analysis filters now allow for collapsing lists if id dicts into lists of
  integer ids.  e.g. `('name', '=', [{'id': 1}])` is now `('name', '=', [1])`
- Added and tested out support for TenableSC AuditFileAPI #75

### Changed
- Tenable.io Exports iterator now has **uuid**, **chunk_id**, **chunks**, and
  **processed** publicly exposed.

### Fixed
- Addressed issue where UnexpectedValueError was sometimes raised when
  specifying a scanner by name in tio.scans._create_scan_document.

[0.3.17]: https://github.com/tenable/pyTenable/compare/0.3.16...0.3.17


## [0.3.16]
### Added
- Added and tested out support for TenableSC UserAPI #24
- Added and tested out support for TenableSC GroupAPI #24
- Added and tested TenableIO.agent_groups.list() #105

### Fixed
- Tenable.sc Schedule document validation extended to support `now` for
  scans #102

[0.3.16]: https://github.com/tenable/pyTenable/compare/0.3.15...0.3.16


## [0.3.15]
### Added
- Added and tested out support for TenableSC RoleAPI #24

### Fixed
- Retries would throw an error as they weren't floats.
- Exports would erroneously set an option if set to none.
- The scan history test cassette was modified to match the new call.

[0.3.15]: https://github.com/tenable/pyTenable/compare/0.3.14...0.3.15


## [0.3.14]
### Fixed
- Corrected Doc Issue where the downloads API was incorrectly referencing
  sc.alerts
- Fixed issue with scan history deletion where the path was incorrect #101

[0.3.14]: https://github.com/tenable/pyTenable/compare/0.3.13...0.3.14


## [0.3.13]
### Added
- Tested out TenableSC StatusAPI #22
- Tested out TenableSC SystemAPI #22
- Tested out TenableSC ScanZoneAPI #21
- Tested out TenableSC ScannerAPI #21
- Tested out Downloads API

### Fixed
- RetryError no longer itself throws an error due to logging.
- Fixed type mismatch bug in IO workbench filters #97
- Corrected issue with ScanZone updates using the wrong HTTP method #95
- Corrected doc issue with ScanResultAPI.export not referring to the fact that
  the exported scan is zipped.
- Corrected the raw HTTP method docs

[0.3.13]: https://github.com/tenable/pyTenable/compare/0.3.12...0.3.13


## [0.3.12]
### Added
- Added view parameter for TenableSC.analysis.scan #73
- Added accept_risks module #18 (untested)
- Added system module and converted the TenableSC module to use it over a raw
  call #22
- Added status module #22 (untested)

### Fixed
- Fixed issue with TenableSC.analysis.scan not properly passing a view. #73

[0.3.12]: https://github.com/tenable/pyTenable/compare/0.3.11...0.3.12


## [0.3.11]
### Added
- Added proxy support for the IO, SC, etc. #72

### Fixed
- Fixed issue where supplied sessions weren't being properly passed to
  _build_session.

[0.3.11]: https://github.com/tenable/pyTenable/compare/0.3.10...0.3.11


## [0.3.10]
### Added
- Added example for Workbench CSV Downloads for IO
- Added support for multi-value filters in IO.
- Added Request-UUID logging for all responses when available.
- Added TenableSC scan_instances endpoints and associated tests #19.
- Added TenableSC scan policies endpoints and associated tests #20.
- TenableIO can now pull API keys directly from environment variables as well.
- Added doc page detailing how to run the tests.
- Added TenableSC repositories endpoint and associated tests #17

### Fixed
- Exports methods in TenableIO now respect 0 integers being passed #69.
- Errored scan exports in TenableIO will no longer wait forever.
- Scan Exports using multiple chapters now works as expected #71 #70

### Removed
- schedule_* parameters in scans have been removed in favor of direct checking
    and documentation of the schedule dictionary.  This has larger implications
    down the line with repositories, alerts, etc.

[0.3.10]: https://github.com/tenable/pyTenable/compare/0.3.9...0.3.10


## [0.3.9]
### Added
- Added the `aggregate` parameter for scan import.
- Added Changelog and backfilled changes from 0.1.0 to current
- Added testing for user outputs #26
- Added testing for scanner outputs #30
- Added testing for permissions #34
- Added testing for groups #35
- Adjusted the doc format to no longer pin the sidebar #61
- Added redaction to sensitive pathways #66
- Added tagging support #44

### Changed
- Tenable.sc files module was incorrectly pointing to self.post instead of
  self._api.post
- Launching a scan with alt_targets sends an array instead of a string #64
- Tenable.sc Analysis will now handle Query IDs #63
- Agent-Delete within Tenable.io Was using the wrong Endpoint #59
- Refactored TIOIterator to use less code when subclassing.
- Documented iterators and other common models.

[0.3.9]: https://github.com/tenable/pyTenable/compare/0.3.8...0.3.9


## [0.3.8]
### Added
- Added TioExportsError to handle status error
- Tagging support for asset export

[0.3.8]: https://github.com/tenable/pyTenable/compare/0.3.7...0.3.8


## [0.3.7]
### Added
- Added scans.status in Tenable.sc
- Added scans module for Tenable.sc
- Added logging support for the whole of pyTenable

### Changed
- Corrected pathway to acceptRiskRule for Tenable.sc package
- Scans.update renamed to Scans.edit in Tenable.io

### Removed
- analysis_type from being sent to the API

[0.3.7]: https://github.com/tenable/pyTenable/compare/0.3.6...0.3.7


## [0.3.6]
### Added
- Tenable.sc login testing
- Tenable.sc Analysis testing #10

### Changed
- Fixed iterator looping issue
- Travis now runs all tests
- Converted pytest to use conftest standard
- Improved VCRpy testing

### Removed
- Container Security v1 tests (not VCRed)

[0.3.6]: https://github.com/tenable/pyTenable/compare/0.3.5...0.3.6


## [0.3.5]
### Changed
- Fixed iterator first page problem
- Adjusted Tenable.sc model constructors to all behave the same uniform way

[0.3.5]: https://github.com/tenable/pyTenable/compare/0.3.4...0.3.5


## [0.3.4]
### Added
- Added tagging support for vulnerability export
- Added VCRpy to all unit tests
- Added accept_risks Model to TenableSC

### Changed
- Moved get_status checking for iterators to conform to DRY
- lxml is now an optional dependency

[0.3.4]: https://github.com/tenable/pyTenable/compare/0.3.3...0.3.4


## [0.3.3]
### Added
- Added scan_instances to TenableSC

### Changed
- tio.scanners.linking_key is now a method instead fo a property

### Removed
- Removed a lot of stubbed models that haven't been worked on yet

[0.3.3]: https://github.com/tenable/pyTenable/compare/0.3.2...0.3.3


## [0.3.2]
### Changed
- Documentation refactored
- Mocked up some of the libraries for improved testing
- Fixed typo bug in sc.scans

[0.3.2]: https://github.com/tenable/pyTenable/compare/0.3.1...0.3.2


## [0.3.1]
### Added
- Documented asset_activity to TenableIO

### Changed
- Re-pointed all SecurityCenter references to TenableSC instead
- Refactored schedule sub-document creation into a separate constructor for
  re-use
- Documentation improvements

[0.3.1]: https://github.com/tenable/pyTenable/compare/0.3.0...0.3.1


## [0.3.0]
### Added
- Added unit tests for Inputs & Outputs for IO Scanner Groups
- Added unit tests for Inputs & Outputs for IO Policies
- Added unit tests for Inputs & Outputs for IO Plugins
- Added unit tests for Inputs & Outputs for IO Folders
- Added unit tests for Inputs & Outputs for IO Filters
- Added unit tests for Inputs & Outputs for IO Asset Lists
- Added unit tests for Inputs & Outputs for IO Target Groups
- Added unit tests for Inputs & Outputs for IO Sessions
- Added RetryError

### Changed
- Inlined all of the Documentation into the code itself
- Documentation refactoring effort for the whole package
- Unit test improvements

[0.3.0]: https://github.com/tenable/pyTenable/compare/0.2.2...0.3.0


## [0.2.2]
### Changed
- Refactored long-description to better suit PyPI inclusion

[0.2.2]: https://github.com/tenable/pyTenable/compare/0.2.1...0.2.2


## [0.2.1]
### Changed
- Inlined the Readme

[0.2.1]: https://github.com/tenable/pyTenable/compare/0.2.0...0.2.1


## [0.2.0]
### Added
- Added TenableSC Analysis Model
- Added TenableSC Feeds Model
- Added TenableSC Files Model
- Added NessusReportv2 Model

### Changed
- Refactored the sub-package pathing
- Modified importing to be relative

[0.2.0]: https://github.com/tenable/pyTenable/compare/0.1.0...0.2.0


## [0.1.0]
### Added
- Added TenableIO Exports Model
- Added TenableIO Scans Model
- Added

### Changed
- Fixed Time Conversion Issue #6

[0.1.0]: https://github.com/tenable/pyTenable/compare/4ab62c61c80768a36b65ba5accef0bfe1350480e...0.1.0
