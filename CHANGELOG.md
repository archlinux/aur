# Changelog

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

