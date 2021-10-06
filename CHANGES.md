# Package ``supersmoother`` Change Log

## Version 0.4

- Ensure compatibility with Python 3.6 and Numpy 1.12

## Version 0.3.2

- Fix installation issue [PR#3](https://github.com/jakevdp/supersmoother/pull/3)

## Version 0.3.1

- Bug: assertion error was raised when period=0 was passed

## Version 0.3

New Features:

- Implement periodic smoothing

Bug Fixes:

- Fixed some issues with NaNs in corner cases of variable span smoothing

## Version 0.2

New Features:

- Implement bass enhancement
- Update example notebook with bass enhancement
- More complete unit test coverage

Bug Fixes:

- Algorithmic fix: previous version was not correctly interpolating in the last step of the supersmoother.

### Version 0.2.1

Bug fix release:

- Add tests and fix minor corner cases in utils
- By default, use fast rather than slow method for supersmoother


## Version 0.1

Initial Release

- Implementations of ``LinearSmoother`` and ``MovingAverageSmoother``
- Implementation of ``SuperSmoother``

### Version 0.1.1

Bug fix release:

- Fix ``setup.py`` and ``setup.cfg``
- Add installation documentation

### Version 0.1.2

Bug fix release:

- Validate spans & prevent them from being negative