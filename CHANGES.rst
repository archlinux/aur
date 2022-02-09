Changelog
=========

1.1.3 (2016-11-22)
------------------

* Added datetime attribute to ``SensorValue``.

* Fixed strange problem in ``Library`` where the class itself could
  sometimes be None in ``__del__``.


1.1.2 (2015-06-24)
------------------

* Added option to ``Library`` to make it possible to select if strings should
  be decoded or not.

* Made tellcore_tool not decode strings (i.e. convert to unicode) when running
  under Python 2.x to avoid unicode errors when printing non ascii characters.


1.1.1 (2015-05-01)
------------------

* Fixed a bug that made tellcore_tool not work with Python 3.x.


1.1.0 (2014-11-19)
------------------

* The callback dispatcher is no longer global, but tied to a ``Library``
  instance. Applications wishing to use callbacks must now pass an explicit
  dispatcher instance to the ``TelldusCore`` constructor.


1.0.4 (2014-11-05)
------------------

* Made ``last_sent_value`` return an int instead of string.


1.0.3 (2014-02-02)
------------------

* Work around crash in Telldus Core (< v2.1.2) when re-initalizing the library
  after ``tdClose``.


1.0.2 (2014-01-28)
------------------

* Packaging fixes.


1.0.1 (2014-01-26)
------------------

* Added ``AsyncioCallbackDispatcher`` class for integrating callbacks with the
  new event loop available in Python 3.4 (asyncio).

* Include tools from bin/ when installing.


1.0.0 (2014-01-09)
------------------

* Added high level support for device groups in the form of the new class
  ``DeviceGroup``.

* More complete documentation.

* Removed the methods process_callback and process_pending_callbacks from
  ``TelldusCore``. Instead, callback_dispatcher is now a public attribute of
  ``TelldusCore`` and the default callback dispatcher
  ``QueuedCallbackDispatcher`` implements the two methods instead.


0.9.0 (2014-01-03)
------------------

* Telldus functions that used to return bool (``tdSetName``, ``tdSetProtocol``,
  ``tdSetModel``, ``tdSetDeviceParameter`` and ``tdRemoveDevice``) now raise an
  exception instead of returning False.

* Support for rain- and windsensors.

* Include data type in ``SensorValue``.


0.8.0 (2013-08-11)
------------------

* Improved callback handling to simplify integration with different event
  loops. Parameter conversion is now done in the library code and the
  adaptation to different event loops is done by a simple callback dispatch
  class. The default dispatcher (when using ``TelldusCore``) is still done
  using a queue.

* New documentation for parts of the package. Can be read online at
  https://tellcore-py.readthedocs.org/.

* Fix problem with strings and python 3 (issue #2).


0.1.0 (2013-06-26)
------------------

* First release.
