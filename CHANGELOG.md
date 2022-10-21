# ChangeLog

All notable changes to this project will be documented in this file.

## [2.0.32] - unreleased
- libusb: update to 1.0.26
- hidapi: update to 0.12.0 and move to a submodule
- Fix build and notarization for all platforms
- Remove custom patches for Windows 7 

## [2.0.31] - 2021-03-12
- hidapi: update to 0.10.1
- libusb: update to 1.0.24
- Fix bootloader not recognized on Windows accidentally introduced in 2.0.30 (5438e38d)
- Fix crash on macOS [#221]

## [2.0.30] - 2020-11-11
- Lock mutex when deleting session to avoid concurrent read and write (#190)
- hidapi: update to 0.10.0
- libusb: update to unstable c3deb6d
- libusb: update Windows API level to 6.0 and macOS to 10.7
- allow Trezor onion domain

## [2.0.29] - 2020-05-05

- Lower UDP timeout to 1000 ms
- Do not check if another call is in progress in Post method (#183)
- Have separate locks for read and write in libusb (#183)

## [2.0.28] - 2020-02-11

- Whitelist SatoshiLabs dev servers
- Add support for OpenBSD

## [2.0.27] - 2019-05-13

- Fix Certificate issue on Windows

## [2.0.26] - 2019-03-07

- Add verbose logs from previous run on Windows to better debug Windows 7 crashes
- Fix behavior with old bootloaders

## [2.0.25] - 2018-11-23

- Use interrupt reads without timeouts even on FreeBSD and linux
- Stop using hidapi for t1 on linux
- Lowlevel code cleanup
- Add debuglink support (UDP + libusb)
- Add support for one-directional calls (read, write)
- Fix windows 7 driver installer when run first time


## [2.0.24] - 2018-10-15

- Use interrupt reads without timeouts
- Remove wait for other pending driver installation on Windows
- Do not attempt to read from a disconnected device
- Add FreeBSD support (but not as release target)
- Fix device types on status page with V1+WebUSB
- Nicer error on disconnect during call
- Remove "reinstall drivers" option in Win7

## [2.0.23] - unreleased

- Fix installation when not an admin user (runtime UAC checks + install to all users)

## [2.0.22] - unreleased

- Show only WinUSB devices on Windows when using libusb
- More Windows debug output

## [2.0.21] - unreleased

- Add timeout to WDI installer

## [2.0.20] - unreleased

- Fixes for golang 1.5 and later
- Import libwdi code
- Add libwdi driver reinstall debug to detailed log

## [2.0.19] - unreleased

- Add hidapi enumeration verbose logs on windows
- Move trezor/usbhid dependency to /usb/lowlevel
- Skip non-trezor USB devices on windows HID enumeration

## [2.0.18] - unreleased

- Add logs for errorneous windows libusb error with multiple devices
- Ignoring windows claim errors

## [2.0.17] - unreleased

- Add timestamps to detailed log for debugging timing issues

## [2.0.16] - unreleased

- Enable verbose libusb enumerate debugging
- Skip non-trezor USB devices on windows enumeration

## [2.0.15] - unreleased

- Libusb debug logs put into detailed logs
- Reverted libusb to 1.0.21 to fix mysterious libusb windows errors
- On Windows 7, add USB driver reinstall to start menu

## [2.0.14] - 2018-06-08

- Add more devcon and msinfo output on windows
- Separate detailed log download as a different URL request
- Big refactor of http.go to smaller packages

## [2.0.13] - 2018-04-12

- Allowing nousb mode (with only emulator turned on)
- Adding /post for writes without reads (debug link, only emulator so far)
- Installing WDI only on Windows 7
- Remove existing WDI drivers on install, preventing double driver install
- Rework HID to use timeout reads to prevent windows crashes

## [2.0.12] - 2018-04-03

- Add devcon and wdi-simple tools for Windows device drivers manipulation
- Fix deadlock
- Preventing panic when request is closed

## [2.0.11] - 2018-03-22

- Using libusb rc4, fixing windows bugs long-term
- Adding status page
- Fixing errors with half-read USB messages
- Refactoring for less complexity, fix golinter issues

## [2.0.10] - 2018-03-13

- Workaround for libusb bug in Windows 10 (fixes trezor/trezor-core#165)
- Fixes conflict with manually installed udev rules for T1 (Linux).

## [2.0.9] - 2018-03-05

- Fixes communication for very old T1 bootloaders

## [2.0.8] - 2018-03-01

- Stability fix for Linux

## [2.0.7] - 2018-02-23

- Use origin checks for all requests (fixes #16)

## [2.0.6] - 2018-02-17

- Allowing CORS for more ports on localhost (5xxx, 8xxx)

## [2.0.5] - 2018-02-17

- Added optional UDP (for emulators for both T1 and T2)
- WebUSB: Fixing stealing by detecting closed device before reading (otherwise read/write may hang)

## [2.0.4] - 2018-02-15

- WebUSB: Increase timeout to 5 seconds

## [2.0.3] - 2018-02-14

- WebUSB: don't abort on failed Reset Device or Set Configuration
- WebUSB: reset the device handle after opening
- Wire: add sanity checks

## [2.0.2] - 2018-02-14

- WebUSB: increase timeout to 500 milliseconds

## [2.0.1] - 2018-02-13

- WebUSB: explicitly open USB Configuration before claiming the interface
- Errors: nicer error messages

[#221]: https://github.com/trezor/trezord-go/issues/221
