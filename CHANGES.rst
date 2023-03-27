1.11 (2022-01-02)
=================

- Drop support for Python 2.7, 3.4, 3.5, and 3.6.

- Add support/testing for Python 3.10, and 3.11.

- Explicitly require ``reload_interval`` set greater than ``0`` to avoid
  spinning the CPU needlessly.

1.10.3 (2021-05-13)
===================

- Support Python 3.8 and 3.9.

- Fix an issue with bare ``.pyc`` files in the source folder causing unhandled
  exceptions.
  See https://github.com/Pylons/hupper/pull/69

- Fix issues with using the Watchman file monitor on versions newer than
  Watchman 4.9.0. This fix modifies ``hupper`` to use Watchman's
  ``watch-project`` capabilities which also support reading the
  ``.watchmanconfig`` file to control certain properties of the monitoring.
  See https://github.com/Pylons/hupper/pull/70

1.10.2 (2020-03-02)
===================

- Fix a regression that caused SIGINT to not work properly in some situations.
  See https://github.com/Pylons/hupper/pull/67

1.10.1 (2020-02-18)
===================

- Performance improvements when using Watchman.

1.10 (2020-02-18)
=================

- Handle a ``SIGTERM`` signal by forwarding it to the child process and
  gracefully waiting for it to exit. This should enable using ``hupper``
  from within docker containers and other systems that want to control
  the reloader process.

  Previously the ``SIGTERM`` would shutdown ``hupper`` immediately, stranding
  the worker and relying on it to shutdown on its own.

  See https://github.com/Pylons/hupper/pull/65

- Avoid acquiring locks in the reloader process's signal handlers.
  See https://github.com/Pylons/hupper/pull/65

- Fix deprecation warnings caused by using the ``imp`` module on newer
  versions of Python.
  See https://github.com/Pylons/hupper/pull/65

1.9.1 (2019-11-12)
==================

- Support some scenarios in which user code is symlinked ``site-packages``.
  These were previously being ignored by the file monitor but should now
  be tracked.
  See https://github.com/Pylons/hupper/pull/61

1.9 (2019-10-14)
================

- Support ``--shutdown-interval`` on the ``hupper`` CLI.
  See https://github.com/Pylons/hupper/pull/56

- Support ``--reload-interval`` on the ``hupper`` CLI.
  See https://github.com/Pylons/hupper/pull/59

- Do not choke when stdin is not a TTY while waiting for changes after a
  crash. For example, when running in Docker Compose.
  See https://github.com/Pylons/hupper/pull/58

1.8.1 (2019-06-12)
==================

- Do not show the ``KeyboardInterrupt`` stacktrace when killing ``hupper``
  while waiting for a reload.

1.8 (2019-06-11)
================

- If the worker process crashes, ``hupper`` can be forced to reload the worker
  by pressing the ``ENTER`` key in the terminal instead of waiting to change a
  file.
  See https://github.com/Pylons/hupper/pull/53

1.7 (2019-06-04)
================

- On Python 3.5+ support recursive glob syntax in ``reloader.watch_files``.
  See https://github.com/Pylons/hupper/pull/52

1.6.1 (2019-03-11)
==================

- If the worker crashes immediately, sometimes ``hupper`` would go into a
  restart loop instead of waiting for a code change.
  See https://github.com/Pylons/hupper/pull/50

1.6 (2019-03-06)
================

- On systems that support ``SIGKILL`` and ``SIGTERM`` (not Windows), ``hupper``
  will now send a ``SIGKILL`` to the worker process as a last resort. Normally,
  a ``SIGINT`` (Ctrl-C) or ``SIGTERM`` (on reload) will kill the worker. If,
  within ``shutdown_interval`` seconds, the worker doesn't exit, it will
  receive a ``SIGKILL``.
  See https://github.com/Pylons/hupper/pull/48

- Support a ``logger`` argument to ``hupper.start_reloader`` to override
  the default logger that outputs messages to ``sys.stderr``.
  See https://github.com/Pylons/hupper/pull/49

1.5 (2019-02-16)
================

- Add support for ignoring custom patterns via the new ``ignore_files``
  option on ``hupper.start_reloader``. The ``hupper`` cli also supports
  ignoring files via the ``-x`` option.
  See https://github.com/Pylons/hupper/pull/46

1.4.2 (2018-11-26)
==================

- Fix a bug prompting the "ignoring corrupted payload from watchman" message
  and placing the file monitor in an unrecoverable state when a change
  triggered a watchman message > 4096 bytes.
  See https://github.com/Pylons/hupper/pull/44

1.4.1 (2018-11-11)
==================

- Stop ignoring a few paths that may not be system paths in cases where the
  virtualenv is the root of your project.
  See https://github.com/Pylons/hupper/pull/42

1.4 (2018-10-26)
================

- Ignore changes to any system / installed files. This includes mostly
  changes to any files in the stdlib and ``site-packages``. Anything that is
  installed in editable mode or not installed at all will still be monitored.
  This drastically reduces the number of files that ``hupper`` needs to
  monitor.
  See https://github.com/Pylons/hupper/pull/40

1.3.1 (2018-10-05)
==================

- Support Python 3.7.

- Avoid a restart-loop if the app is failing to restart on certain systems.
  There was a race where ``hupper`` failed to detect that the app was
  crashing and thus fell into its restart logic when the user manually
  triggers an immediate reload.
  See https://github.com/Pylons/hupper/pull/37

- Ignore corrupted packets coming from watchman that occur in semi-random
  scenarios. See https://github.com/Pylons/hupper/pull/38

