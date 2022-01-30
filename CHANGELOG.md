# Changelog
All notable changes to this project will be documented in this file.

## [0.8.0] - 2022-01-22
### Added
- textDocument/semanticTokens/full
  - variable semantic tokens are now split up into multiple tokens, offering a finer-grained view of what each part of it is for which should improve readability ([rcjsuen/dockerfile-language-service#100](https://github.com/rcjsuen/dockerfile-language-service/issues/100))

### Fixed
- textDocument/publishDiagnostics
  - empty lines in heredoc content should not trigger the empty continuation line warning ([rcjsuen/dockerfile-utils#107](https://github.com/rcjsuen/dockerfile-utils/issues/107))

## [0.7.3] - 2021-12-12
### Fixed
- textDocument/completion
  - fix error returned when computing completion items at the end of a COPY instruction with flags ([#258](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/258))
  - fix error returned when computing completion items at the end of a ADD instruction with flags ([#259](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/259))
  - fix infinite loop in ADD and COPY instructions when calculating WORKDIR suggestions for a build stage that shares its name with the image ([rcjsuen/dockerfile-language-service#99](https://github.com/rcjsuen/dockerfile-language-service/issues/99))
- textDocument/formatting
  - ignore heredoc content when formatting ([rcjsuen/dockerfile-utils#105](https://github.com/rcjsuen/dockerfile-utils/issues/105))
- textDocument/onTypeFormatting
  - ignore heredoc content when formatting ([rcjsuen/dockerfile-utils#105](https://github.com/rcjsuen/dockerfile-utils/issues/105))
- textDocument/rangeFormatting
  - ignore heredoc content when formatting ([rcjsuen/dockerfile-utils#105](https://github.com/rcjsuen/dockerfile-utils/issues/105))

## [0.7.2] - 2021-10-20
### Fixed
- textDocument/semanticTokens/full
  - prevent infinite loop when calculating semantic tokens if an escape character is not followed by any actual content ([rcjsuen/dockerfile-language-service#95](https://github.com/rcjsuen/dockerfile-language-service/issues/95))
  - prevent infinite loop when calculating semantic tokens if an escape character is embedded within a variable ([rcjsuen/dockerfile-language-service#96](https://github.com/rcjsuen/dockerfile-language-service/issues/96))

## [0.7.1] - 2021-09-21
### Fixed
- textDocument/publishDiagnostics
  - prevent merging of instructions if it contains an escape character and spans multiple lines ([rcjsuen/dockerfile-utils#103](https://github.com/rcjsuen/dockerfile-utils/issues/103))
  - ignore comments embedded in an instruction's keyword ([rcjsuen/dockerfile-utils#104](https://github.com/rcjsuen/dockerfile-utils/issues/104))
- textDocument/semanticTokens/full
  - prevent infinite loop when calculating semantic tokens for an instruction with a keyword that spans multiple lines ([rcjsuen/dockerfile-language-service#94](https://github.com/rcjsuen/dockerfile-language-service/issues/94))

## [0.7.0] - 2021-09-19
### Added
- textDocument/publishDiagnostics
  - support BuildKit by ignoring RUN instructions with no arguments ([rcjsuen/dockerfile-utils#102](https://github.com/rcjsuen/dockerfile-utils/issues/102))

### Changed
- textDocument/publishDiagnostics
  - duplicated escape parser directive errors will now only flag the duplicates ([rcjsuen/dockerfile-utils#100](https://github.com/rcjsuen/dockerfile-utils/issues/100))
  - duplicated CMD, ENTRYPOINT, and HEALTHCHECK instructions will no longer flag the last one found as it is the valid one ([rcjsuen/dockerfile-utils#101](https://github.com/rcjsuen/dockerfile-utils/issues/101))

### Fixed
- textDocument/completion
  - consider escaped words when calculating prefixes for code completion ([rcjsuen/dockerfile-language-service#60](https://github.com/rcjsuen/dockerfile-language-service/issues/60))
- textDocument/publishDiagnostics
  - fix incorrect merging of error ranges if escape character embedded in the keyword ([rcjsuen/dockerfile-utils#99](https://github.com/rcjsuen/dockerfile-utils/issues/99))
- textDocument/semanticTokens/full
  - prevent infinite loop when computing semantic tokens for a keyword with an escape character ([rcjsuen/dockerfile-language-service#91](https://github.com/rcjsuen/dockerfile-language-service/issues/91))

## [0.6.0] - 2021-09-04
### Added
- textDocument/completion
  - process heredoc syntax correctly when deciding what completion items to return for ADD and COPY ([rcjsuen/dockerfile-language-service#90](https://github.com/rcjsuen/dockerfile-language-service/issues/90))
- textDocument/publishDiagnostics
  - flag duplicated escape parser directive declarations as being unnecessary ([rcjsuen/#82](https://github.com/rcjsuen/dockerfile-utils/issues/82))
  - flag duplicated CMD, ENTRYPOINT, and HEALTHCHECK instructions as being unnecessary diagnostics ([rcjsuen/#82](https://github.com/rcjsuen/dockerfile-utils/issues/82))
  - support heredoc syntax in ADD and COPY instructions ([rcjsuen/#98](https://github.com/rcjsuen/dockerfile-utils/issues/98))

## [0.5.0] - 2021-08-08
### Added
- textDocument/completion
  - support heredoc syntax when deciding what completion items to return ([rcjsuen/dockerfile-language-service#87](https://github.com/rcjsuen/dockerfile-language-service/issues/87))
- textDocument/publishDiagnostics
  - support heredoc syntax when validating RUN instructions ([rcjsuen/dockerfile-utils#97](https://github.com/rcjsuen/dockerfile-utils/issues/97))

### Fixed
- textDocument/semanticTokens/full
  - fix semantic highlighting issue seen in arguments spanning multiple lines that are contiguous with no whitespace ([rcjsuen/dockerfile-language-service#84](https://github.com/rcjsuen/dockerfile-language-service/issues/84))
  - remove special handling of backslash characters in strings for semantic tokens ([rcjsuen/dockerfile-language-service#88](https://github.com/rcjsuen/dockerfile-language-service/issues/84))

## [0.4.1] - 2021-04-12
### Fixed
- textDocument/publishDiagnostics
  - fixed a regression that caused the internal state of configurations to be stale which mean editors would not immediately be notified of changed diagnostics based on configuration changes  ([#256](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/256))

## [0.4.0] - 2021-04-11
### Added
- settings
  - docker.languageserver.formatter.ignoreMultilineInstructions? ([#255](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/255))
    - value = ( true | false )
    - this will make the formatter ignore instructions that span multiple lines
- textDocument/completion
  - suggest working directories if editing the last argument of ADD and COPY instructions that aren't written in JSON ([rcjsuen/dockerfile-language-service#77](https://github.com/rcjsuen/dockerfile-language-service/issues/77))
- textDocument/publishDiagnostics
  - allow multiple arguments to be defined for ARG instructions to support Docker Engine 20.10 ([rcjsuen/dockerfile-utils#92](https://github.com/rcjsuen/dockerfile-utils/issues/92))
- textDocument/formatting
  - allow the formatter to skip formatting of instructions that span multiple lines ([#255](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/255))
- textDocument/onTypeFormatting
  - optimized on type formatting so that it does not return unnecessary edits ([rcjsuen/dockerfile-language-service#82](https://github.com/rcjsuen/dockerfile-language-service/issues/82))
  - allow the formatter to skip formatting of instructions that span multiple lines ([#255](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/255))
- textDocument/rangeFormatting
  - optimized range formatting so that it does not return unnecessary edits ([rcjsuen/dockerfile-language-service#81](https://github.com/rcjsuen/dockerfile-language-service/issues/81))
  - allow the formatter to skip formatting of instructions that span multiple lines ([#255](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/255))

### Fixed
- textDocument/publishDiagnostics
  - do not validate variable substitutions if found in CMD and ENTRYPOINT ([rcjsuen/dockerfile-utils#89](https://github.com/rcjsuen/dockerfile-utils/issues/89))
  - do not flag `?` as an invalid modifier in variable substitutions ([rcjsuen/dockerfile-utils#91](https://github.com/rcjsuen/dockerfile-utils/issues/91))
  - prevent false positive by improving the parsing of an escape character and newline that immediately follows a label definition ([rcjsuen/dockerfile-utils#95](https://github.com/rcjsuen/dockerfile-utils/issues/95))
- textDocument/semanticTokens
  - fix infinite loop issue when calculating semantic tokens for ARG or ENV instructions with nested comments ([rcjsuen/dockerfile-language-service#74](https://github.com/rcjsuen/dockerfile-language-service/issues/74))


## [0.3.0] - 2021-01-20
### Added
- textDocument/publishDiagnostics
  - support `--chmod` flag in ADD instructions added in Docker CE 20.10 ([#250](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/250))
  - support `--chmod` flag in COPY instructions added in Docker CE 20.10 ([#251](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/251))

## [0.2.2] - 2020-01-07
### Fixed
- import all types from vscode-languageserver to prevent bundling issues ([#249](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/249))

## [0.2.1] - 2020-01-06
### Fixed
- textDocument/semanticTokens
  - clearly declare that full document semantic tokens are supported in the returned server capabilities ([#248](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/248))

## [0.2.0] - 2020-12-25
### Added
- textDocument/completion
  - CompletionItemTag is now supported when completing on the MAINTAINER keyword ([rcjsuen/dockerfile-language-service/#70](https://github.com/rcjsuen/dockerfile-language-service/issues/70))
- textDocument/publishDiagnostics
  - instructions with only an escape character as its argument should be flagged as not having any arguments ([rcjsuen/dockerfile-utils#83](https://github.com/rcjsuen/dockerfile-utils/issues/83))

### Fixed
- textDocument/semanticTokens
  - ENV instructions with blank space operators will no longer be assigned a semantic token ([rcjsuen/dockerfile-language-service#76](https://github.com/rcjsuen/dockerfile-language-service/issues/76))
  - prevent infinite loop caused by invalid ENV instruction ([#246](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/246))
- replace deprecated `prepublish` script with `prepublishOnly` ([#111](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/111))
- fix server crash caused by the finalizing of the LSP 3.16 specification ([#247](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/247))

## [0.1.1] - 2020-07-13
### Fixed
- textDocument/didChange
  - correctly consider an event with multiple changes at the beginning of a file ([#244](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/244))

## [0.1.0] - 2020-07-11
### Added
- textDocument/definition
  - resolve build stage references to support definition navigation ([rcjsuen/dockerfile-language-service#67](https://github.com/rcjsuen/dockerfile-language-service/issues/67))
- textDocument/publishDiagnostics
  - warnings about the deprecated MAINTAINER instruction will now be specifically tagged as being a deprecation warning diagnostic ([#242](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/242))
  - ARG and ENV instructions that span multiple lines with just a comment are now flagged as an error ([rcjsuen/dockerfile-utils#78](https://github.com/rcjsuen/dockerfile-utils/issues/78))
  - use DiagnosticTag to indicate if a Diagnostic is informing the user about a deprecation or not([rcjsuen/dockerfile-utils#80](https://github.com/rcjsuen/dockerfile-utils/issues/80))

### Fixed
- textDocument/definition
  - build stages are no longer included as a link ([rcjsuen/dockerfile-language-service#68](https://github.com/rcjsuen/dockerfile-language-service/issues/68))
- textDocument/publishDiagnostics
  - correct ranges of linting errors if the error is on a multiline argument that is preceded by the escape character ([rcjsuen/dockerfile-utils#77](https://github.com/rcjsuen/dockerfile-utils/issues/77))
  - fix linting error caused by whitespace followed after the escape character ([rcjsuen/dockerfile-utils#79](https://github.com/rcjsuen/dockerfile-utils/issues/79))
- textDocument/semanticTokens
  - allow embedded comments to immediately follow an ENV declaration ([rcjsuen/dockerfile-language-service#69](https://github.com/rcjsuen/dockerfile-language-service/issues/69))
  - fix the semantic tokens calculation to allow flags to have options without a value and improved handling of multiline strings ([#239](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/239))
- fix builds so that Docker images are pushed to Docker Hub ([#243](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/243))

## [0.0.24] - 2020-04-23
### Fixed
- textDocument/semanticTokens
  - improved support and parsing of strings and variables ([#239](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/239))

## [0.0.23] - 2020-04-03
### Added
- textDocument/completion
  - support completion of the `syntax` parser directive ([rcjsuen/dockerfile-language-service#57](https://github.com/rcjsuen/dockerfile-language-service/issues/57))
- textDocument/documentSymbol
  - support multiple directives when calculating a Dockerfile's symbols ([rcjsuen/dockerfile-language-service#65](https://github.com/rcjsuen/dockerfile-language-service/issues/65))
- textDocument/hover
  - add hover support for the `syntax` parser directive ([rcjsuen/dockerfile-language-service#58](https://github.com/rcjsuen/dockerfile-language-service/issues/58))
- textDocument/publishDiagnostics
  - RUN instructions with only flags and no arguments will now be raised as an error ([rcjsuen/dockerfile-utils#76](https://github.com/rcjsuen/dockerfile-utils/issues/76))

### Fixed
- textDocument/hover
  - allow hovers to be displayed for instruction keywords that span multiple lines ([rcjsuen/dockerfile-language-service#59](https://github.com/rcjsuen/dockerfile-language-service/issues/59))
  - correct hover resolution of a variable if it comes after a false comment in a multiline instruction ([rcjsuen/dockerfile-language-service#61](https://github.com/rcjsuen/dockerfile-language-service/issues/61))
  - correct hover resolution of a variable that comes after an embedded comment with a trailing escape character in a multiline instruction ([rcjsuen/dockerfile-language-service#62](https://github.com/rcjsuen/dockerfile-language-service/issues/62))
- textDocument/publishDiagnostics
  - multiline instructions with empty newlines will no longer throw an error during validation ([rcjsuen/dockerfile-utils#71](https://github.com/rcjsuen/dockerfile-utils/issues/71))
  - instruction keywords that span multiple lines will no longer be raised as an error ([rcjsuen/dockerfile-utils#72](https://github.com/rcjsuen/dockerfile-utils/issues/72))
  - embedded comments with an empty continuation line will no longer be raised as an error ([rcjsuen/dockerfile-utils#73](https://github.com/rcjsuen/dockerfile-utils/issues/73))
  - arguments that follow a non-leading `#` comment marker will no longer be dropped during validation ([rcjsuen/dockerfile-utils#75](https://github.com/rcjsuen/dockerfile-utils/issues/75))
  - fix parsing of embedded comments in multiline instructions that have a trailing escape character ([rcjsuen/dockerfile-utils#74](https://github.com/rcjsuen/dockerfile-utils/issues/74))
- textDocument/semanticTokens
  - revamp to better handle strings, more tokens supported, and various fixes ([#239](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/239))
- textDocument/signatureHelp
  - use plain text instead of Markdown content for the signature label of the escape parser directive ([#64](https://github.com/rcjsuen/dockerfile-language-service/issues/64))

## [0.0.22] - 2020-02-12
### Added
- textDocument/completion
  - support completing of tags for published images on the Docker Store ([rcjsuen/dockerfile-language-service#50](https://github.com/rcjsuen/dockerfile-language-service/issues/50))
  - support completion of the `--platform` flag for FROMs introduced in Docker CE 18.04 ([rcjsuen/dockerfile-language-service#52](https://github.com/rcjsuen/dockerfile-language-service/issues/52))
- textDocument/hover
  - support hover documentation for the `--platform` flag for FROMs introduced in Docker CE 18.04 ([rcjsuen/dockerfile-language-service#53](https://github.com/rcjsuen/dockerfile-language-service/issues/53))
- textDocument/publishDiagnostics
  - add validation of FROM's `--platform` flag introduced in Docker CE 18.04 ([rcjsuen/dockerfile-utils#68](https://github.com/rcjsuen/dockerfile-utils/issues/68))
    - `ValidationCode.UNKNOWN_FROM_FLAG`
  - warn if two escape parser directives are defined ([rcjsuen/dockerfile-utils#70](https://github.com/rcjsuen/dockerfile-utils/issues/70))
- textDocument/semanticTokens
  - experimental work-in-progress support to allow semantic tokens to be calculated and returned ([#239](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/239))
    - as the language server protocol API is still in flux, the exact request parameters and response results may change
    - it is also possible that this request will not be fulfilled in a future release as a decision may be made to drop support for this

### Fixed
- textDocument/formatting
  - do not calculate edits for lines that are already formatted correctly ([rcjsuen/dockerfile-utils#66](https://github.com/rcjsuen/dockerfile-utils/issues/66))
- textDocument/publishDiagnostics
  - allow paths to be quoted in WORKDIRs ([rcjsuen/dockerfile-utils#67](https://github.com/rcjsuen/dockerfile-utils/issues/67))
  - allow an instruction with an argument on the last line to be parsed if it has no leading whitespace and has a length of one ([rcjsuen/dockerfile-utils#69](https://github.com/rcjsuen/dockerfile-utils/issues/69))
- textDocument/rangeFormatting
  - do not calculate edits for lines that are already formatted correctly ([rcjsuen/dockerfile-utils#66](https://github.com/rcjsuen/dockerfile-utils/issues/66))

## [0.0.21] - 2019-05-26
### Added
- textDocument/publishDiagnostics
  - allow Bash syntax for variable modifiers in RUNs ([rcjsuen/dockerfile-utils#56](https://github.com/rcjsuen/dockerfile-utils/issues/56))
  - warn if FROM has a variable for an image and it references nothing ([rcjsuen/dockerfile-utils#59](https://github.com/rcjsuen/dockerfile-utils/issues/59))

### Fixed
- textDocument/completion
  - corrected a small typo for VOLUME ([rcjsuen/dockerfile-language-service#47](https://github.com/rcjsuen/dockerfile-language-service/issues/47))
- textDocument/definition
  - only allow alphanumeric characters and underscores in variable names ([rcjsuen/dockerfile-language-service#49](https://github.com/rcjsuen/dockerfile-language-service/issues/49))
- textDocument/documentHighlight
  - only allow alphanumeric characters and underscores in variable names ([rcjsuen/dockerfile-language-service#49](https://github.com/rcjsuen/dockerfile-language-service/issues/49))
- textDocument/hover
  - corrected a small typo for VOLUME ([rcjsuen/dockerfile-language-service#47](https://github.com/rcjsuen/dockerfile-language-service/issues/47))
  - only allow alphanumeric characters and underscores in variable names ([rcjsuen/dockerfile-language-service#49](https://github.com/rcjsuen/dockerfile-language-service/issues/49))
- textDocument/prepareRename
  - only allow alphanumeric characters and underscores in variable names ([rcjsuen/dockerfile-language-service#49](https://github.com/rcjsuen/dockerfile-language-service/issues/49))
- textDocument/publishDiagnostics
  - EXPOSE on a port with an ENV variable that references a valid ARG variable should not get flagged as an error ([#235](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/235))
  - allow quoted ARG variables in EXPOSE ([rcjsuen/dockerfile-utils#58](https://github.com/rcjsuen/dockerfile-utils/issues/58))
  - do not validate variable substitutions if found in RUN ([rcjsuen/dockerfile-utils#60](https://github.com/rcjsuen/dockerfile-utils/issues/60))
- textDocument/rename
  - only allow alphanumeric characters and underscores in variable names ([rcjsuen/dockerfile-language-service#49](https://github.com/rcjsuen/dockerfile-language-service/issues/49))

## [0.0.20] - 2019-01-01
### Added
- textDocument/foldingRange
  - support folding of instructions that span multiple lines ([rcjsuen/dockerfile-language-service#43](https://github.com/rcjsuen/dockerfile-language-service/issues/43))
- textDocument/prepareRename
  - add support for determining whether something in a Dockerfile can be renamed or not ([#231](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/231))

### Fixed
- ignore invalid URIs from the client ([#232](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/232))
- textDocument/foldingRange
  - consider non-numeric values properly when checking the client's range limit for folding ranges ([#229](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/229))
- textDocument/publishDiagnostics
  - ignore variables when validating directories for ARGs and COPYs ([rcjsuen/dockerfile-utils#54](https://github.com/rcjsuen/dockerfile-utils/issues/54))
- textDocument/definition
  - allow build stages to be case insensitive when looking up its definition ([rcjsuen/dockerfile-language-service#41](https://github.com/rcjsuen/dockerfile-language-service/issues/41))
- textDocument/documentHighlight
  - allow build stages to be case insensitive when highlighting them ([rcjsuen/dockerfile-language-service#41](https://github.com/rcjsuen/dockerfile-language-service/issues/41))
  - consider all build stages with the same name in FROMs when highlighting ([rcjsuen/dockerfile-language-service#42](https://github.com/rcjsuen/dockerfile-language-service/issues/42))
- textDocument/rename
  - allow build stages to be case insensitive when renaming them ([rcjsuen/dockerfile-language-service#41](https://github.com/rcjsuen/dockerfile-language-service/issues/41))
  - consider all build stages with the same name in FROMs when renaming ([rcjsuen/dockerfile-language-service#42](https://github.com/rcjsuen/dockerfile-language-service/issues/42))

## [0.0.19] - 2018-08-22
### Added
- textDocument/codeActions
  - return code action literals if the client supports it ([#225](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/225))
- textDocument/publishDiagnostics
  - add support for SCTP in EXPOSE instruction ([rcjsuen/dockerfile-utils#52](https://github.com/rcjsuen/dockerfile-utils/issues/52))
  - warn if WORKDIR is not an absolute path ([#228](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/228))
- textDocument/foldingRange
  - add support for computing folding ranges in a Dockerfile ([#226](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/226))

### Changed
- [upgraded the dependency of Mocha](https://github.com/mochajs/mocha/issues/2791) from 3.x to 5.x
  - versions prior to 4.x of Mocha dependended on Growl 1.9.2 which contained a [security vulnerability](https://github.com/tj/node-growl/issues/60)
  - as Mocha is a `devDependencies` module, there is no reason to believe that consumers of the `dockerfile-language-server-nodejs` module itself was affected by this vulnerability

### Fixed
- textDocument/completion
  - send back deprecated items for MAINTAINER if the client supports it  ([#224](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/224))
- textDocument/didChange
  - handle notifications that do not specify the range of the event ([#227](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/227))
- textDocument/publishDiagnostics
  - fix incorrect validation of ENV and LABEL instructions with many quoted properties on mulitple lines ([rcjsuen/dockerfile-utils#50](https://github.com/rcjsuen/dockerfile-utils/issues/50))

## [0.0.18] - 2018-06-30
### Added
- documentLink/resolve
  - document links are now resolved in a two-step process ([#221](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/221))
- textDocument/completion
  - MAINTAINER instructions flagged as being deprecated ([rcjsuen/dockerfile-language-service#35](https://github.com/rcjsuen/dockerfile-language-service/issues/35))
- textDocument/documentSymbol
  - MAINTAINER instructions flagged as being deprecated ([#223](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/223))
- textDocument/publishDiagnostics
  - flag FROM instructions that refer to an invalid image digest in a private registry with a port as an error ([rcjsuen/dockerfile-utils#42](https://github.com/rcjsuen/dockerfile-utils/issues/42))
  - flag variables that have an invalid modifier set ([rcjsuen/dockerfile-utils#38](https://github.com/rcjsuen/dockerfile-utils/issues/38))
  - warn if ARG instruction does not define a name for the variable ([rcjsuen/dockerfile-utils#45](https://github.com/rcjsuen/dockerfile-utils/issues/45))
  - flag incorrectly quoted arguments for ARG, ENV, and LABEL ([rcjsuen/dockerfile-utils#40](https://github.com/rcjsuen/dockerfile-utils/issues/40))

### Fixed
- textDocument/completion
  - image tag completion inserts extra text if word boundary is ambiguous ([rcjsuen/dockerfile-language-service#39](https://github.com/rcjsuen/dockerfile-language-service/issues/39))
- textDocument/hover
  - resolve variables to uninitialized ARGs with ARGs at the top of the Dockerfile if they exist ([rcjsuen/dockerfile-language-service#34](https://github.com/rcjsuen/dockerfile-language-service/issues/34))
- textDocument/publishDiagnostics
  - fix incorrect validation warning in ARG, ENV, and LABEL instructions caused by quotes being used in variable replacements ([rcjsuen/dockerfile-utils#36](https://github.com/rcjsuen/dockerfile-utils/issues/36))
  - fix incorrect validation of tagged images caused by FROM referencing images in a private registry ([rcjsuen/dockerfile-utils#39](https://github.com/rcjsuen/dockerfile-utils/issues/39))
  - allow variables to be used in a FROM's base image argument ([rcjsuen/dockerfile-utils#43](https://github.com/rcjsuen/dockerfile-utils/issues/43))
  - handle ARG instructions with escaped newlines that lead to an EOF comment ([rcjsuen/dockerfile-utils#44](https://github.com/rcjsuen/dockerfile-utils/issues/44))

## [0.0.17] - 2018-04-16
### Added
- support fulfillment of textDocument requests to the server even if textDocument/didOpen has not been sent for a file ([#215](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/215))

### Fixed
- do not flag FROM instructions that use variables with an error ([rcjsuen/dockerfile-utils#35](https://github.com/rcjsuen/dockerfile-utils/issues/35))

## [0.0.16] - 2018-04-14
### Fixed
- textDocument/publishDiagnostics
  - fix validator to consider the instructionJSONInSingleQuotes setting ([#218](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/218))

## [0.0.15] - 2018-04-14
### Added
- settings
  - docker.languageserver.diagnostics.instructionJSONInSingleQuotes? ([#217](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/217))
    - value = ( "ignore" | "warning" | "error" )
- completionItem/resolve
  - use Markdown for a completion item's documentation field if the client supports it ([#207](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/207))
- textDocument/publishDiagnostics
  - warn if hyphens are being parsed as a unit of time in HEALTHCHECK duration flags ([rcjsuen/dockerfile-utils#24](https://github.com/rcjsuen/dockerfile-utils/issues/24))
  - warn if two or more decimals found in a unit of time in HEALTHCHECK duration flags ([rcjsuen/dockerfile-utils#25](https://github.com/rcjsuen/dockerfile-utils/issues/25))
  - warn if two hyphens are found in HEALTHCHECK duration flags ([rcjsuen/dockerfile-utils#26](https://github.com/rcjsuen/dockerfile-utils/issues/26))
  - warn if instruction is written in JSON form incorrectly with single quotes ([rcjsuen/dockerfile-utils#28](https://github.com/rcjsuen/dockerfile-utils/issues/28))

### Fixed
- textDocument/didChange
  - apply received changes in a textDocument/didChange in the order given in the JSON result instead of trying to sort them and apply them backwards ([#216](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/216))
- textDocument/publishDiagnostics
  - clear diagnostics when server receives textDocument/didClose so that they do not linger in the client ([#214](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/214))
  - fix incorrect validation error if a COPY uses JSON arguments and its last string argument is correctly defined as a folder ([#217](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/217))
  - fix incorrect validation error if an ADD uses JSON arguments and its last string argument is correctly defined as a folder ([rcjsuen/dockerfile-utils#30](https://github.com/rcjsuen/dockerfile-utils/issues/30))
  - skip validation of content after a JSON's closing bracket ([rcjsuen/dockerfile-utils#33](https://github.com/rcjsuen/dockerfile-utils/issues/33))
  - fix validation of number of arguments for ADD and COPY instructions written in JSON ([rcjsuen/dockerfile-utils#34](https://github.com/rcjsuen/dockerfile-utils/issues/34))

## [0.0.14] - 2018-03-08
### Added
- update to target version 3.6.0 of the Language Server Protocol specification
- create dependency on the dockerfile-language-service module ([#205](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/205))
- add package-lock.json file to help ensure a consistent dependency tree ([#210](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/210))
- update documentation to state that ARG was introduced in Docker 1.9 ([rcjsuen/dockerfile-language-service#7](https://github.com/rcjsuen/dockerfile-language-service/issues/7))
- textDocument/codeAction
  - create docker.command.removeEmptyContinuationLine to remove empty continuation lines in instructions that span multiple lines ([#203](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/203))
- textDocument/documentLink
  - create links to hub.docker.com for base image names in FROM ([#204](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/204))
- textDocument/hover
  - inspect client's capabilities to decide what content format to use for hovers ([#209](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/209))
- textDocument/publishDiagnostics
  - flag HEALTHCHECK durations that include a hyphen as an error ([rcjsuen/dockerfile-utils#18](https://github.com/rcjsuen/dockerfile-utils/issues/18))
  - warn if ADD has more than two arguments and its last argument is not a directory ([rcjsuen/dockerfile-utils#17](https://github.com/rcjsuen/dockerfile-utils/issues/17))
  - warn if COPY has more than two arguments and its last argument is not a directory ([rcjsuen/dockerfile-utils#14](https://github.com/rcjsuen/dockerfile-utils/issues/14))
  - warn if FROM's base image's digest is invalid ([rcjsuen/dockerfile-utils#15](https://github.com/rcjsuen/dockerfile-utils/issues/15))
  - warn if FROM's base image's tag is invalid ([rcjsuen/dockerfile-utils#20](https://github.com/rcjsuen/dockerfile-utils/issues/20))
- workspace/applyEdit
  - use versioned edits if the client supports it via the documentChanges client capability ([#202](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/202))

### Changed
- this module now depends on version 4.0.0 of the vscode-languageserver npm module

### Fixed
- merge defined and default variables together when suggesting completion items ([#200](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/200))
- do not suggest variables from another build stage as a completion item ([#201](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/201))
- change documentation to state that STOPSIGNAL was added in Docker 1.9 instead of Docker 1.12 ([rcjsuen/dockerfile-language-service#6](https://github.com/rcjsuen/dockerfile-language-service/issues/6))
- ignore and return null for hover computations with an invalid position ([rcjsuen/dockerfile-language-service#22](https://github.com/rcjsuen/dockerfile-language-service/issues/22))
- textDocument/publishDiagnostics
  - allow decimal values for HEALTHCHECK duration flags ([rcjsuen/dockerfile-utils#19](https://github.com/rcjsuen/dockerfile-utils/issues/19))
  - warn if STOPSIGNAL uses invalid variables for its argument ([rcjsuen/dockerfile-utils#11](https://github.com/rcjsuen/dockerfile-utils/issues/11))
  - use a non-zero range for the diagnostic if FROM's base image's digest is the empty string ([rcjsuen/dockerfile-utils#21](https://github.com/rcjsuen/dockerfile-utils/issues/21))
  - ignore multiple CMD, ENTRYPOINT, and HEALTHCHECK instructions in a Dockerfile if there is only ever one in a build stage ([rcjsuen/dockerfile-utils#22](https://github.com/rcjsuen/dockerfile-utils/issues/22))
- textDocument/signatureHelp
  - align active parameter amongst all displayed signatures for a FROM with a build stage name ([rcjsuen/dockerfile-language-service#8](https://github.com/rcjsuen/dockerfile-language-service/issues/8))
- workspace/configuration
  - update code to consider it as a formal API instead of a proposed API ([#211](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/211))

### Removed
- remove document analysis and processing code and tests in favor of the dockerfile-language-service module ([#205](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/205))

## [0.0.13] - 2018-01-19
### Added
- create dependency on the dockerfile-utils module ([#79](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/79))
- textDocument/publishDiagnostics
  - warn if COPY's --from flag is invalid ([#149](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/149))

### Fixed
- ignore ARG variables with no default values in an EXPOSE ([#199](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/199))

### Removed
- remove validation code and tests in favor of the dockerfile-utils module ([#79](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/79))

## [0.0.12] - 2018-01-11
### Added
- create dependency on the dockerfile-ast NPM module ([#196](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/196))
- textDocument/completion
  - documentation for ADD and COPY's --chown flag ([#181](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/181))
- textDocument/hover
  - ADD and COPY's --chown flag ([#181](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/181))

### Fixed
- prevent signature help from showing in a multiline instruction's embedded comment ([#195](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/195))
- publish the docker-langserver binary with \n line endings for OS X ([#198](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/198))

### Removed
- remove Dockerfile parsing code in src/parser ([#196](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/196))

## [0.0.11] - 2017-11-15
### Added
- create a Docker image to run the language server ([#189](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/189))

### Fixed
- prevent completion items from being displayed in comments ([#190](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/190))
- expand environment variables when validating an EXPOSE ([#192](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/192))
- ignore variables that are in a LABEL's single quoted value string ([#191](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/191))
- support environment variables that span multiple lines ([#193](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/193))
- ignore spaces that come after an environment variable ([#194](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/194))

## [0.0.10] - 2017-10-23
### Added
- textDocument/codeAction
  - create docker.command.flagToChown to convert an unknown ADD or COPY flag to a --chown ([#187](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/187))
### Fixed
- use a reasonable range for the diagnostic if an unknown flag has no name ([#186](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/186))
- specify a section name when sending a workspace/configuration request ([#182](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/182))

## [0.0.9] - 2017-10-14
### Added
- settings
  - docker.languageserver.diagnostics.emptyContinuationLine? ([#177](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/177))
    - value = ( "ignore" | "warning" | "error" )
    - toggles the diagnostic severity if empty continuation lines are found
- textDocument/publishDiagnostics
  - warn about empty continuation lines ([#177](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/177))
  - warn if ADD does not have two arguments ([#185](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/185))

### Fixed
- allow parameters to be suggested even if an ARG has no variables defined ([#184](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/184))
- do not assume that clients support workspace/applyEdit ([#183](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/183))
- fix broken socket support ([#178](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/178))

## [0.0.8] - 2017-10-05
### Added
- textDocument/codeAction
  - create commands for converting unknown HEALTHCHECK flags ([#172](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/172))
    - docker.command.flagToHealthcheckInterval
    - docker.command.flagToHealthcheckRetries
    - docker.command.flagToHealthcheckStartPeriod
    - docker.command.flagToHealthcheckTimeout
  - create docker.command.flagToCopyFrom to convert an unknown COPY flag ([#171](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/171))
- textDocument/completion
  - HEALTHCHECK's CMD and NONE arguments ([#169](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/169))
  - ADD and COPY's --chown flag ([#166](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/166))
- textDocument/publishDiagnostics
  - warn if HEALTHCHECK's argument is not CMD or NONE ([#173](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/173))
  - warn if HEALTHCHECK has a flag but no arguments ([#174](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/174))
  - validate --chown flag in ADD and COPY ([#166](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/166))
- textDocument/signatureHelp
  - update ADD's signature to support the new --chown flag ([#166](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/166))
- workspace/configuration
  - implemented support to allow validator settings to not be global ([#179](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/179))

### Fixed
- correct the documentation of HEALTHCHECK's --retries flag's completion item ([#170](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/170))
- show correct parameter in HEALTHCHECK's signature help if it has an escaped newline ([#175](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/175))
- show correct parameter in ENV and LABEL's signature help if it has an escaped newline ([#176](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/176))

## [0.0.7] - 2017-09-09
### Added
- textDocument/completion
  - COPY's --from build stage flag ([#148](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/148))
  - add '-' as a trigger character to suggest instruction flags ([#155](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/155))
  - suggest image tags in FROM instructions ([#154](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/154))
  - set source image as suggested build stage's documentation text ([#159](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/159))
  - suggest numeric build stage index if source image is unnamed ([#160](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/160))
- textDocument/hover
  - COPY's --from build stage flag ([#150](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/150))
- textDocument/publishDiagnostics
  - warn if ENV or LABEL is missing closing quote ([#143](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/143))
  - warn if FROM's build stage name is invalid ([#132](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/132))
  - warn if an invalid unit of time is used in a duration flag ([#152](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/152))
  - warn if COPY does not have two arguments ([#157](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/157))
- textDocument/signatureHelp
  - escape parser directive ([#147](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/147))
  - instruction flags ([#147](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/147))
    - COPY's --from
    - HEALTHCHECK CMD flags
  - instructions ([#162](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/162))

### Fixed
- correct handling of escaped quotes in ENV variables ([#144](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/144))
- include escape character in value of single quoted ENV variables ([#146](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/146))
- ignore whitespace that precedes an escaped newline in ENV variables ([#147](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/147))
- fix handling of escape characters in SHELL's JSON strings ([#151](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/151))
- do not suggest duplicated build stage names as completion items ([#156](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/156))
- only suggest build stages that come after the current COPY line ([#158](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/158))
- restrict operations on ARG and ENV variables to a build stage ([#163](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/163))
- make FROM variables only interact with the initial set of ARG instructions ([#153](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/153))
- skip validation of nested comments in escaped newlines of ENV and LABEL instructions ([#167](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/167))
- prevent hovers from rendering nested comments for ARG and ENV instructions ([#168](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/168))

## [0.0.6] - 2017-08-12
### Added
- textDocument/completion
  - suggest completion items even if the prefix string's case does not match ([#142](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/142))
- textDocument/publishDiagnostics
  - warn about duplicated build stage names ([#133](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/133))

### Fixed
- fix completion handling so that the escape parser directive is suggested in more cases ([#138](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/138))
- always use the first declaration of a variable for its definition ([#141](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/141))
- highlight ARG variables that get declared again ([#140](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/140))

## [0.0.5] - 2017-08-07
### Fixed
- do not show arguments if snippets are not supported ([#136](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/136))
- show only one ARG completion item if snippets are not supported ([#137](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/137))

## [0.0.4] - 2017-08-06
### Fixed
- created actual docker-langserver file instead of referencing server.js ([#134](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/134))

## [0.0.3] - 2017-08-06
### Added
- created a docker-langserver binary for launching the server ([#134](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/134))
- textDocument/codeAction
  - created docker.command.convertToLowercase for directives not written in lowercase ([#128](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/128))
- textDocument/onTypeFormatting
  - format the next line if an escape character is inserted ([#130](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/130))
- textDocument/publishDiagnostics
  - validate the syntax of LABEL instructions ([#100](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/100))
  - warn if invalid ONBUILD trigger instructions are used ([#117](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/117))
  - warn if ENV/LABEL instructions have a blank name ([#122](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/122))
  - EXPOSE
    - warn if an invalid protocol is specified ([#126](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/126))
  - SHELL
    - check that SHELL instructions are written as a JSON array ([#92](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/92))
    - warn if SHELL's JSON array is empty ([#122](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/122))
- workspace/executeCommand
  - handle docker.command.convertToLowercase and convert the string in the range to lowercase ([#128](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/128))

### Fixed
- fixed parsing of escaped whitespace values in ENV instructions ([#115](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/115))
- prevent undeclared variables from being suggested as completion items ([#118](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/118))
- prevent completion items from being suggested in multiline instructions ([#125](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/125))
- handle TCP and UDP in an EXPOSE instruction's argument ([#123](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/123))
- only search for parser directives at the top of a Dockerfile ([#129](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/129))
- fix handling of escape characters nested in an instruction ([#131](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/131))

## [0.0.2] - 2017-07-31
### Added
- settings
  - docker.languageserver.diagnostics.instructionCmdMultiple? ([#81](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/81))
    - value = ( "ignore" | "warning" | "error" )
    - toggles the diagnostic severity if multiple CMD instructions are found in the Dockerfile
  - docker.languageserver.diagnostics.instructionEntrypointMultiple? ([#90](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/90))
    - value = ( "ignore" | "warning" | "error" )
    - toggles the diagnostic severity if multiple ENTRYPOINT instructions are found in the Dockerfile
  - docker.languageserver.diagnostics.instructionHealthcheckMultiple? ([#80](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/80))
    - value = ( "ignore" | "warning" | "error" )
    - toggles the diagnostic severity if multiple HEALTHCHECK instructions are found in the Dockerfile
- textDocument/completion
  - suggest build stage names in a COPY instruction ([#44](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/44))
  - add '=' as a trigger character
  - include the --start-period flag in HEALTHCHECK CMD items ([#78](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/78))
  - HEALTHCHECK CMD flags ([#69](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/69), [#101](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/101))
  - suggest $ variables ([#93](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/93))
    - ARG and ENV variables
    - default Docker ARG variables 
    - add '$' as a trigger character 
- textDocument/hover
  - HEALTHCHECK CMD flags ([#82](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/82), [#104](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/104))
- textDocument/publishDiagnostics
  - check the spelling of instruction flags ([#75](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/75))
    - COPY's from
    - HEALTHCHECK's interval, retries, start-period, timeout
  - multiple instructions found when only one allowed
    - CMD ([#81](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/81))
    - ENTRYPOINT ([#90](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/90))
    - HEALTHCHECK ([#80](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/80))
  - check that the same flag is not used twice ([#83](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/83))
    - COPY's from
    - HEALTHCHECK's interval, retries, start-period, timeout
  - check that flags have a value defined ([#91](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/91))
    - COPY's from
    - HEALTHCHECK's interval, retries, start-period, timeout
  - HEALTHCHECK
    - warn if arguments follow a HEALTHCHECK NONE ([#84](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/84))
    - warn if the retries flag doesn't specify a number ([#85](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/85))
    - warn if the retries flag is not a positive intger ([#89](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/89))
    - warn if no arguments follow a HEALTHCHECK CMD ([#96](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/96))
    - warn if duration flags are invalid ([#87](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/87))
    - warn if duration flags do not specify a duration ([#86](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/86))
    - warn if duration flags are too short ([#97](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/97))
  - ONBUILD
    - trigger instruction not written in uppercase ([#102](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/102))
    - create diagnostics for validating trigger instructions' content ([#112](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/112))
- created a CHANGELOG.md file to document the project's changes ([#77](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/77))

### Fixed
- fixed a typo in completion items for WORKDIR ([#76](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/76))
- fixed a parsing problem with ENV variables and escaped characters ([#94](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/94))
- fixed CMD validation to not warn even if there are no arguments ([#98](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/98s))
- fixed code actions to return something if a diagnostic's code is a string and not a number  ([#99](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/99))
- fixed hovers not working for ONBUILD triggers that are not written in uppercase ([#103](https://github.com/rcjsuen/dockerfile-language-server-nodejs/issues/103))

## 0.0.1 - 2017-07-16
### Added
- textDocument/didChange
  - incremental document synchronization
- textDocument/publishDiagnostics
  - instructions not written in uppercase
  - directives not written in lowercase
  - missing or incorrect number of expected of arguments to an instruction
  - invalid escape parser directive value
  - EXPOSE
    - invalid container port
  - FROM
    - no FROM instruction found
    - having a second argument not equal to the AS keyword
  - STOPSIGNAL
    - invalid stop signal definition
- textDocument/codeAction
  - convert instruction to uppercase
  - remove extra argument to instruction
  - convert invalid escape directive to backslash
  - convert invalid escape directive to backtick
  - convert second argument of FROM to AS
- textDocument/completion
  - snippets support
  - instructions
  - escaper parser directive
  - ONBUILD trigger instructions
- completionItem/resolve
  - provide documentation information
- textDocument/hover
  - instructions
  - escape parser directive
  - ONBUILD trigger instructions
  - ARG and ENV variables
- textDocument/documentHighlight
  - ARG and ENV variables
  - FROM and COPY build stages
- textDocument/rename
  - ARG and ENV variables
  - FROM and COPY build stages
- textDocument/definition
  - ARG and ENV variables
  - FROM and COPY build stages
- textDocument/documentSymbol
  - instructions
  - escape parser directive
- textDocument/formatting
- textDocument/rangeFormatting

[Unreleased]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.8.0...HEAD
[0.8.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.7.3...v0.8.0
[0.7.3]: https://github.com/rcjsuen/dockerfile-utils/compare/v0.7.2...v0.7.3
[0.7.2]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.7.1...v0.7.2
[0.7.1]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.7.0...v0.7.1
[0.7.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.6.0...v0.7.0
[0.6.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.5.0...v0.6.0
[0.5.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.4.1...v0.5.0
[0.4.1]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.4.0...v0.4.1
[0.4.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.3.0...v0.4.0
[0.3.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.2.2...v0.3.0
[0.2.2]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.2.1...v0.2.2
[0.2.1]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.2.0...v0.2.1
[0.2.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.1.0...v0.1.1
[0.1.0]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.24...v0.1.0
[0.0.24]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.23...v0.0.24
[0.0.23]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.22...v0.0.23
[0.0.22]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.21...v0.0.22
[0.0.21]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.20...v0.0.21
[0.0.20]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.19...v0.0.20
[0.0.19]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.18...v0.0.19
[0.0.18]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.17...v0.0.18
[0.0.17]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.16...v0.0.17
[0.0.16]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.15...v0.0.16
[0.0.15]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.14...v0.0.15
[0.0.14]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.13...v0.0.14
[0.0.13]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.12...v0.0.13
[0.0.12]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.11...v0.0.12
[0.0.11]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.10...v0.0.11
[0.0.10]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.9...v0.0.10
[0.0.9]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.8...v0.0.9
[0.0.8]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.7...v0.0.8
[0.0.7]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.6...v0.0.7
[0.0.6]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.5...v0.0.6
[0.0.5]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.4...v0.0.5
[0.0.4]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.3...v0.0.4
[0.0.3]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.2...v0.0.3
[0.0.2]: https://github.com/rcjsuen/dockerfile-language-server-nodejs/compare/v0.0.1...v0.0.2
