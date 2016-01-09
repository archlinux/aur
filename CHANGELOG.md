sedsed changelog
================

GitHub live version, 2014

- Added Python 3 support. Now sedsed runs in Python versions 2.6, 2.7 and 3.x.
- New test suite.
- Source code reformatted, now following PEP-8.
- Source code improved, now following pylint recomendations.
- Fixed to work with BSD sed (Mac OS X).

<!--
- Add support for GNU sed `s///` flags: `M`, `m`, `e`.
- Bugfix: Address ranges with spaces before the comma.
- Bugfix: `I` char removed in some cases.
-->

[Version 1.0](https://github.com/aureliojargas/sedsed/releases/tag/v1.0)
released in 2004-12-09

- Portable: Huge changes to make the debug file portable, so now it
  works even in old UNIX versions of sed.
  (thanks Gudermez for requesting)
  (thanks Laurent Voguel for his excellent sedcheck tool)
- Better debug: The debug command to show the current sed command was
  simplified from `s///;P;s///` to a single `i` command, reducing the
  debug file size and increasing execution speed.
  (thanks Thobias Salazar Trevisan for the idea)
- Generated debug file more readable, with indented debug commands.
- Default indent prefix for `--indent` has changed from 2 to 4 spaces.
- Now the system's sed path is configurable.
- Added `--dump-debug` option to inspect the generated debug file
  (implies `--nocolor` and `--debug`).
- Bugfix: Now parses `a`, `c`, `i` commands with `;` on the text
  (thanks Leo Mulders for reporting)

[Version 0.8](https://github.com/aureliojargas/sedsed/releases/tag/v0.8)
released in 2003-11-15

- Huge code cleanup and rearrange, now it is readable
- Added `-n` option and its aliases `--quiet` and `--silent`
  (thanks Eric Pement)
- Added `-H` option as an alias to `--htmlize`
- Now accepts sed script on STDIN (like sed): `echo p | sed -f - file`
- Changed internal line separator string to ASCII chars
  (thanks Thobias Salazar)
- Bugfix: Script previous checking was broken (thanks Eric Pement)

[Version 0.7](https://github.com/aureliojargas/sedsed/releases/tag/v0.7)
released in 2003-01-21

- Added `--color` option (for Windows users)
- Bugfix: Debug file line break on Windows (thanks Eric Pement)

[Version 0.6](https://github.com/aureliojargas/sedsed/releases/tag/v0.6)
released in 2002-11-19

- Now sedsed works on Windows/DOS
- New stand-alone .EXE version for Windows users (by py2exe)
- Option `-v` REALLY changed to `-V` (lamer...)

[Version 0.5](https://github.com/aureliojargas/sedsed/releases/tag/v0.5)
released in 2002-05-08

- The sedsed program is now compatible with old Python v1.5
- The sed debug file is now temporary (is removed)
- Option `-v` changed to `-V`
- Added `i` flag for `s///` command
- Now input text is read from STDIN and/or file(s), like sed
- Now sed script is read from `-f <file>` and/or `-e <script>`, like sed

[Version 0.4](https://github.com/aureliojargas/sedsed/releases/tag/v0.4)
released in 2002-03-27

- Added `--htmlize` option

[Version 0.3](https://github.com/aureliojargas/sedsed/releases/tag/v0.3)
released in 2002-02-22

- Added `--version` option
- Added documentation
- Added i386 binary version

[Version 0.2](https://github.com/aureliojargas/sedsed/releases/tag/v0.2)
released in 2001-12-22

- Status of `t` command preserved correctly (thanks Paolo Bonzini)

[Version 0.1](https://github.com/aureliojargas/sedsed/releases/tag/v0.1)
released in 2001-12-21

- First release on sed-users list