1.3 (2018-05-21)
================

- Added watchman support via ``hupper.watchman.WatchmanFileMonitor``.
  This is the new preferred file monitor on systems supporting unix sockets.
  See https://github.com/Pylons/hupper/pull/32

- The ``hupper.watchdog.WatchdogFileMonitor`` will now output some info
  when it receives ulimit or other errors from ``watchdog``.
  See https://github.com/Pylons/hupper/pull/33

- Allow ``-q`` and ``-v`` cli options to control verbosity.
  See https://github.com/Pylons/hupper/pull/33

- Pass a ``logger`` value to the ``hupper.interfaces.IFileMonitorFactory``.
  This is an instance of ``hupper.interfaces.ILogger`` and can be used by
  file monitors to output errors and debug information.
  See https://github.com/Pylons/hupper/pull/33

1.2 (2018-05-01)
================

- Track only Python source files. Previously ``hupper`` would track all pyc
  and py files. Now, if a pyc file is found then the equivalent source file
  is searched and, if found, the pyc file is ignored.
  See https://github.com/Pylons/hupper/pull/31

- Allow overriding the default monitor lookup by specifying the
  ``HUPPER_DEFAULT_MONITOR`` environment variable as a Python dotted-path
  to a monitor factory. For example,
  ``HUPPER_DEFAULT_MONITOR=hupper.polling.PollingFileMonitor``.
  See https://github.com/Pylons/hupper/pull/29

- Backward-incompatible changes to the
  ``hupper.interfaces.IFileMonitorFactory`` API to pass arbitrary kwargs
  to the factory.
  See https://github.com/Pylons/hupper/pull/29

1.1 (2018-03-29)
================

- Support ``-w`` on the CLI to watch custom file paths.
  See https://github.com/Pylons/hupper/pull/28

1.0 (2017-05-18)
================

- Copy ``sys.path`` to the worker process and ensure ``hupper`` is on the
  ``PYTHONPATH`` so that the subprocess can import it to start the worker.
  This fixes an issue with how ``zc.buildout`` injects dependencies into a
  process which is done entirely by ``sys.path`` manipulation.
  See https://github.com/Pylons/hupper/pull/27

0.5 (2017-05-10)
================

- On non-windows systems ensure an exec occurs so that the worker does not
  share the same process space as the reloader causing certain code that
  is imported in both to not ever be reloaded. Under the hood this was a
  significant rewrite to use subprocess instead of multiprocessing.
  See https://github.com/Pylons/hupper/pull/23

0.4.4 (2017-03-10)
==================

- Fix some versions of Windows which were failing to duplicate stdin to
  the subprocess and crashing.
  https://github.com/Pylons/hupper/pull/16

0.4.3 (2017-03-07)
==================

- Fix pdb and other readline-based programs to operate properly.
  See https://github.com/Pylons/hupper/pull/15

0.4.2 (2017-01-24)
==================

- Pause briefly after receiving a SIGINT to allow the worker to kill itself.
  If it does not die then it is terminated.
  See https://github.com/Pylons/hupper/issues/11

- Python 3.6 compatibility.

0.4.1 (2017-01-03)
==================

- Handle errors that may occur when using watchdog to observe non-existent
  folders.

0.4.0 (2017-01-02)
==================

- Support running any Python module via ``hupper -m <module>``. This is
  equivalent to ``python -m`` except will fully reload the process when files
  change. See https://github.com/Pylons/hupper/pull/8

0.3.6 (2016-12-18)
==================

- Read the traceback for unknown files prior to crashing. If an import
  crashes due to a module-scope exception the file that caused the crash would
  not be tracked but this should help.

0.3.5 (2016-12-17)
==================

- Attempt to send imported paths to the monitor process before crashing to
  avoid cases where the master is waiting for changes in files that it never
  started monitoring.

0.3.4 (2016-11-21)
==================

- Add support for globbing using the stdlib ``glob`` module. On Python 3.5+
  this allows recursive globs using ``**``. Prior to this, the globbing is
  more limited.

0.3.3 (2016-11-19)
==================

- Fixed a runtime failure on Windows 32-bit systems.

0.3.2 (2016-11-15)
==================

- Support triggering reloads via SIGHUP when hupper detected a crash and is
  waiting for a file to change.

- Setup the reloader proxy prior to importing the worker's module. This
  should allow some work to be done at module-scope instead of in the
  callable.

0.3.1 (2016-11-06)
==================

- Fix package long description on PyPI.

- Ensure that the stdin file handle is inheritable incase the "spawn" variant
  of multiprocessing is enabled.

0.3 (2016-11-06)
================

- Disable bytecode compiling of files imported by the worker process. This
  should not be necessary when developing and it was causing the process to
  restart twice on Windows due to how it handles pyc timestamps.

- Fix hupper's support for forwarding stdin to the worker processes on
  Python < 3.5 on Windows.

- Fix some possible file descriptor leakage.

- Simplify the ``hupper.interfaces.IFileMonitor`` interface by internalizing
  some of the hupper-specific integrations. They can now focus on just
  looking for changes.

- Add the ``hupper.interfaces.IFileMonitorFactory`` interface to improve
  the documentation for the ``callback`` argument required by
  ``hupper.interfaces.IFileMonitor``.

0.2 (2016-10-26)
================

- Windows support!

- Added support for `watchdog <https://pypi.org/project/watchdog/>`_ if it's
  installed to do inotify-style file monitoring. This is an optional dependency
  and ``hupper`` will fallback to using polling if it's not available.

0.1 (2016-10-21)
================

- Initial release.
