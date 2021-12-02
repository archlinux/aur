1.8 (2021-11-24)
================

- Fix coroutine detection on partials.

- Fix a bug with python3.10. gather no longer accept a loop


1.7 (2021-09-01)
================

- Fix: set result iif future is not done


1.6 (2021-05-19)
================

- Do not release py2 wheel


1.5 (2021-05-19)
================

- Use async/await syntax everywhere

- Drop py27 and py3.4 support


1.4 (2021-02-13)
================

- Use async/await syntax in README


1.3 (2018-10-28)
================

- Now accepts TZ for croniter

- Now accepts arguments for func

- Drop py3.3 support


1.2 (2017-12-05)
================

- Remove print() statement


1.1 (2017-11-11)
================

- Fixed #7: Incorrect cron calculation in croniter when DST changed.


1.0 (2017-10-31)
================

- First stable release

- Update classifiers to show it support latest py versions


0.7 (2017-09-01)
================

- fixed issue 6: stop before first run wont work


0.6 (2016-10-18)
================

- allow to use python -m aiocron


0.5 (2016-03-31)
================

- Fix: Initialize cron with a correct tzinfo


0.4 (2015-10-21)
================

-  Fix contstructor with func not None and minor changes


0.3 (2015-05-14)
================

- Fix installation faillure on py3


0.2 (2015-02-23)
================

Allow to use crontab as a timer


0.1 (2015-02-22)
================

Initial release
