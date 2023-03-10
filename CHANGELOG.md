# Changelog

## [v8.0.0](https://github.com/fastly/cli/releases/tag/v8.0.0) (2023-03-08)

[Full Changelog](https://github.com/fastly/cli/compare/v7.0.1...v8.0.0)

**Breaking:**

This release contains a small breaking interface change that has required us to bump to a new major version.

When viewing a profile token using `fastly profile token` the `--name` flag is no longer supported. It has been moved to a positional argument to make it consistent with the other profile subcommands. The `profile token` command now respects the global `--profile` flag, which allows a user to switch profiles for the lifetime of a single command execution.

Examples:

- `fastly profile token --name=example` -> `fastly profile token example`
- `fastly profile token --profile=example`

* breaking(profiles): replace `--name` with positional arg + allow global override [#862](https://github.com/fastly/cli/pull/862)

**Bug fixes:**

* fix(build): show build output with `--verbose` flag [#853](https://github.com/fastly/cli/pull/853)

**Enhancements:**

* fix(profile/update): update active profile as default behaviour [#857](https://github.com/fastly/cli/pull/857)
* fix(compute/serve): allow overriding of viceroy binary [#859](https://github.com/fastly/cli/pull/859)
* feat(compute/deploy): check service availability [#860](https://github.com/fastly/cli/pull/860)

**Dependencies:**

* build(deps): bump github.com/getsentry/sentry-go from 0.18.0 to 0.19.0 [#856](https://github.com/fastly/cli/pull/856)
* build(deps): bump golang.org/x/crypto [#855](https://github.com/fastly/cli/pull/855)

## [v7.0.1](https://github.com/fastly/cli/releases/tag/v7.0.1) (2023-03-02)

[Full Changelog](https://github.com/fastly/cli/compare/v7.0.0...v7.0.1)

**Bug fixes:**

* fix(compute/build): move log calls before subprocess call [#847](https://github.com/fastly/cli/pull/847)
* fix(compute/serve): ensure spinner is closed for all logic branches [#849](https://github.com/fastly/cli/pull/849)

**Enhancements:**

* feat(dict/create): display dictionary ID on creation [#848](https://github.com/fastly/cli/pull/848)
* refactor: clean-up nil error checks [#851](https://github.com/fastly/cli/pull/851)

## [v7.0.0](https://github.com/fastly/cli/releases/tag/v7.0.0) (2023-02-23)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.6...v7.0.0)

**Breaking:**

There are a couple of small breaking changes to the CLI.

Prior versions of the CLI would consult the following files to ignore specific files while running `compute serve --watch`:

- `.ignore`
- `.gitignore`
- The user's global git ignore configuration

We are dropping support for these files and will instead consult `.fastlyignore`, which is already used by `compute build`.

We've removed support for the `logging logentries` subcommand as the third-party logging product has been deprecated.

* fix(compute/serve): replace separate ignore files with `.fastlyignore` [#834](https://github.com/fastly/cli/pull/834)
* breaking(logging): remove logentries [#835](https://github.com/fastly/cli/pull/835)

**Bug fixes:**

* fix(compute/build): ignore all files except manifest and wasm binary [#836](https://github.com/fastly/cli/pull/836)
* fix(compute/serve): output rendering [#839](https://github.com/fastly/cli/pull/839)
* Fix compute build rendered output [#842](https://github.com/fastly/cli/pull/842)

**Enhancements:**

* use secret store client keys when creating secret store entries [#805](https://github.com/fastly/cli/pull/805)
* fix(compute/serve): check for missing override_host [#832](https://github.com/fastly/cli/pull/832)
* feat(resource-link): Add Service Resource commands [#800](https://github.com/fastly/cli/pull/800)
* Replace custom spinner with less buggy third-party package [#838](https://github.com/fastly/cli/pull/838)
* refactor(spinner): hide `...` after spinner has stopped [#840](https://github.com/fastly/cli/pull/840)
* fix(compute/serve): make override_host a default behaviour [#843](https://github.com/fastly/cli/pull/843)

**Dependencies:**

* build(deps): bump golang.org/x/net from 0.2.0 to 0.7.0 [#830](https://github.com/fastly/cli/pull/830)
* build(deps): bump github.com/fastly/go-fastly/v7 from 7.2.0 to 7.3.0 [#831](https://github.com/fastly/cli/pull/831)

**Clean-ups:**

* refactor: linter issues resolved [#833](https://github.com/fastly/cli/pull/833)

## [v6.0.6](https://github.com/fastly/cli/releases/tag/v6.0.6) (2023-02-15)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.5...v6.0.6)

**Bug fixes:**

* build(goreleaser): build with explicit `CGO_ENABLED=0` [#826](https://github.com/fastly/cli/pull/826)

## [v6.0.5](https://github.com/fastly/cli/releases/tag/v6.0.5) (2023-02-15)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.4...v6.0.5)

**Enhancements:**

* fix(dns): migrate to go1.20 [#824](https://github.com/fastly/cli/pull/824)

## [v6.0.4](https://github.com/fastly/cli/releases/tag/v6.0.4) (2023-02-13)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.3...v6.0.4)

**Bug fixes:**

* fix(compute/build): only use default build script if none defined [#814](https://github.com/fastly/cli/pull/814)
* fix(compute/deploy): replace spinner implementation [#820](https://github.com/fastly/cli/pull/820)

**Enhancements:**

* fix(compute/build): ensure build output doesn't show unless --verbose is set [#815](https://github.com/fastly/cli/pull/815)

**Documentation:**

* docs: remove --skip-verification [#816](https://github.com/fastly/cli/pull/816)

**Dependencies:**

* build(deps): bump github.com/fastly/go-fastly/v7 from 7.1.0 to 7.2.0 [#819](https://github.com/fastly/cli/pull/819)
* build(deps): bump github.com/getsentry/sentry-go from 0.17.0 to 0.18.0 [#818](https://github.com/fastly/cli/pull/818)
* build(deps): bump golang.org/x/term from 0.4.0 to 0.5.0 [#817](https://github.com/fastly/cli/pull/817)

## [v6.0.3](https://github.com/fastly/cli/releases/tag/v6.0.3) (2023-02-09)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.2...v6.0.3)

**Bug fixes:**

* fix(compute/setup): fix duplicated domains [#808](https://github.com/fastly/cli/pull/808)
* fix(setup/domain): allow user to correct a domain already in use [#811](https://github.com/fastly/cli/pull/811)

**Enhancements:**

* build(goreleaser): replace deprecated flag [#807](https://github.com/fastly/cli/pull/807)
* refactor: add type annotations [#809](https://github.com/fastly/cli/pull/809)
* build(lint): implement semgrep for local validation [#810](https://github.com/fastly/cli/pull/810)

## [v6.0.2](https://github.com/fastly/cli/releases/tag/v6.0.2) (2023-02-08)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.1...v6.0.2)

**Bug fixes:**

* fix(compute/build): ensure we only parse stdout from cargo command [#804](https://github.com/fastly/cli/pull/804)

## [v6.0.1](https://github.com/fastly/cli/releases/tag/v6.0.1) (2023-02-08)

[Full Changelog](https://github.com/fastly/cli/compare/v6.0.0...v6.0.1)

**Enhancements:**

* refactor(compute): add command output when there is an error [#801](https://github.com/fastly/cli/pull/801)

## [v6.0.0](https://github.com/fastly/cli/releases/tag/v6.0.0) (2023-02-07)

[Full Changelog](https://github.com/fastly/cli/compare/v5.1.1...v6.0.0)

**Breaking:**

There are three breaking changes in this release.

The first comes from the removal of logic related to user environment 
validation. This logic existed as an attempt to reduce the number of possible 
errors when trying to compile a Compute project. The reality was that this 
validation logic was tightly coupled to specific expectations of the CLI 
(and of its starter kits) and consequently resulted in errors that were often 
difficult to understand and debug, as well as restricting users from using their 
own tools and scripts. By simplifying the logic flow we hope to reduce friction 
for users who want to switch the tooling used, as well as reduce the general 
confusion caused for users when there are environment validation errors, while 
also reducing the maintenance overhead for contributors to the CLI code base.
This change has meant we no longer need to define a `--skip-validation` flag and 
that resulted in a breaking interface change.

The second breaking change is to the `objectstore` command. This has now been 
renamed to `object-store`. Additionally, there is no `keys`, `get` or `insert` 
commands for manipulating the object-store entries. These operations have been 
moved to a separate subcommand `object-store-entry` as this keeps the naming and 
structural convention consistent with ACLs and Edge Dictionaries.

The third breaking change is to Edge Dictionaries, which sees the
`dictionary-item` subcommand renamed to `dictionary-entry`, again for
consistency with other similar subcommands.

* Remove user environment validation logic [#785](https://github.com/fastly/cli/pull/785)
* Rework objectstore subcommand [#792](https://github.com/fastly/cli/pull/792)
* Rename object store 'keys' to 'entry' for consistency [#795](https://github.com/fastly/cli/pull/795)
* refactor(dictionaryitem): rename from item to entry [#798](https://github.com/fastly/cli/pull/798)

**Bug fixes:**

* Fix description in the manifest [#788](https://github.com/fastly/cli/pull/788)

**Enhancements:**

* Update `local_server` object and secret store formats [#789](https://github.com/fastly/cli/pull/789)

**Clean-ups:**

* refactor: move global struct and config.Source types into separate packages [#796](https://github.com/fastly/cli/pull/796)
* refactor(secretstore): divide command files into separate packages [#797](https://github.com/fastly/cli/pull/797)

## [v5.1.1](https://github.com/fastly/cli/releases/tag/v5.1.1) (2023-02-01)

[Full Changelog](https://github.com/fastly/cli/compare/v5.1.0...v5.1.1)

**Bug fixes:**

* fix(compute/build): AssemblyScript bugs [#786](https://github.com/fastly/cli/pull/786)

**Dependencies:**

* Bump github.com/fatih/color from 1.14.0 to 1.14.1 [#783](https://github.com/fastly/cli/pull/783)

## [v5.1.0](https://github.com/fastly/cli/releases/tag/v5.1.0) (2023-01-27)

[Full Changelog](https://github.com/fastly/cli/compare/v5.0.0...v5.1.0)

**Enhancements:**

* Add Secret Store support [#717](https://github.com/fastly/cli/pull/717)
* refactor(compute/deploy): reduce size of `Exec()` [#775](https://github.com/fastly/cli/pull/775)
* refactor(compute/deploy): add messaging to explain `[setup]` [#779](https://github.com/fastly/cli/pull/779)

**Bug fixes:**

* fix(objectstore/get): output value unless verbose/json flag passed [#774](https://github.com/fastly/cli/pull/774)
* fix(compute/init): add warning for paths with spaces [#778](https://github.com/fastly/cli/pull/778)
* fix(compute/deploy): clean-up new service creation on-error [#776](https://github.com/fastly/cli/pull/776)

**Dependencies:**

* Bump github.com/fatih/color from 1.13.0 to 1.14.0 [#772](https://github.com/fastly/cli/pull/772)

## [v5.0.0](https://github.com/fastly/cli/releases/tag/v5.0.0) (2023-01-19)

[Full Changelog](https://github.com/fastly/cli/compare/v4.6.2...v5.0.0)

**Breaking:**

The `objectstore` command was incorrectly configured to have a long flag using 
a single character (e.g. `--k` and `--v`). These were corrected to `--key` and
`--value` (and a short flag variant for `-k` was added as well).

* feat(objectstore): add --json support to keys/list subcommands [#762](https://github.com/fastly/cli/pull/762)
* feat(objectstore/get): implement --json flag for getting key value [#763](https://github.com/fastly/cli/pull/763)

**Enhancements:**

* feat(compute/deploy): add Object Store to manifest [setup] [#764](https://github.com/fastly/cli/pull/764)
* feat(compute/build): support locating language manifests outside project directory [#765](https://github.com/fastly/cli/pull/765)
* feat(compute/serve): implement --watch-dir flag [#758](https://github.com/fastly/cli/pull/758)

**Bug fixes:**

* fix(setup): object_store needs to be linked to service [#767](https://github.com/fastly/cli/pull/767)

**Dependencies:**

* Bump github.com/getsentry/sentry-go from 0.16.0 to 0.17.0 [#759](https://github.com/fastly/cli/pull/759)

## [v4.6.2](https://github.com/fastly/cli/releases/tag/v4.6.2) (2023-01-12)

[Full Changelog](https://github.com/fastly/cli/compare/v4.6.1...v4.6.2)

**Bug fixes:**

* fix(pkg/commands/compute/serve): prevent 386 arch users executing command [#753](https://github.com/fastly/cli/pull/753)
* build(goreleaser): fix Windows archive generation to include zips [#756](https://github.com/fastly/cli/pull/756)

**Dependencies:**

* Bump golang.org/x/term from 0.3.0 to 0.4.0 [#754](https://github.com/fastly/cli/pull/754)

## [v4.6.1](https://github.com/fastly/cli/releases/tag/v4.6.1) (2023-01-05)

[Full Changelog](https://github.com/fastly/cli/compare/v4.6.0...v4.6.1)

**Bug fixes:**

* fix(pkg/commands/vcl/snippet): set default dynamic value [#751](https://github.com/fastly/cli/pull/751)

**Dependencies:** 

* Bump github.com/mattn/go-isatty from 0.0.16 to 0.0.17 [#748](https://github.com/fastly/cli/pull/748)

**Enhancements:**

* build(makefile): add goreleaser target for testing builds locally [#750](https://github.com/fastly/cli/pull/750)

## [v4.6.0](https://github.com/fastly/cli/releases/tag/v4.6.0) (2023-01-03)

[Full Changelog](https://github.com/fastly/cli/compare/v4.5.0...v4.6.0)

**Bug fixes:**

* vcl/snippet: pass AllowActiveLocked if --dynamic was passed [#742](https://github.com/fastly/cli/pull/742)

**Dependencies:** 

* Bump goreleaser/goreleaser-action from 3 to 4 [#746](https://github.com/fastly/cli/pull/746)

**Enhancements:**

* Use DevHub endpoint for acquiring CLI/Viceroy metadata [#739](https://github.com/fastly/cli/pull/739)

## [v4.5.0](https://github.com/fastly/cli/releases/tag/v4.5.0) (2022-12-15)

[Full Changelog](https://github.com/fastly/cli/compare/v4.4.1...v4.5.0)

**Documentation:**

* docs(pkg/compute): remove PLC labels from supported languages [#740](https://github.com/fastly/cli/pull/740)

**Enhancements:**

* refactor(pkg/commands/update): move versioner logic to separate package [#735](https://github.com/fastly/cli/pull/735)
* fix(compute): don't validate js-compute-runtime binary location [#731](https://github.com/fastly/cli/pull/731)
* Link to Starter Kits during compute init [#730](https://github.com/fastly/cli/pull/730)
* Update tinygo default build command [#727](https://github.com/fastly/cli/pull/727)
* CI/Dockerfiles: minor dockerfiles improvements [#722](https://github.com/fastly/cli/pull/722)
* Switch JavaScript build script based on webpack in package.json prebuild [#728](https://github.com/fastly/cli/pull/728)
* Add support for TOML secret_store section [#726](https://github.com/fastly/cli/pull/726)

**Dependencies:** 

* Bump golang.org/x/term from 0.2.0 to 0.3.0 [#733](https://github.com/fastly/cli/pull/733)
* Bump github.com/getsentry/sentry-go from 0.15.0 to 0.16.0 [#734](https://github.com/fastly/cli/pull/734)
* Bump github.com/Masterminds/semver/v3 from 3.1.1 to 3.2.0 [#724](https://github.com/fastly/cli/pull/724)

## [v4.4.1](https://github.com/fastly/cli/releases/tag/v4.4.1) (2022-12-02)

[Full Changelog](https://github.com/fastly/cli/compare/v4.4.0...v4.4.1)

**Bug fixes:**

* Avoid sending empty string to Backend create API [#720](https://github.com/fastly/cli/pull/720)

## [v4.4.0](https://github.com/fastly/cli/releases/tag/v4.4.0) (2022-11-29)

[Full Changelog](https://github.com/fastly/cli/compare/v4.3.0...v4.4.0)

**Enhancements:**

* Add `PrintLines` to `text` package and use in logging [#698](https://github.com/fastly/cli/pull/698)
* Add dependabot workflow automation for updating dependency [#701](https://github.com/fastly/cli/pull/701)
* Add account name to pubsub and bigquery [#699](https://github.com/fastly/cli/pull/699)

**Bug fixes:**

* Add missing `--help` flag to globals [#695](https://github.com/fastly/cli/pull/695)
* Fix check for mutual exclusion flags [#696](https://github.com/fastly/cli/pull/696)
* Fix object store TOML definitions, add test data [#715](https://github.com/fastly/cli/pull/715)

**Dependencies:**

* Bump github.com/otiai10/copy from 1.7.0 to 1.9.0 [#706](https://github.com/fastly/cli/pull/706)
* Bump github.com/mholt/archiver/v3 from 3.5.0 to 3.5.1 [#703](https://github.com/fastly/cli/pull/703)
* Bump github.com/fastly/go-fastly/v6 from 6.6.0 to 6.8.0 [#704](https://github.com/fastly/cli/pull/704)
* Bump github.com/mattn/go-isatty from 0.0.14 to 0.0.16 [#702](https://github.com/fastly/cli/pull/702)
* Bump github.com/google/go-cmp from 0.5.6 to 0.5.9 [#708](https://github.com/fastly/cli/pull/708)
* Bump github.com/mitchellh/mapstructure from 1.4.3 to 1.5.0 [#709](https://github.com/fastly/cli/pull/709)
* Bump github.com/bep/debounce from 1.2.0 to 1.2.1 [#711](https://github.com/fastly/cli/pull/711)
* Bump github.com/getsentry/sentry-go from 0.12.0 to 0.15.0 [#712](https://github.com/fastly/cli/pull/712)
* Bump github.com/pelletier/go-toml from 1.9.3 to 1.9.5 [#710](https://github.com/fastly/cli/pull/710)
* Bump go-fastly to v7 [#707](https://github.com/fastly/cli/pull/707)
* Bump github.com/fsnotify/fsnotify from 1.5.1 to 1.6.0 [#716](https://github.com/fastly/cli/pull/716)

## [v4.3.0](https://github.com/fastly/cli/releases/tag/v4.3.0) (2022-10-26)

[Full Changelog](https://github.com/fastly/cli/compare/v4.2.0...v4.3.0)

**Enhancements:**

* Fix release process to not use external config [#688](https://github.com/fastly/cli/pull/688)
* Skip exit code 1 for 'help' output [#689](https://github.com/fastly/cli/pull/689)
* Implement dynamic package name [#686](https://github.com/fastly/cli/pull/686)
* Replace fiddle.fastly.dev with fiddle.fastlydemo.net [#687](https://github.com/fastly/cli/pull/687)
* Code clean-up [#685](https://github.com/fastly/cli/pull/685)
* Implement --quiet flag [#690](https://github.com/fastly/cli/pull/690)
* Make `compute build` respect `--quiet` [#694](https://github.com/fastly/cli/pull/694)

**Bug fixes:**

* Fix runtime panic [#683](https://github.com/fastly/cli/pull/683)
* Fix runtime panic caused by outdated global flags [#693](https://github.com/fastly/cli/pull/693)
* Fix runtime panic caused by missing `--help` global flag [#695](https://github.com/fastly/cli/pull/695)
* Fix check for mutual exclusion flags[#696](https://github.com/fastly/cli/pull/696)
* Correct installation instructions for Go [#682](https://github.com/fastly/cli/pull/682)

## [v4.2.0](https://github.com/fastly/cli/releases/tag/v4.2.0) (2022-10-18)

[Full Changelog](https://github.com/fastly/cli/compare/v4.1.0...v4.2.0)

**Enhancements:**

* Service Authorization [#660](https://github.com/fastly/cli/pull/660)
* Add Object Store API calls [#670](https://github.com/fastly/cli/pull/670)
* Remove upper limit on Go toolchain [#678](https://github.com/fastly/cli/pull/678)

**Bug fixes:**

* Fix `compute pack` to produce expected `package.tar.gz` filename [#662](https://github.com/fastly/cli/pull/662)
* Fix `--help` flag to not display an error [#672](https://github.com/fastly/cli/pull/672)
* Fix command substitution issue for Windows OS [#677](https://github.com/fastly/cli/pull/677)
* Fix Makefile for Windows [#679](https://github.com/fastly/cli/pull/679)

## [v4.1.0](https://github.com/fastly/cli/releases/tag/v4.1.0) (2022-10-11)

[Full Changelog](https://github.com/fastly/cli/compare/v4.0.1...v4.1.0)

**Bug fixes:**

* Fix Rust validation step for fastly crate dependency [#661](https://github.com/fastly/cli/pull/661)
* Fix `compute build --first-byte-timeout` [#667](https://github.com/fastly/cli/pull/667)
* Ensure the ./bin directory is present even with `--skip-verification` [#665](https://github.com/fastly/cli/pull/665)

**Enhancements:**

* Reduce duplication of strings in logging package [#653](https://github.com/fastly/cli/pull/653)
* Support `cert_host` and `use_sni` Viceroy properties [#663](https://github.com/fastly/cli/pull/663)

## [v4.0.1](https://github.com/fastly/cli/releases/tag/v4.0.1) (2022-10-05)

[Full Changelog](https://github.com/fastly/cli/compare/v4.0.0...v4.0.1)

**Bug fixes:**

* Fix JS dependency lookup [#656](https://github.com/fastly/cli/pull/656)
* Fix Rust 'existing project' bug [#657](https://github.com/fastly/cli/pull/657)
* Fix Rust toolchain lookup regression [#658](https://github.com/fastly/cli/pull/658)

## [v4.0.0](https://github.com/fastly/cli/releases/tag/v4.0.0) (2022-10-04)

[Full Changelog](https://github.com/fastly/cli/compare/v3.3.0...v4.0.0)

**Enhancements:**

* Bump go-fastly to v6.5.1 [#635](https://github.com/fastly/cli/pull/635)
* Update `--ssl-ciphers` description [#636](https://github.com/fastly/cli/pull/636)
* Improve JS error message when a dependency is missing [#637](https://github.com/fastly/cli/pull/637)
* Change default service version selection behaviour [#638](https://github.com/fastly/cli/pull/638)
* Support for additional S3 storage classes [#641](https://github.com/fastly/cli/pull/641)
* Change `compute serve --watch` flag to default to the project root directory [#642](https://github.com/fastly/cli/pull/642)
* Document the newly supported Datadog sites for logging [#576](https://github.com/fastly/cli/pull/576)
* Move the internal build scripts to the fastly.toml manifest [#640](https://github.com/fastly/cli/pull/640)
* Implement `compute hashsum` [#649](https://github.com/fastly/cli/pull/649)
* Add support for TOML `object_store` section [#651](https://github.com/fastly/cli/pull/651)
* Add `--account-name` to GCS logging endpoint [#549](https://github.com/fastly/cli/pull/549)

**Bug fixes:**

* errors/log: be defensive against nil pointer dereference [#650](https://github.com/fastly/cli/pull/650)

**Documentation:**

* Fix typos [#652](https://github.com/fastly/cli/pull/652)

## [v3.3.0](https://github.com/fastly/cli/releases/tag/v3.3.0) (2022-09-05)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.5...v3.3.0)

**Enhancements:**

* TLS Support [#630](https://github.com/fastly/cli/pull/630)
* CI to use community TinyGo action [#624](https://github.com/fastly/cli/pull/624)
* Improve compute init remediation [#627](https://github.com/fastly/cli/pull/627)
* Change default Makefile target [#629](https://github.com/fastly/cli/pull/629)
* Refactor after remote config removal [#626](https://github.com/fastly/cli/pull/626)
* Refactor for revive linter [#632](https://github.com/fastly/cli/pull/632)

## [v3.2.5](https://github.com/fastly/cli/releases/tag/v3.2.5) (2022-08-10)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.4...v3.2.5)

**Enhancements:**

* Remove dynamic configuration [#620](https://github.com/fastly/cli/pull/620)
* Static analysis updates [#621](https://github.com/fastly/cli/pull/621)
* Semgrep updates [#619](https://github.com/fastly/cli/pull/619)

**Bug fixes:**

* Fix `fastly help` tests to work with Go 1.19 [#623](https://github.com/fastly/cli/pull/623)

## [v3.2.4](https://github.com/fastly/cli/releases/tag/v3.2.4) (2022-07-28)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.3...v3.2.4)

**Bug fixes:**

* Fix `--completion-script-zsh` [#617](https://github.com/fastly/cli/pull/617)

## [v3.2.3](https://github.com/fastly/cli/releases/tag/v3.2.3) (2022-07-28)

[Full Changelog](https://github.com/fastly/cli/releases/tag/v3.2.2...v3.2.3)

**Bug fixes:**

* Block for config update if CLI version updated [#615](https://github.com/fastly/cli/pull/615)

## [v3.2.2](https://github.com/fastly/cli/releases/tag/v3.2.2) (2022-07-28)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.1...v3.2.2)

**Bug fixes:**

* Ignore TTL & update config if app version doesn't match config version [#612](https://github.com/fastly/cli/pull/612)

## [v3.2.1](https://github.com/fastly/cli/releases/tag/v3.2.1) (2022-07-27)

[Full Changelog](https://github.com/fastly/cli/compare/v3.2.0...v3.2.1)

**Enhancements:**

* Print subprocess commands in verbose mode [#608](https://github.com/fastly/cli/pull/608)

**Bug fixes:**

* Ensure application configuration is updated after `fastly update` [#610](https://github.com/fastly/cli/pull/610)
* Don't include language manifest in packages [#609](https://github.com/fastly/cli/pull/609)

## [v3.2.0](https://github.com/fastly/cli/releases/tag/v3.2.0) (2022-07-27)

[Full Changelog](https://github.com/fastly/cli/compare/v3.1.1...v3.2.0)

**Enhancements:**

* Compute@Edge TinyGo Support [#594](https://github.com/fastly/cli/pull/594)
* `pkg/commands/profile`: add `--json` flag for `list` command [#602](https://github.com/fastly/cli/pull/602)

**Bug fixes:**

* `pkg/commands/compute/deploy.go` (`getHashSum`): sort key order [#596](https://github.com/fastly/cli/pull/596)
* `pkg/errors/log.go`: prevent runtime panic due to a `nil` reference [#601](https://github.com/fastly/cli/pull/601)

## [v3.1.1](https://github.com/fastly/cli/releases/tag/v3.1.1) (2022-07-04)

[Full Changelog](https://github.com/fastly/cli/compare/v3.1.0...v3.1.1)

**Enhancements:**

* Handle build info more accurately [#588](https://github.com/fastly/cli/pull/588)

**Bug fixes:**

* Fix version check [#589](https://github.com/fastly/cli/pull/589)
* Address profile data loss [#590](https://github.com/fastly/cli/pull/590)

## [v3.1.0](https://github.com/fastly/cli/releases/tag/v3.1.0) (2022-06-24)

[Full Changelog](https://github.com/fastly/cli/compare/v3.0.1...v3.1.0)

**Enhancements:**

* Implement `profile token` command [#578](https://github.com/fastly/cli/pull/578)

**Bug fixes:**

* Fix `compute publish --non-interactive` [#583](https://github.com/fastly/cli/pull/583)
* Support `fastly --help <command>` format [#581](https://github.com/fastly/cli/pull/581)

## [v3.0.1](https://github.com/fastly/cli/releases/tag/v3.0.1) (2022-06-23)

[Full Changelog](https://github.com/fastly/cli/compare/v3.0.0...v3.0.1)

**Enhancements:**

* Makefile: when building binary, depend on .go files [#579](https://github.com/fastly/cli/pull/579)
* Include `fastly.toml` hashsum [#575](https://github.com/fastly/cli/pull/575)
* Hash main.wasm and not the package [#574](https://github.com/fastly/cli/pull/574)

## [v3.0.0](https://github.com/fastly/cli/releases/tag/v3.0.0) (2022-05-30)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.3...v3.0.0)

**Breaking changes:**

* Implement new global flags for handling interactive prompts [#568](https://github.com/fastly/cli/pull/568)

**Bug fixes:**

* The `backend create` command should set `--port` value if specified [#566](https://github.com/fastly/cli/pull/566)
* Don't overwrite `file.Load` error with `nil` [#569](https://github.com/fastly/cli/pull/569)

**Enhancements:**

* Support `[scripts.post_build]` [#565](https://github.com/fastly/cli/pull/565)
* Support Viceroy "inline-toml" `format` and new `contents` field [#567](https://github.com/fastly/cli/pull/567)
* Add example inline-toml dictionary to tests [#570](https://github.com/fastly/cli/pull/570)
* Avoid config update checks when handling 'completion' flags [#554](https://github.com/fastly/cli/pull/554)

## [v2.0.3](https://github.com/fastly/cli/releases/tag/v2.0.3) (2022-05-20)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.2...v2.0.3)

**Bug fixes:**

* Update Sentry DSN [#563](https://github.com/fastly/cli/pull/563)

## [v2.0.2](https://github.com/fastly/cli/releases/tag/v2.0.2) (2022-05-18)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.1...v2.0.2)

**Enhancements:**

* Remove user identifiable data [#561](https://github.com/fastly/cli/pull/561)

## [v2.0.1](https://github.com/fastly/cli/releases/tag/v2.0.1) (2022-05-17)

[Full Changelog](https://github.com/fastly/cli/compare/v2.0.0...v2.0.1)

**Security:**

* Omit data from Sentry [#559](https://github.com/fastly/cli/pull/559)

## [v2.0.0](https://github.com/fastly/cli/releases/tag/v2.0.0) (2022-04-05)

[Full Changelog](https://github.com/fastly/cli/compare/v1.7.1...v2.0.0)

**Bug fixes:**

* Update `--request-max-entries`/`--request-max-bytes` description defaults [#541](https://github.com/fastly/cli/pull/541)

**Enhancements:**

* Add `--debug` flag to `compute serve` [#545](https://github.com/fastly/cli/pull/545)
* Support multiple profiles via `[profiles]` configuration [#546](https://github.com/fastly/cli/pull/546)
* Reorder C@E languages and make JS 'Limited Availability' [#548](https://github.com/fastly/cli/pull/548)

## [v1.7.1](https://github.com/fastly/cli/releases/tag/v1.7.1) (2022-03-14)

[Full Changelog](https://github.com/fastly/cli/compare/v1.7.0...v1.7.1)

**Bug fixes:**

* Fix runtime panic in arg parser [#542](https://github.com/fastly/cli/pull/542)

## [v1.7.0](https://github.com/fastly/cli/releases/tag/v1.7.0) (2022-02-22)

[Full Changelog](https://github.com/fastly/cli/compare/v1.6.0...v1.7.0)

**Enhancements:**

* Add `fastly` user to Dockerfiles [#521](https://github.com/fastly/cli/pull/521)
* Support Sentry 'suspect commit' feature [#508](https://github.com/fastly/cli/pull/508)
* Populate language manifest `name` field with project name [#527](https://github.com/fastly/cli/pull/527)
* Make `--name` flag for `service search` command a required flag [#529](https://github.com/fastly/cli/pull/529)
* Update config `last_checked` field even on config load error [#528](https://github.com/fastly/cli/pull/528)
* Implement Compute@Edge Free Trial Activation [#531](https://github.com/fastly/cli/pull/531)
* Bump Rust toolchain constraint to `1.56.1` for 2021 edition [#533](https://github.com/fastly/cli/pull/533533533533533)
* Support Arch User Repositories [#530](https://github.com/fastly/cli/pull/530)

## [v1.6.0](https://github.com/fastly/cli/releases/tag/v1.6.0) (2022-01-20)

[Full Changelog](https://github.com/fastly/cli/compare/v1.5.0...v1.6.0)

**Enhancements:**

* Display the requested command in Sentry breadcrumb [#519](https://github.com/fastly/cli/pull/519)

## [v1.5.0](https://github.com/fastly/cli/releases/tag/v1.5.0) (2022-01-20)

[Full Changelog](https://github.com/fastly/cli/compare/v1.4.0...v1.5.0)

**Enhancements:**

* Implement `--json` output for describe/list operations [#505](https://github.com/fastly/cli/pull/505)
* Omit unix file permissions from error message [#507](https://github.com/fastly/cli/pull/507)
* Implement new go-fastly pagination types [#511](https://github.com/fastly/cli/pull/511)

## [v1.4.0](https://github.com/fastly/cli/releases/tag/v1.4.0) (2022-01-07)

[Full Changelog](https://github.com/fastly/cli/compare/v1.3.0...v1.4.0)

**Enhancements:**

* Add `viceroy.ttl` to CLI app config [#489](https://github.com/fastly/cli/pull/489)
* Display `viceroy --version` if installed [#487](https://github.com/fastly/cli/pull/487)
* Support `compute build` for 'other' language option using `[scripts.build]` [#484](https://github.com/fastly/cli/pull/484)
* Pass parent environment to subprocess [#491](https://github.com/fastly/cli/pull/491)
* Implement a yes/no user prompt abstraction [#500](https://github.com/fastly/cli/pull/500)
* Ensure build compilation errors are displayed [#492](https://github.com/fastly/cli/pull/492)
* Implement `--service-name` as swap-in replacement for `--service-id` [#495](https://github.com/fastly/cli/pull/495)
* Support `FASTLY_CUSTOMER_ID` environment variable [#494](https://github.com/fastly/cli/pull/494)
* Support `gotest` [#501](https://github.com/fastly/cli/pull/501)

**Bug fixes:**

* Fix the `--watch` flag for AssemblyScript [#493](https://github.com/fastly/cli/pull/493)
* Fix `compute init --from` for Windows [#490](https://github.com/fastly/cli/pull/490)
* Avoid triggering GitHub API rate limit when running Viceroy in CI [#488](https://github.com/fastly/cli/pull/488)
* Fix Windows ANSI escape code rendering [#503](https://github.com/fastly/cli/pull/503)
* Prevent runtime panic when global flag set with no command [#502](https://github.com/fastly/cli/pull/502)

## [v1.3.0](https://github.com/fastly/cli/releases/tag/v1.3.0) (2021-12-01)

[Full Changelog](https://github.com/fastly/cli/compare/v1.2.0...v1.3.0)

**Enhancements:**

* Implement custom `[scripts.build]` operation [#480](https://github.com/fastly/cli/pull/480)
* Move `manifest` package into top-level `pkg` directory [#478](https://github.com/fastly/cli/pull/478)
* Refactor AssemblyScript logic to call out to the JavaScript implementation [#479](https://github.com/fastly/cli/pull/479)

## [v1.2.0](https://github.com/fastly/cli/releases/tag/v1.2.0) (2021-11-25)

[Full Changelog](https://github.com/fastly/cli/compare/v1.1.1...v1.2.0)

**Enhancements:**

* Implement `SEE ALSO` section in help output [#472](https://github.com/fastly/cli/pull/472)
* Add command 'API' metadata [#473](https://github.com/fastly/cli/pull/473)

## [v1.1.1](https://github.com/fastly/cli/releases/tag/v1.1.1) (2021-11-11)

[Full Changelog](https://github.com/fastly/cli/compare/v1.1.0...v1.1.1)

**Bug fixes:**

* Avoid displaying a wildcard domain [#468](https://github.com/fastly/cli/pull/468)
* Set sensible defaults for host related flags on `backend create` [#469](https://github.com/fastly/cli/pull/469)
* Fix error extracting package files from `.tgz` archive [#470](https://github.com/fastly/cli/pull/470)

## [v1.1.0](https://github.com/fastly/cli/releases/tag/v1.1.0) (2021-11-08)

[Full Changelog](https://github.com/fastly/cli/compare/v1.0.1...v1.1.0)

**Enhancements:**

* Implement `--watch` flag for `compute serve` [#464](https://github.com/fastly/cli/pull/464)

## [v1.0.1](https://github.com/fastly/cli/releases/tag/v1.0.1) (2021-11-08)

[Full Changelog](https://github.com/fastly/cli/compare/v1.0.0...v1.0.1)

**Bug fixes:**

* Allow git repo to be used as a value at the starter kit prompt [#465](https://github.com/fastly/cli/pull/465)

## [v1.0.0](https://github.com/fastly/cli/releases/tag/v1.0.0) (2021-11-02)

[Full Changelog](https://github.com/fastly/cli/compare/v0.43.0...v1.0.0)

**Changed:**

* Use `EnumsVar` for `auth-token --scope` [#447](https://github.com/fastly/cli/pull/447)
* Rename `logs tail` to `log-tail` [#456](https://github.com/fastly/cli/pull/456)
* Rename `dictionaryitem` to `dictionary-item` [#459](https://github.com/fastly/cli/pull/459)
* Rename `fastly compute ... --path` flags [#460](https://github.com/fastly/cli/pull/460)
* Rename `--force` to `--skip-verification` [#461](https://github.com/fastly/cli/pull/461)

## [v0.43.0](https://github.com/fastly/cli/releases/tag/v0.43.0) (2021-11-01)

[Full Changelog](https://github.com/fastly/cli/compare/v0.42.0...v0.43.0)

**Bug fixes:**

* Ignore possible `rustup` 'sync' output when calling `rustc --version` [#453](https://github.com/fastly/cli/pull/453)
* Bump goreleaser to avoid Homebrew warning [#455](https://github.com/fastly/cli/pull/455)
* Prevent `.Hidden()` flags/commands from being documented via `--format json` [#454](https://github.com/fastly/cli/pull/454)

## [v0.42.0](https://github.com/fastly/cli/releases/tag/v0.42.0) (2021-10-22)

[Full Changelog](https://github.com/fastly/cli/compare/v0.41.0...v0.42.0)

**Enhancements:**

* Fallback to existing viceroy binary in case of network error [#445](https://github.com/fastly/cli/pull/445)
* Remove `text.ServiceType` abstraction [#449](https://github.com/fastly/cli/pull/449)

**Bug fixes:**

* Avoid fetching packages when manifest exists [#448](https://github.com/fastly/cli/pull/448)
* Implement `--path` lookup fallback for manifest [#446](https://github.com/fastly/cli/pull/446)
* Fix broken Windows support [#450](https://github.com/fastly/cli/pull/450)

## [v0.41.0](https://github.com/fastly/cli/releases/tag/v0.41.0) (2021-10-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.40.2...v0.41.0)

**Enhancements:**

* Implement `[setup.log_endpoints.<name>]` support [#443](https://github.com/fastly/cli/pull/443)
* The `compute init --from` flag should support archives [#428](https://github.com/fastly/cli/pull/428)
* Add region support for logentries logging endpoint [#375](https://github.com/fastly/cli/pull/375)

## [v0.40.2](https://github.com/fastly/cli/releases/tag/v0.40.2) (2021-10-14)

[Full Changelog](https://github.com/fastly/cli/compare/v0.40.1...v0.40.2)

**Bug fixes:**

* Fix shell autocomplete evaluation [#441](https://github.com/fastly/cli/pull/441)

## [v0.40.1](https://github.com/fastly/cli/releases/tag/v0.40.1) (2021-10-14)

[Full Changelog](https://github.com/fastly/cli/compare/v0.40.0...v0.40.1)

**Bug fixes:**

* Fix shell completion (and Homebrew upgrade) [#439](https://github.com/fastly/cli/pull/439)

## [v0.40.0](https://github.com/fastly/cli/releases/tag/v0.40.0) (2021-10-13)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.3...v0.40.0)

**Bug fixes:**

* Auto-migrate `manifest_version` from 1 to 2 when applicable [#434](https://github.com/fastly/cli/pull/434)
* Better error handling for manifest parsing [#436](https://github.com/fastly/cli/pull/436)

**Enhancements:**

* Implement `[setup.dictionaries]` support [#431](https://github.com/fastly/cli/pull/431)
* Tests for `[setup.dictionaries]` support [#438](https://github.com/fastly/cli/pull/438)
* Refactor `app.Run()` [#429](https://github.com/fastly/cli/pull/429)
* Ensure manifest is read only once for all missed references [#433](https://github.com/fastly/cli/pull/433)

## [v0.39.3](https://github.com/fastly/cli/releases/tag/v0.39.3) (2021-10-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.2...v0.39.3)

**Bug fixes:**

* Add missing description for `user list --customer-id` [#425](https://github.com/fastly/cli/pull/425)
* Trim the rust version to fix parse errors [#427](https://github.com/fastly/cli/pull/427)

**Enhancements:**

* Abstraction layer for `[setup.backends]` [#421](https://github.com/fastly/cli/pull/421)

## [v0.39.2](https://github.com/fastly/cli/releases/tag/v0.39.2) (2021-09-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.1...v0.39.2)

**Bug fixes:**

* Provide better remediation for unrecognised `manifest_version` [#422](https://github.com/fastly/cli/pull/422)
* Bump `go-fastly` to `v5.0.0` to fix ACL entries bug [#417](https://github.com/fastly/cli/pull/417)
* Remove Rust debug flags [#416](https://github.com/fastly/cli/pull/416)

**Enhancements:**

* Clarify Starter Kit options in `compute init` flow [#418](https://github.com/fastly/cli/pull/418)
* Avoid excessive manifest reads [#420](https://github.com/fastly/cli/pull/420)

## [v0.39.1](https://github.com/fastly/cli/releases/tag/v0.39.1) (2021-09-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.39.0...v0.39.1)

**Bug fixes:**

* Bug fixes for `auth-token` [#413](https://github.com/fastly/cli/pull/413)

## [v0.39.0](https://github.com/fastly/cli/releases/tag/v0.39.0) (2021-09-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.38.0...v0.39.0)

**Enhancements:**

* Implement `user` commands [#406](https://github.com/fastly/cli/pull/406)
* Implement `auth-token` commands [#409](https://github.com/fastly/cli/pull/409)
* Add region support for New Relic logging endpoint [#378](https://github.com/fastly/cli/pull/378)

**Bug fixes:**

* Add the `--name` flag to `compute deploy` [#410](https://github.com/fastly/cli/pull/410)

## [v0.38.0](https://github.com/fastly/cli/releases/tag/v0.38.0) (2021-09-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.37.1...v0.38.0)

**Enhancements:**

* Add support for `override_host` to Local Server configuration [#394](https://github.com/fastly/cli/pull/394)
* Add support for Dictionaries to Local Server configuration [#395](https://github.com/fastly/cli/pull/395)
* Integrate domain validation [#402](https://github.com/fastly/cli/pull/402)
* Refactor Versioner `GitHub.Download()` logic [#403](https://github.com/fastly/cli/pull/403)

**Bug fixes:**

* Pass down `compute publish --name` to `compute deploy` [#398](https://github.com/fastly/cli/pull/398)
* Sanitise name when packing the wasm file [#401](https://github.com/fastly/cli/pull/401)
* Use a non-interactive progress writer in non-TTY environments [#405](https://github.com/fastly/cli/pull/405)

**Removed:**

* Remove support for Scoop, the Window's command-line installer [#396](https://github.com/fastly/cli/pull/396)
* Remove unused 'rename local binary' code [#399](https://github.com/fastly/cli/pull/399)

## [v0.37.1](https://github.com/fastly/cli/releases/tag/v0.37.1) (2021-09-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.37.0...v0.37.1)

**Enhancements:**

- Bump `go-github` dependency to latest release [#388](https://github.com/fastly/cli/pull/388)
- Add Service ID to `--verbose` output [#383](https://github.com/fastly/cli/pull/383)

**Bug fixes:**

- Download Viceroy to a _randomly_ generated directory [#386](https://github.com/fastly/cli/pull/386)
- Bug fix for ensuring assets are downloaded into a randomly generated directory [#389](https://github.com/fastly/cli/pull/389)

## [v0.37.0](https://github.com/fastly/cli/releases/tag/v0.37.0) (2021-09-03)

[Full Changelog](https://github.com/fastly/cli/compare/v0.36.0...v0.37.0)

**Enhancements:**

<!-- - GitHub Packages support via goreleaser [#262](https://github.com/fastly/cli/pull/262) -->
- Update CLI config using flag on `update` command [#382](https://github.com/fastly/cli/pull/382)
- Validate package size doesn't exceed limit [#380](https://github.com/fastly/cli/pull/380)
- Log tailing should respect the configured `--endpoint` [#374](https://github.com/fastly/cli/pull/374)
- Support Windows arm64 [#372](https://github.com/fastly/cli/pull/372)
- Refactor compute deploy logic to better support `[setup]` configuration [#370](https://github.com/fastly/cli/pull/370)
- Omit messaging when using `--accept-defaults` [#366](https://github.com/fastly/cli/pull/366)
- Implement `[setup]` configuration for backends [#355](https://github.com/fastly/cli/pull/355)
- Refactor code to help CI performance [#360](https://github.com/fastly/cli/pull/360)

**Bug fixes:**

- Add executable permissions to Viceroy binary after renaming/moving it [#368](https://github.com/fastly/cli/pull/368)
- Update rust toolchain validation steps [#371](https://github.com/fastly/cli/pull/371)

**Security:**

- Update dependency to avoid dependabot warning in GitHub UI [#381](https://github.com/fastly/cli/pull/381)

## [v0.36.0](https://github.com/fastly/cli/releases/tag/v0.36.0) (2021-07-30)

[Full Changelog](https://github.com/fastly/cli/compare/v0.35.0...v0.36.0)

**Enhancements:**

- Implement `logging newrelic` command [#354](https://github.com/fastly/cli/pull/354)

## [v0.35.0](https://github.com/fastly/cli/releases/tag/v0.35.0) (2021-07-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.34.0...v0.35.0)

**Enhancements:**

- Support for Compute@Edge JS SDK (Beta) [#347](https://github.com/fastly/cli/pull/347)
- Implement `--override-host` and `--ssl-sni-hostname` [#352](https://github.com/fastly/cli/pull/352)
- Implement `acl` command [#350](https://github.com/fastly/cli/pull/350)
- Implement `acl-entry` command [#351](https://github.com/fastly/cli/pull/351)
- Separate command files from other logic files [#349](https://github.com/fastly/cli/pull/349)
- Log a record of errors to disk [#340](https://github.com/fastly/cli/pull/340)

**Bug fixes:**

- Fix nondeterministic flag parsing [#353](https://github.com/fastly/cli/pull/353)
- Fix `compute serve --addr` description to reference port requirement [#348](https://github.com/fastly/cli/pull/348)

## [v0.34.0](https://github.com/fastly/cli/releases/tag/v0.34.0) (2021-07-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.33.0...v0.34.0)

**Enhancements:**

- Implement `compute serve` subcommand [\#252](https://github.com/fastly/cli/pull/252)
- Simplify logic for prefixing fastly spec to file [\#345](https://github.com/fastly/cli/pull/345)
- `fastly compute publish` and `deploy` should accept a comment [\#328](https://github.com/fastly/cli/pull/328)
- Improve GitHub Actions intermittent test timeouts [\#336](https://github.com/fastly/cli/pull/336)
- New flags for displaying the CLI config, and its location [\#338](https://github.com/fastly/cli/pull/338)
- Don't allow stats short help to wrap [\#331](https://github.com/fastly/cli/pull/331)

**Bug fixes:**

- Ensure incompatibility message only shown when config is invalid [\#335](https://github.com/fastly/cli/pull/335)
- Check-in static config for traditional golang workflows [\#337](https://github.com/fastly/cli/pull/337)

## [v0.33.0](https://github.com/fastly/cli/releases/tag/v0.33.0) (2021-07-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.32.0...v0.33.0)

**Enhancements:**

- Improve CI workflow [\#333](https://github.com/fastly/cli/pull/333)
- Support multiple versions of Rust [\#330](https://github.com/fastly/cli/pull/330)
- Replace `app.Run` positional signature with a struct [\#329](https://github.com/fastly/cli/pull/329)
- Test suite improvements [\#327](https://github.com/fastly/cli/pull/327)

## [v0.32.0](https://github.com/fastly/cli/releases/tag/v0.32.0) (2021-06-30)

[Full Changelog](https://github.com/fastly/cli/compare/v0.31.0...v0.32.0)

**Enhancements:**

- Embed app config into compiled CLI binary [\#312](https://github.com/fastly/cli/pull/312)
- Service ID lookup includes `$FASTLY_SERVICE_ID` environment variable [\#320](https://github.com/fastly/cli/pull/320)
- Implement `vcl custom` commands [\#310](https://github.com/fastly/cli/pull/310)
- Implement `vcl snippet` commands [\#316](https://github.com/fastly/cli/pull/316)
- Implement `purge` command [\#323](https://github.com/fastly/cli/pull/323)

**Bug fixes:**

- Correctly set the port if `--use-ssl` is used [\#317](https://github.com/fastly/cli/pull/317)
- Fixed a regression in `compute publish` [\#321](https://github.com/fastly/cli/pull/321)

## [v0.31.0](https://github.com/fastly/cli/releases/tag/v0.31.0) (2021-06-17)

[Full Changelog](https://github.com/fastly/cli/compare/v0.30.0...v0.31.0)

**Enhancements:**

- Add new `pops` command [\#309](https://github.com/fastly/cli/pull/309)
- Add new `ip-list` command [\#308](https://github.com/fastly/cli/pull/308)
- Implement new `--version` and `--autoclone` flags [\#302](https://github.com/fastly/cli/pull/302)
- Reword `backend create --use-ssl` warning output [\#303](https://github.com/fastly/cli/pull/303)
- Define new `--version` and `--autoclone` flags [\#300](https://github.com/fastly/cli/pull/300)
- Implement remediation for dynamic config context deadline error [\#298](https://github.com/fastly/cli/pull/298)
- Capitalise 'n' for `[y/N]` prompt [\#299](https://github.com/fastly/cli/pull/299)
- Move exec behaviour from `common` package to its own package [\#297](https://github.com/fastly/cli/pull/297)
- Move command behaviour from `common` package to its own package [\#296](https://github.com/fastly/cli/pull/296)
- Move time behaviour from `common` package to its own package [\#295](https://github.com/fastly/cli/pull/295)
- Move sync behaviour from `common` package to its own package [\#294](https://github.com/fastly/cli/pull/294)
- Move undo behaviour from `common` package to its own package [\#293](https://github.com/fastly/cli/pull/293)
- Surface any cargo metadata errors [\#286](https://github.com/fastly/cli/pull/286)

**Bug fixes:**

- Don't persist `--service-id` flag value to manifest [\#307](https://github.com/fastly/cli/pull/307)
- Fix broken `--service-id` flag in `compute publish` [\#292](https://github.com/fastly/cli/pull/292)
- Fix parsing backend port number [\#291](https://github.com/fastly/cli/pull/291)

**Documentation:**

- Update broken link in `stats historical` [\#285](https://github.com/fastly/cli/pull/285)

## [v0.30.0](https://github.com/fastly/cli/releases/tag/v0.30.0) (2021-05-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.29.0...v0.30.0)

**Enhancements:**

- Update messaging for `rustup self update` [\#281](https://github.com/fastly/cli/pull/281)
- Replace archived go-git dependency [\#283](https://github.com/fastly/cli/pull/283)
- Implement `pack` subcommand [\#282](https://github.com/fastly/cli/pull/282)

## [v0.29.0](https://github.com/fastly/cli/releases/tag/v0.29.0) (2021-05-13)

[Full Changelog](https://github.com/fastly/cli/compare/v0.28.0...v0.29.0)

**Enhancements:**

- Add arm64 to macOS build [\#277](https://github.com/fastly/cli/pull/277)

**Bug fixes:**

- Validate package before prompting inside `compute deploy` flow [\#279](https://github.com/fastly/cli/pull/279)
- Clear Service ID from manifest when service is deleted [\#278](https://github.com/fastly/cli/pull/278)

## [v0.28.0](https://github.com/fastly/cli/releases/tag/v0.28.0) (2021-05-11)

[Full Changelog](https://github.com/fastly/cli/compare/v0.27.2...v0.28.0)

**Enhancements:**

- Add `isBool` to command flags [\#267](https://github.com/fastly/cli/pull/267)
- Move service creation to `fastly compute deploy`. [\#266](https://github.com/fastly/cli/pull/266)

**Bug fixes:**

- Fix runtime panic when dealing with empty manifest. [\#274](https://github.com/fastly/cli/pull/274)
- Fix `--force` flag not being respected. [\#272](https://github.com/fastly/cli/pull/272)
- Clean-out `service_id` from manifest when deleting a service. [\#268](https://github.com/fastly/cli/pull/268)

## [v0.27.2](https://github.com/fastly/cli/releases/tag/v0.27.2) (2021-04-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.27.1...v0.27.2)

**Bug fixes:**

- Fix bug where legacy creds are reset after call to configure subcommand. [\#260](https://github.com/fastly/cli/pull/260)

## [v0.27.1](https://github.com/fastly/cli/releases/tag/v0.27.1) (2021-04-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.27.0...v0.27.1)

**Bug fixes:**

- Track CLI version. [\#257](https://github.com/fastly/cli/pull/257)

## [v0.27.0](https://github.com/fastly/cli/releases/tag/v0.27.0) (2021-04-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.3...v0.27.0)

**Enhancements:**

- Support IAM role in Kinesis logging endpoint [\#255](https://github.com/fastly/cli/pull/255)
- Support IAM role in S3 and Kinesis logging endpoints [\#253](https://github.com/fastly/cli/pull/253)
- Add support for `file_max_bytes` configuration for Azure logging endpoint [\#251](https://github.com/fastly/cli/pull/251)
- Warn on empty directory [\#247](https://github.com/fastly/cli/pull/247)
- Add `compute publish` subcommand [\#242](https://github.com/fastly/cli/pull/242)
- Allow local binary to be renamed [\#240](https://github.com/fastly/cli/pull/240)
- Retain `RUSTFLAGS` values from the environment [\#239](https://github.com/fastly/cli/pull/239)
- Make GitHub Versioner configurable [\#236](https://github.com/fastly/cli/pull/236)
- Add support for `compression_codec` to logging file sink endpoints [\#190](https://github.com/fastly/cli/pull/190)

**Bug fixes:**

- Remove flaky test logic. [\#249](https://github.com/fastly/cli/pull/249)
- Check the rustup version [\#248](https://github.com/fastly/cli/pull/248)
- Print all commands and subcommands in usage [\#244](https://github.com/fastly/cli/pull/244)
- pkg/logs: fix typo in error message [\#238](https://github.com/fastly/cli/pull/238)

## [v0.26.3](https://github.com/fastly/cli/releases/tag/v0.26.3) (2021-03-26)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.2...v0.26.3)

**Enhancements:**

- Default to port 443 if UseSSL set. [\#234](https://github.com/fastly/cli/pull/234)

**Bug fixes:**

- Ensure all UPDATE operations don't set optional fields. [\#235](https://github.com/fastly/cli/pull/235)
- Avoid setting fields that cause API to fail when given zero value. [\#233](https://github.com/fastly/cli/pull/233)

## [v0.26.2](https://github.com/fastly/cli/releases/tag/v0.26.2) (2021-03-22)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.1...v0.26.2)

**Enhancements:**

- Extra error handling around loading remote configuration data. [\#229](https://github.com/fastly/cli/pull/229)

**Bug fixes:**

- `fastly compute build` exits with error 1 [\#227](https://github.com/fastly/cli/issues/227)
- Set GOVERSION for goreleaser. [\#228](https://github.com/fastly/cli/pull/228)

## [v0.26.1](https://github.com/fastly/cli/releases/tag/v0.26.1) (2021-03-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.26.0...v0.26.1)

**Bug fixes:**

- Fix manifest\_version as a section bug. [\#225](https://github.com/fastly/cli/pull/225)

## [v0.26.0](https://github.com/fastly/cli/releases/tag/v0.26.0) (2021-03-18)

[Full Changelog](https://github.com/fastly/cli/compare/v0.25.2...v0.26.0)

**Enhancements:**

- Remove version from fastly.toml manifest. [\#222](https://github.com/fastly/cli/pull/222)
- Don't run "cargo update" before building rust app. [\#221](https://github.com/fastly/cli/pull/221)

**Bug fixes:**

- Loading remote config.toml should fail gracefully. [\#223](https://github.com/fastly/cli/pull/223)
- Update the fastly.toml manifest if missing manifest\_version. [\#220](https://github.com/fastly/cli/pull/220)
- Refactor UserAgent. [\#219](https://github.com/fastly/cli/pull/219)

## [v0.25.2](https://github.com/fastly/cli/releases/tag/v0.25.2) (2021-03-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.25.1...v0.25.2)

**Bug fixes:**

- Fix duplicate warning messages and missing SetOutput\(\). [\#216](https://github.com/fastly/cli/pull/216)

## [v0.25.1](https://github.com/fastly/cli/releases/tag/v0.25.1) (2021-03-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.25.0...v0.25.1)

**Bug fixes:**

- The manifest\_version should default to 1 if missing. [\#214](https://github.com/fastly/cli/pull/214)

## [v0.25.0](https://github.com/fastly/cli/releases/tag/v0.25.0) (2021-03-16)

[Full Changelog](https://github.com/fastly/cli/compare/v0.24.2...v0.25.0)

**Enhancements:**

- Replace deprecated ioutil functions with go 1.16. [\#212](https://github.com/fastly/cli/pull/212)
- Replace TOML parser [\#211](https://github.com/fastly/cli/pull/211)
- Implement manifest\_version into the fastly.toml [\#210](https://github.com/fastly/cli/pull/210)
- Dynamic Configuration [\#187](https://github.com/fastly/cli/pull/187)

**Bug fixes:**

- Log output should be simplified when running in CI [\#175](https://github.com/fastly/cli/issues/175)
- Override error message in compute init [\#204](https://github.com/fastly/cli/pull/204)

## [v0.24.2](https://github.com/fastly/cli/releases/tag/v0.24.2) (2021-02-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.24.1...v0.24.2)

**Bug fixes:**

- Fix CI binary overlap [\#209](https://github.com/fastly/cli/pull/209)
- Fix CI workflow by switching from old syntax to new [\#208](https://github.com/fastly/cli/pull/208)
- Fix goreleaser version lookup [\#207](https://github.com/fastly/cli/pull/207)
- LogTail: Properly close response body [\#205](https://github.com/fastly/cli/pull/205)
- Add port prompt for compute init [\#203](https://github.com/fastly/cli/pull/203)
- Update GitHub Action to not use commit hash [\#200](https://github.com/fastly/cli/pull/200)

## [v0.24.1](https://github.com/fastly/cli/releases/tag/v0.24.1) (2021-02-03)

[Full Changelog](https://github.com/fastly/cli/compare/v0.24.0...v0.24.1)

**Bug fixes:**

- Logs Tail: Give the user better feedback when --from flag errors [\#201](https://github.com/fastly/cli/pull/201)

## [v0.24.0](https://github.com/fastly/cli/releases/tag/v0.24.0) (2021-02-02)

[Full Changelog](https://github.com/fastly/cli/compare/v0.23.0...v0.24.0)

**Enhancements:**

- Add static content starter kit [\#197](https://github.com/fastly/cli/pull/197)
- 🦀 Update rust toolchain [\#196](https://github.com/fastly/cli/pull/196)

**Bug fixes:**

- Fix go vet error related to missing docstring [\#198](https://github.com/fastly/cli/pull/198)

## [v0.23.0](https://github.com/fastly/cli/releases/tag/v0.23.0) (2021-01-22)

[Full Changelog](https://github.com/fastly/cli/compare/v0.22.0...v0.23.0)

**Enhancements:**

- Update Go-Fastly dependency to v3.0.0 [\#193](https://github.com/fastly/cli/pull/193)
- Support for Compute@Edge Log Tailing [\#192](https://github.com/fastly/cli/pull/192)

**Bug fixes:**

- Resolve issues with Rust integration tests. [\#194](https://github.com/fastly/cli/pull/194)
- Update URL for default Rust starter [\#191](https://github.com/fastly/cli/pull/191)

## [v0.22.0](https://github.com/fastly/cli/releases/tag/v0.22.0) (2021-01-07)

[Full Changelog](https://github.com/fastly/cli/compare/v0.21.2...v0.22.0)

**Enhancements:**

- Add support for TLS client and batch size options for splunk [\#183](https://github.com/fastly/cli/pull/183)
- Add support for Kinesis logging endpoint [\#177](https://github.com/fastly/cli/pull/177)

## [v0.21.2](https://github.com/fastly/cli/releases/tag/v0.21.2) (2021-01-06)

[Full Changelog](https://github.com/fastly/cli/compare/v0.21.1...v0.21.2)

**Bug fixes:**

- Switch from third-party dependency to our own mirror [\#184](https://github.com/fastly/cli/pull/184)

## [v0.21.1](https://github.com/fastly/cli/releases/tag/v0.21.1) (2020-12-18)

[Full Changelog](https://github.com/fastly/cli/compare/v0.21.0...v0.21.1)

**Bug fixes:**

- CLI shouldn't recommend Rust crate prerelease versions [\#168](https://github.com/fastly/cli/issues/168)
- Run cargo update before attempting to build Rust compute packages [\#179](https://github.com/fastly/cli/pull/179)

## [v0.21.0](https://github.com/fastly/cli/releases/tag/v0.21.0) (2020-12-14)

[Full Changelog](https://github.com/fastly/cli/compare/v0.20.0...v0.21.0)

**Enhancements:**

- Adds support for managing edge dictionaries [\#159](https://github.com/fastly/cli/pull/159)

## [v0.20.0](https://github.com/fastly/cli/releases/tag/v0.20.0) (2020-11-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.19.0...v0.20.0)

**Enhancements:**

- Migrate to Go-Fastly 2.0.0 [\#169](https://github.com/fastly/cli/pull/169)

**Bug fixes:**

- Build failure with Cargo workspaces [\#171](https://github.com/fastly/cli/issues/171)
- Support cargo workspaces [\#172](https://github.com/fastly/cli/pull/172)

## [v0.19.0](https://github.com/fastly/cli/releases/tag/v0.19.0) (2020-11-19)

[Full Changelog](https://github.com/fastly/cli/compare/v0.18.1...v0.19.0)

**Enhancements:**

- Support sasl kafka endpoint options in Fastly CLI [\#161](https://github.com/fastly/cli/pull/161)

## [v0.18.1](https://github.com/fastly/cli/releases/tag/v0.18.1) (2020-11-03)

[Full Changelog](https://github.com/fastly/cli/compare/v0.18.0...v0.18.1)

**Enhancements:**

- Update the default Rust template to fastly-0.5.0 [\#163](https://github.com/fastly/cli/pull/163)

**Bug fixes:**

- Constrain Version Upgrade Suggestion [\#165](https://github.com/fastly/cli/pull/165)
- Fix AssemblyScript compilation messaging [\#164](https://github.com/fastly/cli/pull/164)

## [v0.18.0](https://github.com/fastly/cli/releases/tag/v0.18.0) (2020-10-27)

[Full Changelog](https://github.com/fastly/cli/compare/v0.17.0...v0.18.0)

**Enhancements:**

- Add AssemblyScript support to compute init and build commands [\#160](https://github.com/fastly/cli/pull/160)

## [v0.17.0](https://github.com/fastly/cli/releases/tag/v0.17.0) (2020-09-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.16.1...v0.17.0)

**Enhancements:**

- Bump supported Rust toolchain version to 1.46 [\#156](https://github.com/fastly/cli/pull/156)
- Add service search command [\#152](https://github.com/fastly/cli/pull/152)

**Bug fixes:**

- Broken link in usage info [\#148](https://github.com/fastly/cli/issues/148)

## [v0.16.1](https://github.com/fastly/cli/releases/tag/v0.16.1) (2020-07-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.16.0...v0.16.1)

**Bug fixes:**

- Display the correct version number on error [\#144](https://github.com/fastly/cli/pull/144)
- Fix bug where name was not added to the manifest [\#143](https://github.com/fastly/cli/pull/143)

## [v0.16.0](https://github.com/fastly/cli/releases/tag/v0.16.0) (2020-07-09)

[Full Changelog](https://github.com/fastly/cli/compare/v0.15.0...v0.16.0)

**Enhancements:**

- Compare package hashsum during deployment [\#139](https://github.com/fastly/cli/pull/139)
- Allow compute init to be reinvoked within an existing package directory [\#138](https://github.com/fastly/cli/pull/138)

## [v0.15.0](https://github.com/fastly/cli/releases/tag/v0.15.0) (2020-06-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.14.0...v0.15.0)

**Enhancements:**

- Adds OpenStack logging support [\#132](https://github.com/fastly/cli/pull/132)

## [v0.14.0](https://github.com/fastly/cli/releases/tag/v0.14.0) (2020-06-25)

[Full Changelog](https://github.com/fastly/cli/compare/v0.13.0...v0.14.0)

**Enhancements:**

- Bump default Rust template version to v0.4.0 [\#133](https://github.com/fastly/cli/pull/133)

## [v0.13.0](https://github.com/fastly/cli/releases/tag/v0.13.0) (2020-06-15)

[Full Changelog](https://github.com/fastly/cli/compare/v0.12.0...v0.13.0)

**Enhancements:**

- Allow compute services to be initialised from an existing service ID [\#125](https://github.com/fastly/cli/pull/125)

**Bug fixes:**

- Fix bash completion [\#128](https://github.com/fastly/cli/pull/128)

**Closed issues:**

- Bash Autocomplete is broken [\#127](https://github.com/fastly/cli/issues/127)

## [v0.12.0](https://github.com/fastly/cli/releases/tag/v0.12.0) (2020-06-05)

[Full Changelog](https://github.com/fastly/cli/compare/v0.11.0...v0.12.0)

**Enhancements:**

- Adds MessageType field to SFTP [\#118](https://github.com/fastly/cli/pull/118)
- Adds User field to Cloudfiles Updates [\#117](https://github.com/fastly/cli/pull/117)
- Adds Region field to Scalyr [\#116](https://github.com/fastly/cli/pull/116)
- Adds PublicKey field to S3 [\#114](https://github.com/fastly/cli/pull/114)
- Adds MessageType field to GCS Updates [\#113](https://github.com/fastly/cli/pull/113)
- Adds ResponseCondition and Placement fields to BigQuery Creates [\#111](https://github.com/fastly/cli/pull/111)

**Bug fixes:**

- Unable to login with API key [\#94](https://github.com/fastly/cli/issues/94)

## [v0.11.0](https://github.com/fastly/cli/releases/tag/v0.11.0) (2020-05-29)

[Full Changelog](https://github.com/fastly/cli/compare/v0.10.0...v0.11.0)

**Enhancements:**

- Add ability to exclude files from build package [\#87](https://github.com/fastly/cli/pull/87)

**Bug fixes:**

- unintended files included in upload package [\#24](https://github.com/fastly/cli/issues/24)

## [v0.10.0](https://github.com/fastly/cli/releases/tag/v0.10.0) (2020-05-28)

[Full Changelog](https://github.com/fastly/cli/compare/v0.9.0...v0.10.0)

**Enhancements:**

- Adds Google Cloud Pub/Sub logging endpoint support [\#96](https://github.com/fastly/cli/pull/96)
- Adds Datadog logging endpoint support [\#92](https://github.com/fastly/cli/pull/92)
- Adds HTTPS logging endpoint support [\#91](https://github.com/fastly/cli/pull/91)
- Adds Elasticsearch logging endpoint support [\#90](https://github.com/fastly/cli/pull/90)
- Adds Azure Blob Storage logging endpoint support [\#89](https://github.com/fastly/cli/pull/89)

## [v0.9.0](https://github.com/fastly/cli/releases/tag/v0.9.0) (2020-05-21)

[Full Changelog](https://github.com/fastly/cli/compare/v0.8.0...v0.9.0)

**Breaking changes:**

- Describe subcommand consistent --name short flag -d -\> -n [\#85](https://github.com/fastly/cli/pull/85)

**Enhancements:**

- Adds Kafka logging endpoint support [\#95](https://github.com/fastly/cli/pull/95)
- Adds DigitalOcean Spaces logging endpoint support [\#80](https://github.com/fastly/cli/pull/80)
- Adds Rackspace Cloudfiles logging endpoint support [\#79](https://github.com/fastly/cli/pull/79)
- Adds Log Shuttle logging endpoint support [\#78](https://github.com/fastly/cli/pull/78)
- Adds SFTP logging endpoint support [\#77](https://github.com/fastly/cli/pull/77)
- Adds Heroku logging endpoint support [\#76](https://github.com/fastly/cli/pull/76)
- Adds Honeycomb logging endpoint support [\#75](https://github.com/fastly/cli/pull/75)
- Adds Loggly logging endpoint support [\#74](https://github.com/fastly/cli/pull/74)
- Adds Scalyr logging endpoint support [\#73](https://github.com/fastly/cli/pull/73)
- Verify fastly crate version during compute build. [\#67](https://github.com/fastly/cli/pull/67)
- Basic support for historical & realtime stats [\#66](https://github.com/fastly/cli/pull/66)
- Adds Splunk endpoint [\#64](https://github.com/fastly/cli/pull/64)
- Adds FTP logging endpoint support [\#63](https://github.com/fastly/cli/pull/63)
- Adds GCS logging endpoint support [\#62](https://github.com/fastly/cli/pull/62)
- Adds Sumo Logic logging endpoint support [\#59](https://github.com/fastly/cli/pull/59)
- Adds Papertrail logging endpoint support [\#57](https://github.com/fastly/cli/pull/57)
- Adds Logentries logging endpoint support [\#56](https://github.com/fastly/cli/pull/56)

**Bug fixes:**

- Fallback to a file copy during update if the file rename fails [\#72](https://github.com/fastly/cli/pull/72)

## [v0.8.0](https://github.com/fastly/cli/releases/tag/v0.8.0) (2020-05-13)

[Full Changelog](https://github.com/fastly/cli/compare/v0.7.1...v0.8.0)

**Enhancements:**

- Add a --force flag to compute build to skip verification steps. [\#68](https://github.com/fastly/cli/pull/68)
- Improve `compute build` rust compilation error messaging [\#60](https://github.com/fastly/cli/pull/60)
- Adds Syslog logging endpoint support [\#55](https://github.com/fastly/cli/pull/55)

**Bug fixes:**

- debian package doesn't install in default $PATH [\#58](https://github.com/fastly/cli/issues/58)
- deb and rpm packages install the binary in `/usr/local` instead of `/usr/local/bin` [\#53](https://github.com/fastly/cli/issues/53)

**Closed issues:**

- ERROR: error during compilation process: exit status 101. [\#52](https://github.com/fastly/cli/issues/52)

## [v0.7.1](https://github.com/fastly/cli/releases/tag/v0.7.1) (2020-05-04)

[Full Changelog](https://github.com/fastly/cli/compare/v0.7.0...v0.7.1)

**Bug fixes:**

- Ensure compute deploy selects the most ideal version to clone/activate  [\#50](https://github.com/fastly/cli/pull/50)

## [v0.7.0](https://github.com/fastly/cli/releases/tag/v0.7.0) (2020-04-28)

[Full Changelog](https://github.com/fastly/cli/compare/v0.6.0...v0.7.0)

**Enhancements:**

- Publish scoop package manifest during release process [\#45](https://github.com/fastly/cli/pull/45)
- Generate dep and rpm packages during release process [\#44](https://github.com/fastly/cli/pull/44)
- 🦀 🆙date to Rust 1.43.0 [\#40](https://github.com/fastly/cli/pull/40)

**Closed issues:**

- README's build instructions do not work without additional dependencies met [\#35](https://github.com/fastly/cli/issues/35)

## [v0.6.0](https://github.com/fastly/cli/releases/tag/v0.6.0) (2020-04-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.5.0...v0.6.0)

**Enhancements:**

- Bump default Rust template to v0.3.0 [\#32](https://github.com/fastly/cli/pull/32)
- Publish to homebrew [\#26](https://github.com/fastly/cli/pull/26)

**Bug fixes:**

- Don't display the fastly token in the terminal when doing `fastly configure` [\#27](https://github.com/fastly/cli/issues/27)
- Documentation typo in `fastly service-version update` [\#22](https://github.com/fastly/cli/issues/22)
- Fix typo in service-version update command [\#31](https://github.com/fastly/cli/pull/31)
- Tidy up `fastly configure` text output [\#30](https://github.com/fastly/cli/pull/30)
- compute/init: make space after Author prompt match other prompts [\#25](https://github.com/fastly/cli/pull/25)

## [v0.5.0](https://github.com/fastly/cli/releases/tag/v0.5.0) (2020-04-08)

[Full Changelog](https://github.com/fastly/cli/compare/v0.4.1...v0.5.0)

**Enhancements:**

- Add the ability to initialise a compute project from a specific branch [\#14](https://github.com/fastly/cli/pull/14)

## [v0.4.1](https://github.com/fastly/cli/releases/tag/v0.4.1) (2020-03-27)

[Full Changelog](https://github.com/fastly/cli/compare/v0.4.0...v0.4.1)

**Bug fixes:**

- Fix persistence of author string to fastly.toml [\#12](https://github.com/fastly/cli/pull/12)
- Fix up undoStack.RunIfError [\#11](https://github.com/fastly/cli/pull/11)

## [v0.4.0](https://github.com/fastly/cli/releases/tag/v0.4.0) (2020-03-20)

[Full Changelog](https://github.com/fastly/cli/compare/v0.3.0...v0.4.0)

**Enhancements:**

- Add commands for S3 logging endpoints [\#9](https://github.com/fastly/cli/pull/9)
- Add useful next step links to compute deploy [\#8](https://github.com/fastly/cli/pull/8)
- Persist version to manifest file when deploying compute services [\#7](https://github.com/fastly/cli/pull/7)

**Bug fixes:**

- Fix comment for --use-ssl flag [\#6](https://github.com/fastly/cli/pull/6)

## [v0.3.0](https://github.com/fastly/cli/releases/tag/v0.3.0) (2020-03-11)

[Full Changelog](https://github.com/fastly/cli/compare/v0.2.0...v0.3.0)

**Enhancements:**

- Interactive init [\#5](https://github.com/fastly/cli/pull/5)

## [v0.2.0](https://github.com/fastly/cli/releases/tag/v0.2.0) (2020-02-24)

[Full Changelog](https://github.com/fastly/cli/compare/v0.1.0...v0.2.0)

**Enhancements:**

- Improve toolchain installation help messaging [\#3](https://github.com/fastly/cli/pull/3)

**Bug fixes:**

- Filter unwanted files from template repository whilst initialising [\#1](https://github.com/fastly/cli/pull/1)

## [v0.1.0](https://github.com/fastly/cli/releases/tag/v0.1.0) (2020-02-05)

[Full Changelog](https://github.com/fastly/cli/compare/5a8d21b6b1973abe7a27f985856d910f4396ce95...v0.1.0)

Initial release :tada:



\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*
