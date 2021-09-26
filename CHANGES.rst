.. -*- coding: utf-8 -*-

Changelog
=========

1.3 (2017-10-31)
----------------

- Fix flake8 errors on this package and enforce them on CI.
  [alexmuller]

1.2.2.dev0 (2017-10-22)
-----------------------

- Use the ast module to parse the code and ensure no false positives are found.
  [alexmuller]

1.2.1 (2017-07-24)
------------------
- Fix UnicodeDecodeError if system locale is not UTF-8.
  [sshishov]

1.2 (2017-05-12)
----------------
- added support for sublimetext (stdin/filename handling).
  [iham]

- Release as universal wheels.
  [gforcada]

- Only test against Python 2.7, 3.5 and 3.6.
  It most probably works on earlier versions of 2.x and 3.x but it's pointless to test on them as well.
  [gforcada]

1.1 (2016-10-26)
----------------
- Fix compatibility with flake8 3.
  [gforcada]

- Require flake8 > 3.0.
  [gforcada]

1.0 (2016-02-27)
----------------
- Warn if using xmlconfig.file, self.loadZCML is the preferred option.
  [gforcada]

- Avoid false reports by suffixing an opening parenthesis on all methods.
  [gforcada]

- Add decorators from zope.interface and zope.component.
  [gforcada]

0.2 (2016-01-20)
----------------
- Suggest to use AccessControl and zope.interface decorators.
  [gforcada]

0.1 (2015-09-17)
----------------
- Initial release.
  [gforcada]

- Create the flake8 plugin per se.
  [gforcada]

