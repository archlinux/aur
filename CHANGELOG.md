# Changelog

## [0.9.0-2] - 2023-03-04

- Fix build issue caused by change to go 1.20 cli. [#219](https://github.com/maaslalani/slides/issues/219)

## [0.9.0-1] - 2022-09-13

- Add ssh server functionality by [@ivantsepp](https://github.com/@ivantsepp) in [#150](https://github.com/maaslalani/slides/pull/150)
- feat: ensure that date strings are not interpreted as January 2, 2006 formatted strings by [@maaslalani](https://github.com/maaslalani) in [#170](https://github.com/maaslalani/slides/pull/170)
- Feat: Yank Code Blocks by [@maaslalani](https://github.com/maaslalani) in [#173](https://github.com/maaslalani/slides/pull/173)
- Code Comments to hide verbose code by [@maaslalani](https://github.com/maaslalani) in [#174](https://github.com/maaslalani/slides/pull/174)
- feat: add support for java code execution by [@mfathi91](https://github.com/mfathi91) in [#184](https://github.com/maaslalani/slides/pull/184)

## [0.8.0-1] - 2022-04-07

### Fixed

- do not get `stderr` when preprocessing slides by [@maaslalani](https://github.com/maaslalani) in [#145](https://github.com/maaslalani/slides/pull/145)
- Respect `GLAMOUR_STYLE` if environment variable is set by [@maaslalani](https://github.com/maaslalani) in [#146](https://github.com/maaslalani/slides/pull/146)
- Slides tutor by [@maaslalani](https://github.com/maaslalani) in [#147](https://github.com/maaslalani/slides/pull/147)

## [0.7.3-1] - 2022-02-15

- Bump lots of dependencies
- Get rid of lots of dependencies (Removed over 600 lines from go.sum)

## [0.7.2-1] - 2021-11-01

### Added

- Improvements to Search (using `bubbles#TextInput` component) in `slides` by [@darmiel](https://github.com/darmiel) in [#119](https://github.com/maaslalani/slides/pull/119)

## [0.7.1-1] - 2021-11-01

### Added

- Added Page Up and Page Down navigation by [@Janszczyrek](https://github.com/Janszczyrek) in [#115](https://github.com/maaslalani/slides/pull/115)
- Improvements to exit code handling & virtual text reset

### Fixed

- Fixed bug with executing the same code block multiple times.

## [0.7.0-1] - 2021-10-29

### Added

#### Search Functionality

To quickly jump to the right slide, you can use the search functionality.

Press `/`, enter your search term, and press `Enter`.
(The search term is interpreted as a regular expression. The `/i` flag causes case-insensitivity.).

Press `ctrl+n` after a search to go to the next search result.

Thanks to [@darmiel](https://github.com/darmiel)!

## [0.6.1-1] - 2021-10-21

### Added

- Ability to run multiple code blocks in a single slide (thanks to [@linw1995](https://github.com/linw1995)).
- Word wrapping support (thanks to [@gsol10](https://github.com/gsol10)).
- Ability to use custom date format `YYY-MM-DD` for date formatting in metadata (thanks to [@cuducos](https://github.com/cuducos)).
- Vim-like navigation (`5D`: go to slide 5, `gg`: go to first slide, `G`: go to last slide) (thanks to [@stoovon](https://github.com/stoovon)).
- Added rust support to code execution (thanks to [@darmiel](https://github.com/darmiel)).

## [0.6.0-1] - 2021-10-21

### Removed

- Removed redundent ruby tests.

## [0.5.0-1] - 2021-08-25

### Added

#### Slides Customization

Allows you to customize your presentation's look and feel with metadata at the
top of your `slides.md`. (thanks to [@cuducos](https://github.com/cuducos))

This section is entirely optional, slides will use sensible defaults if this
section or any field in the section is omitted.

```
---
theme: ./path/to/theme.json
author: Gopher
date: January 2, 2006
paging: Slide %d / %d
---
```

- `theme`:  Path to json file containing a glamour theme, can also be a link to
            a remote json file which slides will fetch before presenting.
- `author`: A string to display on the bottom-left corner of the presentation
            view. Defaults to the OS current user's full name. Can be empty to
            hide the author.
- `date`:   A string that is used to format today's date in the form
            2006-01-02. If the date is not a valid form of 2006-01-02 the
            contents of the string will be displayed. Defaults to 2006-01-02.
- `paging`: A string that contains 0 or more %d directives. The first %d will
            be replaced with the current slide number and the second %d will be
            replaced with the total slides count. Defaults to Slide %d / %d.

#### Code Block Execution

Added `lua` support.

### Fixed

- Ordered lists now respect the first number as a starting point.

## [0.4.1-1] - 2021-07-05

### Added

- Support for `perl` code execution.

### Fixed

- Custom themes now work (thanks to [@itmecho](https://github.com/itmecho))
- Slides will not crash with small slides (`<= 1`)

## [0.4.0-1] - 2021-06-27

### Added

#### Pre-processing

`slides` now has the ability to have commands run and executed before
presenting slides (pre-processing).

To use this feature, you must:

  - Use a file for your slides (no `stdin`, for security reasons)
  - `chmod +x file.md`, change file permissions to be able to execute code on
    slides (for security reasons)

In your `slides.md`, you can write a code block with this structure (use tildes
`~`). When you go to present slides (that are executable,
`chmod +x slides.md`), `slides` will parse the code block and run the
`command to run` and pass in the text inside the code block as `stdin` to the
command. The entire code block will then be replace by the `stdout` of the
command you want to run.

```
~~~command to run
stdin
~~~
```

This allows you to:

  - Import text from other files with

```
~~~xargs cat
examples/import.md
~~~
```

  - Render GraphViz graphs with `graph-easy`

```
~~~graph-easy --as=boxart
[ A ] -> [ B ]
~~~
```

  - A lot more...

### Changed

- slides added to nixpkgs-unstable @ v0.3.0
- Added support for javascript code execution (using node)
- Added support for elixir code execution (thanks to @suzaku)
- hand Breaking: Removed ~~~ as a slide delimiter (for pre-processing), use --- always instead.
- Code block execution results are no longer rendered as Markdown. (thanks to @suzaku)
- Fix bug to be able to parse code blocks without trailing new lines. (thanks to @suzaku)

## [0.3.0-1] - 2021-06-21

### Added

- Support for Live Slides Update by [@sibprogrammer](https://github.com/sibprogrammer)

### Changed

- When there is a code block on the current slide, you can press
  `ctrl+e` to execute it and the output will display as virtual
  text on the slide at the end. Supported languages are bash, ruby,
  python, and go.

## [0.2.0-1] - 2021-06-13

### Added

- Execute code blocks for supported languages (bash, go, ruby, python)
- User customizable themes.

## [0.1.2-1] - 2021-06-09

### Added

- Allows users to pipe in slides from `stdin` which allows for
  `curl`ing remote slides and presenting them as well as piping
  multiple files into one (with `cat`) and much more.
- Allow users to specify any chroma supported theme instead of
  manually specifying colors.

### Fixed

- Fix `go vet ./...` Redefinition
  - https://github.com/maaslalani/slides/issues/14
- Fix the displayed date format
  - https://github.com/maaslalani/slides/issues/11

### AUR

#### Fixed

- Added `check()` back into the build.

#### Added

- Added this changelog document.

## [0.1.1-3] - 2021-06-09

### AUR

#### Added

- Added note in PKGBUILD about broken `check()` functionality due to
  https://github.com/maaslalani/slides/issues/14

## [0.1.1-2] - 2021-06-08

### AUR

#### Changed

- Fixed declared PKGBUILD dependencies.

## [0.1.1-1] - 2021-06-07

- 0e97b0a Merge pull request #10 from meowgorithm/bump-libs
- 5e39ade Update deprecated method of entering the altscreen
- e90da58 Update bubbletea/bubbles/glamour/lipgloss dependencies
- 6672f28 Update README.md
- 93ccd25 Internal API

## [0.1.0] - 2021-06-06

- 22b6fa2 go 1.16
- 6699e8a Create goreleaser.yml
- 95634ae Merge pull request #6 from sibprogrammer/bugfix-slide-separator
- 2489fac Merge pull request #8 from sibprogrammer/bugfix-slide-numbers
- 4e94e57 Merge pull request #4 from sibprogrammer/bugfix-makefile-errors
- a108f30 Fix #7 Display the correct number of slides and current one
- 0a15388 Fix #5 Allow to use triple dashes as a slide separator
- adb8dba Fix Makefile errors
- 47d2a87 embed styles
- 9b249b6 Revert "no need for user to specify theme.json"
- 7af1081 no need for user to specify theme.json
- e90002f Merge pull request #3 from angristan/render-error
- 17a5ed7 Show markdown rendering error to user
- cb40fa9 pr template
- 9480b07 Create CONTRIBUTING.md
- 9be3b16 Update issue templates
- 59326ce add space as next slides, swap down & up keys
- 1c6b5df Add credits
- 0f1ebff remove double import
- ffca702 moar
- eceb2c4 lil more error handling
- 44cfcf6 Remove hardcoded values
- babdab1 Move demo to top
- 6ed3fe6 Add readme.md
- 0c87800 Create makefile
- 1cf7d3f Create license
- debbccc theme.json
- 20c68ad JoinVertical
- 5bcb013 progress
- d27e870 WIP
- 39df02c Markdown
- 6fc439b Initial commit

