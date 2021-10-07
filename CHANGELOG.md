# Changelog


## Unreleased

### Fixes

* Remove writer workaround from #61 with asyncio. [J. Nick Koston]


## v0.7.5 (2021-09-19)

### Features

* Improve model detection. [J. Nick Koston]

### Fixes

* Fix aio disconnect handling. [J. Nick Koston]


## v0.7.4 (2021-08-26)

### Features

* Add support for setting capabilities from external discovery. [J. Nick Koston]

* Add support for YLDD05YL aka strip6. [J. Nick Koston]

### Fixes

* Increase asyncio timeout to 15 seconds. [J. Nick Koston]


## v0.7.2 (2021-08-07)

### Fixes

* Improve async handling on connection errors. [starkillerOG]


## v0.7.0 (2021-08-04)

### Features

* Add asyncio support. [J. Nick Koston]

* Add support for Yeelight GU10 dimmable (YLDP004) [Stavros Korokithakis]

### Fixes

* Update _last_properties more consistently. [starkillerOG]


## v0.6.2 (2021-05-02)

### Features

* Add support for bslamp3, ceiling18, ceiling24, ct2, lamp1, strip2. [root]

* Add support for ceila (YLXD76YL) [zvldz]

### Fixes

* Fix an infinite recursion issue. [Stavros Korokithakis]

* Add support for strip4 (YLDD03YL) [zvldz]


## v0.6.1 (2021-04-20)

### Fixes

* Add support for lamp15  (YLTD003) [Caleb Mah]


## v0.6.0 (2021-04-12)

### Features

* Add lamp4. [Stavros Korokithakis]

* Add SSDP fallback to the get_props method. [Johnnie Ho]

* Drop support for anything less than Python 3.4 (including 2.x) [Stavros Korokithakis]

* Add the color4 bulb specs (closes #60) [Stavros Korokithakis]

* Add Yeelight XianYu C2001 Ceiling Light (C2001C550) specs. [Sebastian Muszynski]

* Add Yeelight Crystal Pendant Light (Meteorite, YLDL01YL) specs. [Sebastian Muszynski]

* Add ceiling6 (YLXD08YL) and ceiling19 (YLXD49YL) specs. [Юрий Аузинь]

* Add ceiling15 (YLXD42YL) specs. [Stavros Korokithakis]

### Fixes

* Send a space in a new packet, to work around "Connection closed" errors. [Stavros Korokithakis]

* Send newline in new packet, as some version bulbs expect that. [Stavros Korokithakis]


## v0.5.4 (2020-10-08)

### Features

* Add update notification functionality (implements #4) [Xiaonan Shen]

* Add manufacturer's default and other flows. [Stavros Korokithakis]

### Fixes

* Fix get_ip_address portability by using the ifaddr library. [Greg V]

* Fix flow preset names. [Stavros Korokithakis]


## v0.5.3 (2020-06-15)

### Features

* Add ct_bulb bulb type. [Stavros Korokithakis]


## v0.5.1 (2020-02-14)

### Features

* Add get_known_models method. [Michał Ciemięga]


## v0.5.0 (2019-04-15)

### Features

* Support the "set scene" API call. [Michał Ciemięga]

### Fixes

* Obey model's min/max when setting the bulb's color temperature. [Stavros Korokithakis]

* Add night light support to ceiling1 and ceiling2. [Stavros Korokithakis]

* Fix the color temperature of the ceiling light. [Stavros Korokithakis]


## v0.4.4 (2019-03-19)

### Fixes

* Ignore exception more specifically. [Stavros Korokithakis]


## v0.4.3 (2018-09-06)

### Fixes

* Fix crash when trying to use BulbType early. [Stavros Korokithakis]


## v0.4.1 (2018-06-25)

### Features

* Provide individual color temperature range per model (#7) [Sebastian Muszynski]

* Add WhiteTemp BulbType (#8) [quthla]

* Allow multicast interface selection in discover_bulbs() (#6) [Luca Zorzi]


## v0.4.0 (2018-03-10)

### Features

* Add support for moonlight mode. [Stavros Korokithakis]

### Fixes

* Fix bulb type detection (#5) [Sebastian Muszynski]


## v0.3.3 (2017-09-18)

### Fixes

* Make the requested properties a parameter of get_properties() and remove flow_params by default. [Stavros Korokithakis]

* Set additional socket options to properly call multicast (#4) [filozof71]


## v0.3.2 (2017-06-20)

### Fixes

* Use enum-compat instead of enum34. [Stavros Korokithakis]


## v0.3.0 (2017-05-10)

### Features

* Add additional presets. [Stavros Korokithakis]


## v0.2.3 (2017-04-30)

### Fixes

* Allow toggling to update the local properties cache. [Stavros Korokithakis]

* Force cache population when activating music mode. [Teemu R]


## v0.2.2 (2017-02-10)

### Fixes

* Pass 0 for the port number in music mode so the OS picks a port at random. [Stavros Korokithakis]


## v0.2.0 (2017-01-19)

### Features

* Add discovery (closes #3). [Stavros Korokithakis]


## v0.1.0 (2017-01-16)

### Fixes

* Abort with an error if the bulb closes the connection (fixes #5). [Stavros Korokithakis]

* Flow API improvements (#3) [Teemu R]


## v0.0.13 (2017-01-11)

### Changes

* Add changelog. [Stavros Korokithakis]

### Fixes

* Make `ensure_on` more accurate by always fetching the properties before a method call. [Stavros Korokithakis]


## v0.0.12 (2016-11-16)

### Fixes

* Remove debugging command that was erroneously left in. [Stavros Korokithakis]


## v0.0.11 (2016-11-16)

### Features

* Add music mode. [Stavros Korokithakis]


## v0.0.10 (2016-11-15)

### Features

* Add set_adjust. [Stavros Korokithakis]

* Add value parameter to set_hsv. [Stavros Korokithakis]

### Fixes

* Don't require flake8 for tests any more. [Stavros Korokithakis]

* Fix tests on Python 3. [Stavros Korokithakis]

* Fix per-call effects. [Stavros Korokithakis]


## v0.0.9 (2016-11-14)

### Fixes

* Ignore errors on init files. [Stavros Korokithakis]


## v0.0.8 (2016-11-14)

### Fixes

* Hopefully actually fix version string problem during setup. [Stavros Korokithakis]


