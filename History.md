uuu_1.5.243 / 2025-12-16
========================

 * Support i.MX952
 * Add -force-ctrl option for HID backup transfer

uuu_1.5.233 / 2025-8-28
=======================

  * build-in script spi-nor support big files.
  * update libusb to v1.0.29.
  * libuuu: Fix typo & compilation warning in error message.
  * fix: memory corruption in libuuu fastboot.
  * fix: change the return type of `load_bmap` to an integer.
  * fix: if-command comparison code by use uppercase.
  * fix python wrapper work action issue
  * script spi: check fastboot_bytes not fastboot_buffer to get the image size
  * script spi: only run the fastboot loop when downloading the large image.
  * Accessing freed memory in fastboot.c when use zip

uuu_1.5.201 / 2025-1-10
=======================

  * Support imx943 v2x image container
  * Reduce transfer size to 16k because chipidea usb driver limitation
  * Fix workflow pdf build error
  * Fix workflow arm build fail

python-libuuu_1.5.197 / 2025/1/9
================================

  * Add iMX943 support

python-libuuu_1.5.191 / 2024/10/18
==================================

  * first release of the python bindings for libuuu
