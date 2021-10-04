Changelog
=========

## 4.1.1 (2021-10-04)

### Bug fixes

* Fix error in ASGI middleware if the ASGI `client` is None
  [#296](https://github.com/bugsnag/bugsnag-python/pull/296)

## 4.1.0 (2021-06-23)

### Enhancements

* Add support for breadcrumbs. These are short log statements that are attached to error reports to help diagnose what events led to the error. [See the docs for more information](https://docs.bugsnag.com//platforms/python/other/customizing-breadcrumbs/).
  [#290](https://github.com/bugsnag/bugsnag-python/pull/290)

### Bug fixes

* Apply filtering with `params_filters` to bytes, not just strings
  [Matt Bachmann](https://github.com/Bachmann1234)
  [#267](https://github.com/bugsnag/bugsnag-python/pull/267)

## 4.0.3 (2021-04-28)

### Bug fixes

* Fixed an issue with `ContextVar` backport for Python 3.5 and 3.6
  [Michael J.T. O'Kelly](https://github.com/mokelly)
  [#254](https://github.com/bugsnag/bugsnag-python/pull/254)

## 4.0.2 (2020-12-03)

### Bug fixes

* Fixed an issue preventing code being fetched from files in the project root but not in the PWD
  [#246](https://github.com/bugsnag/bugsnag-python/pull/246)

## 4.0.1 (2020-10-06)

### Bug fixes

* Fix issue where types were not packaged with the library

## 4.0.0 (2020-10-01)

This is a major release which adds new features while removing previously
deprecated portions of the library. For a guide to upgrading your existing
codebase, see [the upgrade guide](UPGRADING.md).

### Breaking Changes

The minimum supported Python version is now 3.5. Older versions of Python are
now at
[end-of-life](https://docs.python.org/devguide/#status-of-python-branches).
Please upgrade.

* Added `__all__` lists throughout to indicate the boundaries of the public
  interface. This may affect your integration if using `import *`.

* Removed `Configuration.use_ssl` and `Configuration.get_endpoint()` in favor of
  including the protocol in `Configuration.endpoint`
* `Configuration.send_environment` is now `False` by default. Enable it as a
  part of your configuration to send the full request context (if any) as a part
  of each event.

* Removed `bugsnag.utils.ThreadLocals` as it has been superseded by the
  `contextvars` API
* Removed `bugsnag.utils.merge_dicts`, an unused helper function
* Removed `bugsnag.send_sessions`

### Deprecations

* Deprecated `bugsnag.notification.Notification` in favor of
  `bugsnag.event.Event` to better align with Bugsnag libraries on other
  platforms. The `Notification` class is functionally equivalent and will be
  removed in a future release.
* `Event.meta_data` has been renamed to `Event.metadata`
* `RequestConfiguration.meta_data` has been renamed to
  `RequestConfiguration.metadata`

### Enhancements

* Added a `request` property to `Event`. Events created by errors which occur in
  the HTTP request cycle (when using the integrations for Django, Flask, WSGI,
  or Tornado) will have the request object available. The request object can be
  used to add custom information to the Event which will be sent to Bugsnag. The
  request object itself is not serialized.
* Added type signatures throughout the library

* [WSGI] Use `X-Forwarded-For` header if present to determine the IP address
  used as the default user ID. The remote address remains available in the
  request metadata attached to the event.
  [Wolfgang Schnerring](https://github.com/wosc)
  [#133](https://github.com/bugsnag/bugsnag-python/pull/133)

## 3.9.0 (2020-08-27)

### Enhancements

* Support reporting exceptions thrown from threads using
  [`threading.excepthook`](https://docs.python.org/3.8/library/threading.html#threading.excepthook)
  [#218](https://github.com/bugsnag/bugsnag-python/pull/218)
* [Django] Capture errors which occur outside of the request/response middleware
  chain, like uncaught exceptions within 404 or 500 handlers.
  [#221](https://github.com/bugsnag/bugsnag-python/pull/221)

## 3.8.0 (2020-08-18)

### Enhancements

* Support forcing an individual event to be sent synchronously to Bugsnag.
  Given a configuration where asynchronous=True (the default setting), use
  `notify(ex, asynchronous=False)` to block until the event is delivered.
  [#207](https://github.com/bugsnag/bugsnag-python/pull/207)

* Support configuring app type, which is a searchable field on the Bugsnag
  dashboard. Set `Configuration.app_type` to add a `type` property to the app
  metadata of an event.
  [#212](https://github.com/bugsnag/bugsnag-python/pull/212)

* Support disabling automatic attachment of the request environment to events.
  Set `Configuration.send_environment` to `False` to remove the metadata.
  [#214](https://github.com/bugsnag/bugsnag-python/pull/214)

* [ASGI] Collect request enviroment in an "environment" metadata section
  [#214](https://github.com/bugsnag/bugsnag-python/pull/214)

### Fixes

* Warn for incorrectly typed configuration options
  [#211](https://github.com/bugsnag/bugsnag-python/pull/211)

* Warn if running under uWSGI without thread support
  [#215](https://github.com/bugsnag/bugsnag-python/pull/215)

* Fix missing reports from failed celery tasks when the worker would terminate
  prior to the event being sent to bugsnag
  [#207](https://github.com/bugsnag/bugsnag-python/pull/207)

* [Django] Fix missing event context when a route did not have a name. Routes
  without names will now use the namespace-qualified view function name.
  [#210](https://github.com/bugsnag/bugsnag-python/pull/210)

## 3.7.1 (2020-07-30)

### Fixes

* Ensure session counts on events do not increment with future events by copying
  the session information into each event
  [#201](https://github.com/bugsnag/bugsnag-python/pull/201)

* Fix erroneously delivered sessions when session tracking is disabled by
  release stages
  [#202](https://github.com/bugsnag/bugsnag-python/pull/202)

## 3.7.0 (2020-07-27)

### Enhancements

* Enable session tracking by default. This feature powers stability metrics on
  the Bugsnag dashboard.
  [#194](https://github.com/bugsnag/bugsnag-python/pull/194)

* Support reporting events from ASGI-based web servers and frameworks. See the
  [documentation](https://docs.bugsnag.com/platforms/python/asgi/) for more
  information about getting started.
  [#195](https://github.com/bugsnag/bugsnag-python/pull/195)

* [Django, Tornado] Add parsed JSON body content to events for requests with
  JSON content types. The body content can be filtered on the Bugsnag dashboard
  [#192](https://github.com/bugsnag/bugsnag-python/pull/192)

### Fixes

* Fix diagnostic data being swapped between contexts and attached to an
  unrelated Bugsnag event when using `asyncio` features
  [#199](https://github.com/bugsnag/bugsnag-python/pull/199)

## 3.6.1 (2020-06-04)

### Fixes

* WSGI middleware will no longer raise when given a badly encoded URL
  [#188](https://github.com/bugsnag/bugsnag-python/pull/188)

## 3.6.0 (2019-06-25)

### Enhancements

* Add Python version string to report and session payloads (device.runtimeVersions)
  [#179](https://github.com/bugsnag/bugsnag-python/pull/179)

### Fixes

* Ensure nested dicts are not truncated prematurely when checking for recursion
  due to over-aggressive object id matching
  [#181](https://github.com/bugsnag/bugsnag-python/pull/181)

## 3.5.2 (2019-03-15)

### Fixes

* Ensure `request` tab is attached to Flask requests when JSON data is malformed
  or otherwise cannot be read at crash time
  [#176](https://github.com/bugsnag/bugsnag-python/pull/176)

## 3.5.1 (2019-02-04)

### Fixes

* Ensure metadata keys are safely stringified before serialization
  [Brock Haywood](https://github.com/brockhaywood)
  [#163](https://github.com/bugsnag/bugsnag-python/pull/163)

* Remove non-essential packages from distribution
  [#173](https://github.com/bugsnag/bugsnag-python/pull/173)

## 3.5.0 (2018-12-13)

### Enhancements

* Separate middleware stacks, ensuring Bugsnag middleware is always run before
  user-added middleware, giving user callbacks full control over captured data.
  [#166](https://github.com/bugsnag/bugsnag-python/pull/166)


## 3.4.3 (2018-08-30)

### Fixes

* Speed up SanitizingJSONEncoder on large objects
  [#148](https://github.com/bugsnag/bugsnag-python/pull/148)
  [Jon Lund Steffensen](https://github.com/jonls)

* Add django.http.response.Http404 to default ignore_classes
  [#159](https://github.com/bugsnag/bugsnag-python/pull/159)
  [Bruno Alla](https://github.com/browniebroke)

* Remove dependency on dist_utils for modern python versions
  [#161](https://github.com/bugsnag/bugsnag-python/pull/161)
  [Chris Kuehl](https://github.com/chriskuehl)


## 3.4.2 (2018-03-07)

### Fixes

* Fix cases where parts of a payload could be erroneously trimmed as a recursive
  value
  [#147](https://github.com/bugsnag/bugsnag-python/pull/147)

* Apply payload filters to device and user metadata
  [#146](https://github.com/bugsnag/bugsnag-python/pull/146)

## 3.4.1 (2018-02-22)

### Fixes

* Ensure correct usage of `is_authenticated` in Django applications
  [#143](https://github.com/bugsnag/bugsnag-python/pull/143)

* Allow `exception` option to override a logged exception in handler callbacks
  [#141](https://github.com/bugsnag/bugsnag-python/pull/141/files)

## 3.4.0 (2018-01-09)

### Enhancements

* Add support for tracking sessions and overall crash rate by setting
  `auto_capture_sessions` in configuration options
  [Alex Moinet](https://github.com/Cawllec)
  [#135](https://github.com/bugsnag/bugsnag-python/pull/135)

## 3.3.0 (2017-11-02)

### Enhancements

* Adds support for Django 2.0
[Denis](https://github.com/overplumbum)
[#130](https://github.com/bugsnag/bugsnag-python/pull/130)

* Updates and improves Python examples
[#128](https://github.com/bugsnag/bugsnag-python/pull/128)


## 3.2.0 (2017-09-27)

### Enhancements

* Track difference between handled and unhandled exceptions
[#127](https://github.com/bugsnag/bugsnag-python/pull/127)


## 3.1.2 (2017-09-18)

### Enhancements

* Added flask example app
  [#122](https://github.com/bugsnag/bugsnag-python/pull/122)

* Added example for using celery with django
  [#124](https://github.com/bugsnag/bugsnag-python/pull/124)

* Added issue template
  [#125](https://github.com/bugsnag/bugsnag-python/pull/125)

### Bug fixes

* Fixed context being overridden in flask notifier
  [#123](https://github.com/bugsnag/bugsnag-python/pull/123)


## 3.1.1 (2017-06-08)

### Bug fixes

* Fix possible stack overflow when using a log handler and not specifying an
  API key
  [#120](https://github.com/bugsnag/bugsnag-python/pull/120)

* Fix `traceback_excludes_modules` when using compiled Python modules
  [Kobi Meirson](https://github.com/kobim)
  [#119](https://github.com/bugsnag/bugsnag-python/pull/119)


## 3.1.0 (2017-02-24)

### Enhancements

* Show request method for Django apps
  [Kyle Fuller](https://github.com/kylef)
  [#115](https://github.com/bugsnag/bugsnag-python/pull/115)

### Bug fixes

* Fix over-filtering of payload data when filters matched payload fields
  [#116](https://github.com/bugsnag/bugsnag-python/issues/116)
  [#117](https://github.com/bugsnag/bugsnag-python/pull/117)

## 3.0.0 (2016-10-31)

This is a major release adding a number of new features and deprecating some
lesser used parts of the library.

### Enhancements

* Add compatibility with Django 1.10
  [Jonny Pickett](https://github.com/jonnypickett)
  [#108](https://github.com/bugsnag/bugsnag-python/pull/108)

* Support customizing delivery and sending error reports using
  [requests](http://docs.python-requests.org/en/master/).

  The new `Delivery` class is a generic way of sending a serialized payload to
  Bugsnag. The `Configuration` class now has a `delivery` property which should
  be an instance of `Delivery`. By default, if requests is installed, reports
  are sent via `bugsnag.delivery.RequestsDelivery` rather than
  `bugsnag.delivery.UrllibDelivery`.

  To enforce using urllib2/urllib3, use `UrllibDelivery`:

  ```python
  from bugsnag.delivery import UrllibDelivery

  bugsnag.configure(delivery=UrllibDelivery())
  ```

  To use a custom `Delivery`:

  ```python
  from bugsnag.delivery import Delivery

  class SomeSpecialDelivery(Delivery):

      def deliver(self, config, payload):
          send_to_my_queue(config.get_endpoint(), config.proxy_host, payload)

  bugsnag.configure(delivery=SomeSpecialDelivery())
  ```

  [Graham Campbell](https://github.com/GrahamCampbell)
  [Delisa Mason](https://github.com/kattrali)
  [#86](https://github.com/bugsnag/bugsnag-python/pull/86)

* Support multiple clients in a single environment using `bugsnag.Client`. A new
  client can be initialized using a `Configuration` or options passed to
  `Client()`. By default, a client is installed as the system exception hook.
  To disable this behavior, set `install_sys_hook` to `False`.

  ```python
  client = Client(api_key='...')
  ```

  ```python
  config = Configuration(api_key='...')
  client = Client(config)
  ```
  [Kyle Fuller](https://github.com/kylef)
  [#101](https://github.com/bugsnag/bugsnag-python/pull/101)

* Support running a block of code within a client's context. Any exception
  raised will be reported.

  ```python
  with client.capture():
      raise Exception('an exception reported to Bugsnag then reraised')
  ```

  Specific types of exceptions can be captured by adding `exceptions` as a
  tuple.

  ```python
  with client.capture((TypeError,)):
      raise Exception('an exception which does not get captured')
  ```

  Additional options can be passed to th resulting error report, such as
  attached metadata or severity.

  ```python
  with client.capture(account_id='123', severity='info'):
      raise Exception('failed to validate record')
  ```

  Functions can be decorated to capture any exceptions thrown during execution.

  ```python
  @client.capture
  def foo():
      raise Exception('an exception passed to Bugsnag then reraised')

  @client.capture((TypeError,))
  def bar():
      raise Exception('an exception which does not get captured')

  @client.capture(test_slice='B')
  def baz():
      raise Exception('an exception passed to Bugsnag then reraised')
  ```

  [Kyle Fuller](https://github.com/kylef)
  [Delisa Mason](https://github.com/kattrali)
  [#101](https://github.com/bugsnag/bugsnag-python/pull/101)

* Support creating a log handler from a client, and forwarding logged messages
  to Bugsnag.

  ```python
  client = Client(api_key='...')
  logger = logging.getLogger(__name__)

  logger.addHandler(client.log_handler())
  ```

  Log messages can also be customized using additional information from the
  log record and callbacks:

  ```python
  client = Client(api_key='...')
  logger = logging.getLogger(__name__)
  handler = client.log_handler()

  def add_extra_info(record, options):
      if 'meta_data' not in options:
          options['meta_data'] = {}

      options['meta_data']['stats'] = {
        'account_id': record.account_id,
        'ab_test_slice': record.slice_name
      }

  handler.add_callback(add_extra_info)
  logger.addHandler(handler)
  ```

  `BugsnagHandler` argument `api_key` was deprecated as a part of this change.

  [Delisa Mason](https://github.com/kattrali)
  [#103](https://github.com/bugsnag/bugsnag-python/pull/103)

* Replace existing logging with a logger. Logs from bugsnag can now be
  controlled by setting the log level of `logging.getLogger('bugsnag')`.
  [Kyle Fuller](https://github.com/kylef)
  [#95](https://github.com/bugsnag/bugsnag-python/pull/95)

* Wrap non-Exception objects passed to `notify()` in a `RuntimeError`
  [Delisa Mason](https://github.com/kattrali)
  [#98](https://github.com/bugsnag/bugsnag-python/pull/98)

### Bug fixes

* Fix proxy configuration setting a global opener
  [Kyle Fuller](https://github.com/kylef)
  [#97](https://github.com/bugsnag/bugsnag-python/pull/97)

* Fix dropped reports during fatal errors occuring before threads join
  [Delisa Mason](https://github.com/kattrali)
  [#99](https://github.com/bugsnag/bugsnag-python/pull/99)

* Fix missing error reports when invoking a function decorated with a Bugsnag
  client using the wrong arguments
  [Delisa Mason](https://github.com/kattrali)
  [#110](https://github.com/bugsnag/bugsnag-python/pull/110)


## 2.5.2 (2016-08-19)

### Enhancements

* Log exception message when notifications fail to send

### Bug Fixes

* Improve recursion handling in metadata parsing

## 2.5.1 (2016-08-12)

### Bug Fixes

* Fix setting `api_key` and `grouping_hash` from `notify()` or `before_notify()`
* Fix merge behavior when overriding metadata from `notify()`

## 2.5.0 (2016-06-14)

### Enhancements

* Add support for proxied connections to Bugsnag
  [Tomas Edwardsson](https://github.com/tomas-edwardsson)
  [#79](https://github.com/bugsnag/bugsnag-python/pull/79)

### Bug Fixes

* Fix an issue where the package version is marked as "unknown"
  [Kyle Fuller](https://github.com/kylef)
  [#83](https://github.com/bugsnag/bugsnag-python/pull/83)

* Fix an issue where request metadata is not sent when not using
  SessionMiddleware in Django

## 2.4.0 (2016-01-18)

### Enhancements

* Add synchronous upload mode
  [Tuomas Peippo](https://github.com/tume)
  [#67](https://github.com/bugsnag/bugsnag-python/pull/67)
  [#71](https://github.com/bugsnag/bugsnag-python/pull/71)

* Add stacktraces to middleware exception logging
  [Delisa Mason](https://github.com/kattrali)
  [#77](https://github.com/bugsnag/bugsnag-python/pull/77)

* Remove cookie logging from WSGI and Flask configurations
  [Delisa Mason](https://github.com/kattrali)

### Bug Fixes

* Remove use of deprecated `request.REQUEST` attribute in favor of `GET`/`POST`
  [Delisa Mason](https://github.com/kattrali)
  [#69](https://github.com/bugsnag/bugsnag-python/pull/69)

* Fix user attribute logging for Django custom authentication setups
  [Delisa Mason](https://github.com/kattrali)
  [#76](https://github.com/bugsnag/bugsnag-python/pull/76)
  [#78](https://github.com/bugsnag/bugsnag-python/pull/78)


2.3.1
-----
-   Redact HTTP_COOKIE and HTTP_AUTHORIZATION by default

2.3.0
-----
-   Add add_metadata_tab method
-   Fix Flask integration overriding user information

2.2.0
-----
-   Optionally send a snippet of code along with each frame in the stacktrace
-   Default to https:// for reports.


2.1.0
-----
-   Allow custom meta-data when using the Bugsnag log handler (thanks @lwcolton!)
-   Update flask support for python 3.4 (thanks @stas!)
-   Show json post body for flask requests (thanks @stas!)

2.0.2
-----
-   Better logging support
-   More robustness for notifies during shutdown
-   Call close() on WSGI apps that are only iterable, not iterators

2.0.1
-----
-   Now works on Python 3.2

2.0.0
-----
-   Read request-local settings in bugsnag.notify
-   Add support for before_notify callbacks
-   Avoid truncating values when unnecessary
-   Send user data to bugsnag for django

1.5.0
-----
-   Send 'severity' of error to Bugsnag
-   Add 'payloadVersion'

1.4.0
-----
-   Make params_filter configuration work

1.3.2
-----
-   Allow custom groupingHash

1.3.1
-----
-   Send hostname to Bugsnag

1.3.0
-----
-   Added celery integration

1.2.7
-----
-   Configure the log handler in the constructor for when called from cron job.

1.2.6
-----
-   Read the API key from the environment for Heroku users
-   Best guess a project_root for a sensible default

1.2.5
-----
-   Add blinker as a dependency, makes using Bugsnag with Flask easier

1.2.4
-----
-   Removed automatic userId population from username in django, to avoid a
    database lookup

1.2.3
-----
-   Fix cookies bug in Tornado apps

1.2.2
-----
-   Added support for Tornado apps

1.2.1
-----
-   Additional protection for bad string encodings

1.2.0
-----
-   Fixed issue when non-unicode data was passed in metadata
-   Filters are now applied for substring matches ("password" will now also
    match "confirm_password")
-   Ignore django.http.Http404 exceptions by default when using
    django middleware

1.1.2
-----
-   Log trace when HTTP exception

1.1.1
------
-   Log the trace when theres an exception notifying
