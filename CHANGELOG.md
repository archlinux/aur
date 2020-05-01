# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

For detailed code changes, please visit
https://github.com/greenbone/gvm-tools/commits/master
or get the entire source code repository and view log history:

```sh
$ git clone https://github.com/greenbone/gvm-tools.git
$ cd gvm-tools && git log
```

## [Unreleased]

### Added
- Added --ssh-password switch for ssh connection [PR 140](https://github.com/greenbone/gvm-tools/pull/140)
- Added a new console line interface `gvm-script` for only running GMP and OSP
  scripts without opening a python shell [PR 152](https://github.com/greenbone/gvm-tools/pull/152)
- Forbid to run any gvm-tools cli as root user [PR 183](https://github.com/greenbone/gvm-tools/pull/183)
- Added error message if invalid XML is passed to `gvm-cli` [PR 198](https://github.com/greenbone/gvm-tools/pull/198)
- Added argument `--pretty` to `gvm-cli` to pretty format xml output
  [PR 203](https://github.com/greenbone/gvm-tools/pull/203)

### Changed
- Improved error messages if unix socket could not be found [PR 78](https://github.com/greenbone/python-gvm/pull/78)
- The structure for the config file (default is ~/.config/gvm-tools.conf) has
  changed. It's possible to set defaults for nearly all command line arguments
  [PR 140](https://github.com/greenbone/gvm-tools/pull/140)
- The command line help for `gvm-cli` and `gvm-pyshell` has been updated and
  made more consistent [PR 138](https://github.com/greenbone/gvm-tools/pull/138)
- Renamed --ssh-user switch to --ssh-username [PR 140](https://github.com/greenbone/gvm-tools/pull/140)
- Update `gvmtools.get_version` to return a fully compliant [PEP 440](https://www.python.org/dev/peps/pep-0440/)
  version string [PR 150](https://github.com/greenbone/gvm-tools/pull/150)
- Refresh the dependencies specified via the `Pipfile.lock` file to their latest
  versions [PR 186](https://github.com/greenbone/gvm-tools/pull/186),
  [PR 193](https://github.com/greenbone/gvm-tools/pull/193)
- Dropped global command line arguments from sub commands e.g. it must be `gvm-cli --config foo.conf socket ...`
  instead of `gvm-cli socket --config foo.conf` now. The latter didn't work actually but
  was listed in the `--help` output [#194](https://github.com/greenbone/gvm-tools/pull/194)
- Improved error message if a global argument is passed after the connection type to `gvm-cli`
  [#196](https://github.com/greenbone/gvm-tools/pull/196)
- Renamed `clean-slave.gmp` to `clean-sensor.gmp` [PR 202](https://github.com/greenbone/gvm-tools/pull/202)

### Deprecated
- Only running scripts with gvm-pyshell is deprecated [PR 152](https://github.com/greenbone/gvm-tools/pull/152)
- \[Auth\] section in config file is deprecated and will be ignored in future
  releases [PR 160](https://github.com/greenbone/gvm-tools/pull/160)

### Fixed
- Fix a bug which caused `gvm-pyshell` to immediately re-enter interactive mode
  upon exiting it for the first time [PR 139](https://github.com/greenbone/gvm-tools/pull/139)
- Support \[Auth\] section in config file for backwards compatibility [PR 160](https://github.com/greenbone/gvm-tools/pull/160)
- Fix using correct API to get single task and targets in update-task-target.gmp
  script [PR 188](https://github.com/greenbone/gvm-tools/pull/188)

## [2.0.0.beta1] - 2018-11-13

gvm-tools got split into the command line interfaces (*gvm-cli* and
*gvm-pyshell*) including the [gmp (example) scripts](https://github.com/greenbone/gvm-tools/tree/master/scripts)
and the Python API. The Python API can now be found at
[python-gvm](https://github.com/greenbone/python-gvm). During this split the
python package name for the API got changed from **gmp** to **gvm**. The API
has also been refactored and stabilized. For details please take a look at
[python-gvm](https://github.com/greenbone/python-gvm)
[PR 126](https://github.com/greenbone/gvm-tools/pull/126).

### Added
- It's now possible to write OSP scripts. Using the `--protocol=OSP` switch
  `gvm-pyshell` adds a global **osp** object instead of the **gmp** one.
- Added new client helper module.
- It's possible to get the current versions of gvm-tools via `__version__` and
  python-gvm via `__api_version__` [PR 127](https://github.com/greenbone/gvm-tools/pull/127)
- Use pipenv for development.

### Changed
- The `__name__` variable is set to `__gmp__` for GMP scripts and to `__osp__`
  for OSP scripts *(Remember: for normal Python scripts `__name__` is set to
  [`__main__`](https://docs.python.org/3/library/__main__.html))*.
- Scripts are only getting two global variables now: **gmp** (or **osp**)
  and **args**. **gmp** and **osp** are the global objects to communicate with
  the remote *gvmd* or *ospd* daemon. **args** contains the parsed arguments for
  the script.
- The global **args** object only contains script related parameters now. These
  username and password from the `--gmp-username` and `--gmp-password` switches
  and the additional scripts parameters as `args.argv`.
- **GMPError** got renamed to **GvmError** and must be imported from
  `gvm.errors` module.
  ```python
  from gvm.errors import GvmError as GMPError
  ```
- pretty function isn't available as a global function in the scripts anymore.
  It must be imported separately like
  ```python
  from gvmtools.helper import pretty_print as pretty
  ```
- The included [gmp scripts](https://github.com/greenbone/gvm-tools/tree/master/scripts)
  have been cleaned up and adjusted for the new API.

### Removed
- Removed experimental `gvm-dialog` application.

## [1.4.1] - 2018-08-10

This is the first maintenance release of the gvm-tools module 1.4 for
the Greenbone Vulnerability Management (GVM) framework.

This release covers bug fixes in 'create' and 'modify' methods.

Many thanks to everyone who has contributed to this release: Raphael
Grewe, Juan Jose Nicola and Jan-Oliver Wagner

Main changes compared to gvm-tools-1.4.0:

- Fix bugs for create and modify command methods.
- Improve unit tests.
- Improve documentation.

## [1.4.0] - 2018-08-09

This is the first release of the gvm-tools module 1.4 for the Greenbone
Vulnerability Management (GVM) framework.

This release covers bug fixes, robustness improvements and an extended
GMP scripts collection.

Many thanks to everyone who has contributed to this release: Raphael
Grewe, Mirko Hansen, Henning Häcker, David Kleuker, Juan Jose Nicola,
Timo Pollmeier, Bjoern Ricks, Joshua Schwartz, Jan-Oliver Wagner and
Michael Wiegand.

Main changes compared to gvm-tools-1.3.1:

- Correct XML encoding for commands
- Fix bug for long GMP commands through SSHConnection
- Add new GMP scripts: create\_targets\_from\_host\_list.gmp,
  gen-random-targets.gmp, send-schedules.gmp, send-targets.gmp,
  send-tasks.gmp, send\_delta\_emails.gmp, startAlertScan.gmp,
  update-task-target.gmp.
- Improve and extend 'create' and 'modify' command methods
- Add support for accessing the raw response
- Improve unit tests
- Allow anonymous connections
- Require lxml and defusedxml python modules
- Improve documentation
- Several code improvements

## [1.3.1] - 2017-12-14

- Improved stability with ssh connections again

## [1.3.0] - 2017-12-12

- Improved stability with ssh connections
- Fixed bugs for create\_target command
- Fixed some typos
- Added correct license file
- Improved setup (Only Python3 is allowed)

## [1.2.0] - 2017-08-04

- Improved feature to read from config file for gvm-cli
- Added feature to read from config file for gvm-pyshell
- Added feature to disable timeout on sockets for all clients
- Added new script to delete overrides by filter
- Removed requirement for username in gvm-cli
- Minor code improvement

## [1.1.0] - 2017-06-28

- Fixed hgignore file (Ignored important file)
- Fixed choice decision for the connectiontype
- Fixed quote bug in gvm\_connection.py
- Changed quit function to sys.exit of non interactively used python
  files (f.e. scripts)
- Changed path of unixsocket from openvasmd.sock to gvmd.sock
- Added timeout functionality to all connection types
- Added GPL v3 licenses in all relevant files
- Added function create\_report
- Added new script to sync tasks between to gsm
- Added new script to sync assets from a csv list
- Added experimental client gvm-dialog again

## [1.0.3] - 2017-06-01

- Fixed wrong library path

## [1.0.2] - 2017-06-01

- Changed directory structure and names, because of the generic names
  for python modules
- Directory libs is named gmp
- Directory clients is copied into gmp

## [1.0.1] - 2017-06-01

- Changed name to gvm-tools
- Bugfixes at the scripts
- Added new script to create dummy data for gsm

## [1.0] - 2017-05-31

- First stable release of gvm-tools

[Unreleased]: https://github.com/greenbone/gvm-tools/compare/v2.0.0.beta1...master
[2.0.0.beta1]: https://github.com/greenbone/gvm-tools/compare/v1.4.1...v2.0.0.beta1
[1.4.1]: https://github.com/greenbone/gvm-tools/compare/v1.4.0...v1.4.1
[1.4.0]: https://github.com/greenbone/gvm-tools/compare/1.3.1...v1.4.0
[1.3.1]: https://github.com/greenbone/gvm-tools/compare/1.3.0...1.3.1
[1.3.0]: https://github.com/greenbone/gvm-tools/compare/1.2.0...1.3.0
[1.2.0]: https://github.com/greenbone/gvm-tools/compare/1.1.0...1.2.0
[1.1.0]: https://github.com/greenbone/gvm-tools/compare/1.0.3...1.1.0
[1.0.3]: https://github.com/greenbone/gvm-tools/compare/1.0.2...1.0.3
[1.0.2]: https://github.com/greenbone/gvm-tools/compare/1.0.1...1.0.2
[1.0.1]: https://github.com/greenbone/gvm-tools/compare/1.0...1.0.1
[1.0]: https://github.com/greenbone/gvm-tools/releases/tag/1.0
