## v1.2.1

> 2022-10-01

## Summary

Minor patch release with a single bug fix, with mostly behind the scenes package 
updates and upgrades.

### Commits
- [[`8d5a8cb`](https://github.com/sondr3/git-ignore)] Upgrade dependencies, clap to v4
- [[`214f364`](https://github.com/sondr3/git-ignore)] Move to dtolnay/rust-toolchain for CI
- [[`7e366f4`](https://github.com/sondr3/git-ignore)] Remove dependabot crates updates, upgrade packages
- [[`46cc220`](https://github.com/sondr3/git-ignore)] Upgrade packages
- [[`58a2ab8`](https://github.com/sondr3/git-ignore)] Upgrade packages
- [[`8b0b4e0`](https://github.com/sondr3/git-ignore)] And release CI copying wrong assets
- [[`f5d295e`](https://github.com/sondr3/git-ignore)] Add git-ignore AUR package
- [[`e1c3c78`](https://github.com/sondr3/git-ignore)] Update CI versions
- [[`79b10e5`](https://github.com/sondr3/git-ignore)] Add clap_mangen to build man pages, update build.rs
- [[`40e8d11`](https://github.com/sondr3/git-ignore)] Update packages, fix deprecations
- [[`684c360`](https://github.com/sondr3/git-ignore)] Add dependabot for GitHub Actions, Rust packages
- [[`25bb013`](https://github.com/sondr3/git-ignore)] Fix wrong extension for Zig
- [[`6e1d4e0`](https://github.com/sondr3/git-ignore)] Mention @sestrella in CHANGELOG [ci skip]
- [[`584325b`](https://github.com/sondr3/git-ignore)] Unfuck publish pipeline
- [[`df3ff6a`](https://github.com/sondr3/git-ignore)] Fix the release action, whoops

## 1.2.0

> 2021-12-05

The biggest release yet! From automatically recognizing templates based on files
in your current directory to custom aliases and templates! Huge thanks to 
[`sestrella`](https://github.com/sestrella) for contributing the automatic matching functionality.

- **Automatic**: When using the `-a/--auto`, `git-ignore` will automatically create `.gitignore`
  templates by matching against files in your current directory.
- **Aliases**: Do you use the same templates toghether all the time? Create an alias to combine
  them.
- **Templates**: Missing a template from www.gitignore.io? Create your own!

### Commits

* [[`75a40daa25`](https://github.com/sondr3/git-ignore/commit/75a40daa25)] - Upgrade to clap v3 RC 
* [[`1d9c331479`](https://github.com/sondr3/git-ignore/commit/1d9c331479)] - Add a bunch more languages to detectors 
* [[`688b672d77`](https://github.com/sondr3/git-ignore/commit/688b672d77)] - \[#7] Auto detect templates based on existing files
* [[`33af5b4022`](https://github.com/sondr3/git-ignore/commit/33af5b4022)] - Add notice to config\_or! macro when config is missing 
* [[`cadc69d516`](https://github.com/sondr3/git-ignore/commit/cadc69d516)] - Add visible aliases to subcommands, update man page 
* [[`738deff37d`](https://github.com/sondr3/git-ignore/commit/738deff37d)] - Early exit if updating and not listing any templates 
* [[`7a56a7ebc8`](https://github.com/sondr3/git-ignore/commit/7a56a7ebc8)] - Add completions to assets folder 
* [[`1eefbac6b8`](https://github.com/sondr3/git-ignore/commit/1eefbac6b8)] - Remove man crate, create man pages via asciidoctor 
* [[`f8e3c63453`](https://github.com/sondr3/git-ignore/commit/f8e3c63453)] - Update man page, fix some spelling 
* [[`a3c1124c48`](https://github.com/sondr3/git-ignore/commit/a3c1124c48)] - Minor error handling refactoring 
* [[`72a72733f9`](https://github.com/sondr3/git-ignore/commit/72a72733f9)] - Add anyhow for easier error handling 
* [[`e97aca5ab9`](https://github.com/sondr3/git-ignore/commit/e97aca5ab9)] - Add --simple flag to ignore aliases and templates 
* [[`dc748b2cbc`](https://github.com/sondr3/git-ignore/commit/dc748b2cbc)] - Implement creating and reading templates 
* [[`8f767e9078`](https://github.com/sondr3/git-ignore/commit/8f767e9078)] - Simplify and remove unneeded code 
* [[`dc7dacd018`](https://github.com/sondr3/git-ignore/commit/dc7dacd018)] - Color aliases, templates when listing 
* [[`660e99085a`](https://github.com/sondr3/git-ignore/commit/660e99085a)] - Fix some pedantic lints 
* [[`3b7cbc5072`](https://github.com/sondr3/git-ignore/commit/3b7cbc5072)] - Switch lookup of names from starts\_with to contains 
* [[`c9b49eb02d`](https://github.com/sondr3/git-ignore/commit/c9b49eb02d)] - Fetch templates from aliases and list them/print them 
* [[`9ddfa8d2df`](https://github.com/sondr3/git-ignore/commit/9ddfa8d2df)] - Refactor Config::from\_dir function 
* [[`d558dd1ebc`](https://github.com/sondr3/git-ignore/commit/d558dd1ebc)] - Fix clippy warning 
* [[`2f8cfebcb1`](https://github.com/sondr3/git-ignore/commit/2f8cfebcb1)] - Add messages when removing aliases and templates 
* [[`9b3b74714e`](https://github.com/sondr3/git-ignore/commit/9b3b74714e)] - Fix error where config does not get its own path 
* [[`9a6925357a`](https://github.com/sondr3/git-ignore/commit/9a6925357a)] - Simplify config initialization, don't list empty aliases 
* [[`9a91755aae`](https://github.com/sondr3/git-ignore/commit/9a91755aae)] - Extract handling of config to a macro 
* [[`5719bfdf05`](https://github.com/sondr3/git-ignore/commit/5719bfdf05)] - Add methods for listing templates and aliases 
* [[`71c7f1c5a7`](https://github.com/sondr3/git-ignore/commit/71c7f1c5a7)] - Extract GitIgnore struct to own file 
* [[`e5f32a119e`](https://github.com/sondr3/git-ignore/commit/e5f32a119e)] - Extract Config to own file, add methods for adding/removing aliases 
* [[`6751e35588`](https://github.com/sondr3/git-ignore/commit/6751e35588)] - Use Clap from GitHub while waiting for next release 
* [[`ff2248b602`](https://github.com/sondr3/git-ignore/commit/ff2248b602)] - Extract CLI, add completions 
* [[`f761896936`](https://github.com/sondr3/git-ignore/commit/f761896936)] - Initial port of commands from structopt to clap v3 
* [[`5b2a3b8077`](https://github.com/sondr3/git-ignore/commit/5b2a3b8077)] - Simplify getting config directory 
* [[`4c8746961e`](https://github.com/sondr3/git-ignore/commit/4c8746961e)] - Add handling for templates 
* [[`73f5cb59b9`](https://github.com/sondr3/git-ignore/commit/73f5cb59b9)] - Convert config handling to subcommands 
* [[`6ef7eaa0ce`](https://github.com/sondr3/git-ignore/commit/6ef7eaa0ce)] - Implement adding aliases 
* [[`d5b6793b69`](https://github.com/sondr3/git-ignore/commit/d5b6793b69)] - Start working on a config file 
* [[`f966329d98`](https://github.com/sondr3/git-ignore/commit/f966329d98)] - Upgrade to Rust 2021 edition, upgrade packages 

## 1.1.2

> 2021-03-24

No functionality added this release, upgraded dependencies and fixed manpage generation.

- [[`7573fe6c2a`](https://github.com/sondr3/git-ignore/commit/7573fe6c2acbeaafd5c4762d63ead04cfe8de523)] Release 1.1.2
- [[`2d4fe00657`](https://github.com/sondr3/git-ignore/commit/2d4fe00657d144f3be3ffff563c671910fda7e0a)] Update all dependencies, format Cargo.toml
- [[`51afde98be`](https://github.com/sondr3/git-ignore/commit/51afde98be7eb0c0712514a21def1a6312ad38b2)] Remove test CI pipeline, there are no tests in this project
- [[`18e5428950`](https://github.com/sondr3/git-ignore/commit/18e5428950b78cfcd984da4a8d2dc580bbf97fae)] Fix lint errors
- [[`a51bfdeb62`](https://github.com/sondr3/git-ignore/commit/a51bfdeb627943785dd062dbd00168ba0d9ccf6f)] Copy and add man page to release archives
- [[`b889b975da`](https://github.com/sondr3/git-ignore/commit/b889b975da3e10a57ef9bdd874093f1212780057)] Upgrade dependencies
- [[`19b2f41e06`](https://github.com/sondr3/git-ignore/commit/19b2f41e06f9dd5763a350cfe43533ae4fbbff34)] Create a proper man-page out dir
- [[`f120cd420f`](https://github.com/sondr3/git-ignore/commit/f120cd420f3cf82f90f567c83945bf34e4fbc5fe)] Update changelog

## 1.1.1

> 2020-05-05

A minor bugfix release: we now recursively create the cache directory if it is
missing.

- [[`01027328b4`](https://github.com/sondr3/git-ignore/commit/01027328b4)] - Reenable publishing to Cargo
- [[`20c05d42f8`](https://github.com/sondr3/git-ignore/commit/20c05d42f8)] - Create missing directories recursively

## 1.1.0

> 2020-05-04

The first minor release of `git-ignore`, this is mostly a behind-the-scenes
upgrade where nothing should really affect you. In the background we've gone
from using `reqwest` to using `attohtppc` for managing our requests, primarily
to reduce dependencies and binary size. Other than that we've also simplified
some code and moved to using GitHub Actions as our CI instead of a combination
of Travis CI and Appveyor.

- [[`0ea4c1d5b1`](https://github.com/sondr3/git-ignore/commit/0ea4c1d5b1)] - Remove TravisCI, AppVeyor badges, add GitHub Actions badge
- [[`c88c331f4f`](https://github.com/sondr3/git-ignore/commit/c88c331f4f)] - Fix clippy warnings
- [[`3fcabc99cb`](https://github.com/sondr3/git-ignore/commit/3fcabc99cb)] - Move to GitHub Actions for CI
- [[`e91acece58`](https://github.com/sondr3/git-ignore/commit/e91acece58)] - Move from reqwest to attohttpc, refactor and simplify code
- [[`47a4686701`](https://github.com/sondr3/git-ignore/commit/47a4686701)] - Fix a new clippy lint
- [[`367e269b0e`](https://github.com/sondr3/git-ignore/commit/367e269b0e)] - Add download instructions for release tab \[ci skip\]

## 1.0.0

> 2019-04-19

First major release of `git-ignore`. Workflow stays the same, the major feature
this release is offline caching of templates from
[gitignore.io](https://www.gitignore.io/). This is fetched via the JSON API,
parsed and converted by [Serde](https://serde.rs/) and stored in your OS' cache
location thanks to [directories-rs](https://github.com/soc/directories-rs).

Usage stays the same, I've added a new `--update` flag for fetching the
templates, updated the code to Rust 2018 and some spring cleaning throughout the
code. Added [Travis CI](https://travis-ci.com/) and
[Appveyor](https://www.appveyor.com/) for automatic testing and releasing of
`git-ignore` across Linux, \*BSD, Windows and macOS.

- [[`94d14f84d5`](https://github.com/sondr3/git-ignore/commit/94d14f84d5)] - Add installation instructions, release checklist \[ci skip\]
- [[`a4c098064c`](https://github.com/sondr3/git-ignore/commit/a4c098064c)] - Configure CI properly, do a trial prerelease
- [[`0e06b44e8f`](https://github.com/sondr3/git-ignore/commit/0e06b44e8f)] - Only add the header when we actually generate a template
- [[`07b2f23dd9`](https://github.com/sondr3/git-ignore/commit/07b2f23dd9)] - Add notice for update success, print info in green color
- [[`33c01fe116`](https://github.com/sondr3/git-ignore/commit/33c01fe116)] - Remove how to apply GPL, I always forget this comes with the templace \[ci skip\]
- [[`94f35830dd`](https://github.com/sondr3/git-ignore/commit/94f35830dd)] - Add mentions about `--update` \[ci skip\]
- [[`f522ca92ec`](https://github.com/sondr3/git-ignore/commit/f522ca92ec)] - Update documentation \[ci skip\]
- [[`cab5907989`](https://github.com/sondr3/git-ignore/commit/cab5907989)] - Add attribution and a newline after info statement
- [[`af1d85fe4c`](https://github.com/sondr3/git-ignore/commit/af1d85fe4c)] - Disable thinLTO for the moment
- [[`0075815beb`](https://github.com/sondr3/git-ignore/commit/0075815beb)] - Fix program panicking if ignore file is missing
- [[`cc4eafd6d0`](https://github.com/sondr3/git-ignore/commit/cc4eafd6d0)] - Automatically generate man pages for git-ignore
- [[`bf29e37f06`](https://github.com/sondr3/git-ignore/commit/bf29e37f06)] - Sort list of templates
- [[`bb0a18204f`](https://github.com/sondr3/git-ignore/commit/bb0a18204f)] - Add a colorful warning message when using cached results
- [[`7cc2e16cec`](https://github.com/sondr3/git-ignore/commit/7cc2e16cec)] - Compile release versions with thinLTO
- [[`f4c3782cd2`](https://github.com/sondr3/git-ignore/commit/f4c3782cd2)] - Fix running program without arguments returning nothing
- [[`f05f2d7cd0`](https://github.com/sondr3/git-ignore/commit/f05f2d7cd0)] - Re-implement printing of templates
- [[`22d291c8a8`](https://github.com/sondr3/git-ignore/commit/22d291c8a8)] - Re-implement function to find all matching template names
- [[`cd64d722f6`](https://github.com/sondr3/git-ignore/commit/cd64d722f6)] - Read ignore.json file and serialize to HashMap\<String, Language\>
- [[`dfd0189e3b`](https://github.com/sondr3/git-ignore/commit/dfd0189e3b)] - Extract out ignore file location, will be used later
- [[`79bddef0a3`](https://github.com/sondr3/git-ignore/commit/79bddef0a3)] - Fetch all templates at once using JSON
- [[`c2c8ee441c`](https://github.com/sondr3/git-ignore/commit/c2c8ee441c)] - Fetch and store all templates available on gitignore.io
- [[`aa68f7506b`](https://github.com/sondr3/git-ignore/commit/aa68f7506b)] - Implement fetching singular templates, remove unneeded methods
- [[`24de14f91a`](https://github.com/sondr3/git-ignore/commit/24de14f91a)] - Create function to read contents of a file to a vec
- [[`9e947714d1`](https://github.com/sondr3/git-ignore/commit/9e947714d1)] - Extract cache list file to be its own field in GitIgnore struct
- [[`aef28b85de`](https://github.com/sondr3/git-ignore/commit/aef28b85de)] - Write list of templates to cache dir when -u/--update is used
- [[`20a96d2d36`](https://github.com/sondr3/git-ignore/commit/20a96d2d36)] - Create cache dir if required, fetch all ignore templates
- [[`652e19326b`](https://github.com/sondr3/git-ignore/commit/652e19326b)] - Rename App -\> GitIgnore, remove config_dir
- [[`f06bed4bfb`](https://github.com/sondr3/git-ignore/commit/f06bed4bfb)] - Add directories-rs, create app struct for configuring application
- [[`e224e07251`](https://github.com/sondr3/git-ignore/commit/e224e07251)] - Update git-ignore to Rust 2018
- [[`be5db126bc`](https://github.com/sondr3/git-ignore/commit/be5db126bc)] - Add shell.nix for building on NixOS \[ci skip\]
- [[`3daf562915`](https://github.com/sondr3/git-ignore/commit/3daf562915)] - Deny Clippy warnings, we want things safe and idiomatic

## 0.2.0

> 2018-11-23

Minor refactoring of how the command line arguments work, instead of using
subcommands we instead only have a single flag (`--list`) to toggle whether
you're listing available templates or getting them. The rest are comments and
behind-the-scenes fixes.

- [[`fe802b4888`](https://github.com/sondr3/git-ignore/commit/fe802b4888)] - Document all the things!
- [[`dfd8bbb235`](https://github.com/sondr3/git-ignore/commit/dfd8bbb235)] - Deny stupid things I shouldn't do
- [[`710779fa05`](https://github.com/sondr3/git-ignore/commit/710779fa05)] - Update README \[ci skip\]
- [[`44b49163f2`](https://github.com/sondr3/git-ignore/commit/44b49163f2)] - Go from subcommands to flags instead, because it makes more sense
- [[`2bd95735db`](https://github.com/sondr3/git-ignore/commit/2bd95735db)] - Add changelog \[ci skip\]

## 0.1.1

> 2018-11-05

Don't mind the patch release, it's just there cause I goofed up. This is the
initial release of `git-ignore`, a small and simple tool that allows you to
quickly and easily list and get all the templates that exists on
www.gitignore.io.

- [[`902e94eb61`](https://github.com/sondr3/git-ignore/commit/902e94eb61)] - Fix badge displaying the wrong URL on crates.io
- [[`efc83813aa`](https://github.com/sondr3/git-ignore/commit/efc83813aa)] - Don't link to the wrong project, whoops \[ci skip\]
- [[`8d363f2b93`](https://github.com/sondr3/git-ignore/commit/8d363f2b93)] - Add README \[ci skip\]
- [[`9389ff9ff8`](https://github.com/sondr3/git-ignore/commit/9389ff9ff8)] - Add LICENSE, update name of package on crates.io and metadata
- [[`420b4eba87`](https://github.com/sondr3/git-ignore/commit/420b4eba87)] - We cannot print stuff we cannot pipe to .gitignore
- [[`f55376c734`](https://github.com/sondr3/git-ignore/commit/f55376c734)] - Include Cargo.lock since this is an application
- [[`27ecae60ba`](https://github.com/sondr3/git-ignore/commit/27ecae60ba)] - Fetch and print gitignore templates
- [[`93bbd19770`](https://github.com/sondr3/git-ignore/commit/93bbd19770)] - Make sure any matches are included
- [[`3045c6fefd`](https://github.com/sondr3/git-ignore/commit/3045c6fefd)] - Silence errors
- [[`edeafa8992`](https://github.com/sondr3/git-ignore/commit/edeafa8992)] - Format with rustfmt and fix Clippy lints
- [[`64e9e21b37`](https://github.com/sondr3/git-ignore/commit/64e9e21b37)] - List all matches found
- [[`c7beeb9472`](https://github.com/sondr3/git-ignore/commit/c7beeb9472)] - List all possible templates from gitignore.io
- [[`11d66fcf6f`](https://github.com/sondr3/git-ignore/commit/11d66fcf6f)] - Add a very simple CLI interface
- [[`7c077a87fa`](https://github.com/sondr3/git-ignore/commit/7c077a87fa)] - Forbid the usage of unsafe, fail on warnings and add Travis config
- [[`7a65ce7915`](https://github.com/sondr3/git-ignore/commit/7a65ce7915)] - In the beginning there was darkness...
