Changelog
---------

Important changes are emphasized.

Unreleased
^^^^^^^^^^

23.0.0
^^^^^^

- Add support for Python 3.13 and 3.14
- Drop support for EOL Python 3.8 and 3.9
- Add ``--dry-run`` to check how many bytes would be billed, but don't actually run query

22.0.0
^^^^^^

- Add support for Python 3.11 and 3.12
- Drop support for EOL Python 3.7
- Add ``__main__.py`` to enable ``python -m pypinfo``
- Add ``ci`` field: show how many installs were from a CI

21.0.0
^^^^^^

- Drop support for EOL Python 3.6
- Add support for version matching
- Update ``--where`` not to discard ``project`` / ``installer`` filtering
- Fix query when only aggregate fields are requested
- Run Mypy on all files
- Fix ``twine check`` errors and warnings
- Switch build backend to Hatchling

20.0.0
^^^^^^

- Add support for Python 3.10
- Add ``-h`` as help option
- Treat and validate numeric CLI arguments as numbers
- Replace appdirs with platformdirs
- Fix ResourceWarnings

19.0.0
^^^^^^

- Update dataset to the new Google-hosted location

18.0.1
^^^^^^

- Fix usage of date ranges

18.0.0
^^^^^^

- Use the clustered data table and standard SQL for lower query costs

17.0.0
^^^^^^

- Add support for libc & libc-version fields

16.0.2
^^^^^^

- Update TinyDB and Tinyrecord dependencies for compatibility

16.0.1
^^^^^^

- Pin TinyDB<4, Tinyrecord does not yet support TinyDB v4

16.0.0
^^^^^^

- Allow yyyy-mm[-dd] ``--start-date`` and ``--end-date``:

  - A yyyy-mm ``--start-date`` defaults to the first day of the month
  - A yyyy-mm ``--end-date`` defaults to the last day of the month

- Add ``--month`` as a shortcut to ``--start-date`` and ``--end-date``
  for a single yyyy-mm month

- Add ``--verbose`` option to print credentials location

- Update installation instructions

- Enforce ``black`` code style

15.0.0
^^^^^^

- Allow yyyy-mm-dd dates
- Add ``--all`` option, default to only showing downloads via pip
- Add download total row

14.0.0
^^^^^^

- Added new ``file`` field!

13.0.0
^^^^^^

- Added ``last_update`` JSON key, which is a UTC timestamp.

12.0.0
^^^^^^

- **Breaking:** JSON output is now a mapping with keys ``rows``, which is all the
  data that was previously outputted, and ``query``, which is relevant metadata.
- Increased the resolution of percentages.

11.0.0
^^^^^^

- Fixed JSON output.

10.0.0
^^^^^^

- Fixed custom field ordering.

9.0.0
^^^^^

- Added new BigQuery usage stats.
- Lowered the default number of results to ``10`` from ``20``.
- Updated examples.
- Fixed table formatting regression.

8.0.0
^^^^^

- Updated ``google-cloud-bigquery`` dependency.

7.0.0
^^^^^

- Output table is now in Markdown format for easy copying to GitHub issues and PRs.

6.0.0
^^^^^

- Updated ``google-cloud-bigquery`` dependency.

5.0.0
^^^^^

- Numeric output (non-json) is now prettier (thanks `hugovk <https://github.com/hugovk>`_)
- You can now filter results for only pip installs with the ``--pip`` flag
  (thanks `hugovk <https://github.com/hugovk>`_)

4.0.0
^^^^^

- ``--order`` now works with all fields (thanks `Brian Skinn <https://github.com/bskinn>`_)
- Updated installation docs (thanks `Brian Skinn <https://github.com/bskinn>`_)

3.0.1
^^^^^

- Fix: project names are now normalized to adhere to
  `PEP 503 <https://www.python.org/dev/peps/pep-0503>`_.

3.0.0
^^^^^

- **Breaking:** ``--json`` option is now just a flag and prints output as prettified JSON.

2.0.0
^^^^^

- Added ``--json`` path option.

1.0.0
^^^^^

- Initial release

.. _PyPI: https://pypi.org
