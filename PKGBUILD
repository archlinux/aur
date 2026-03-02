# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

# should be renamed to arduino-core-avr to match upstream and Debian.
pkgname=arduino-avr-core
pkgver=1.8.7
pkgrel=2
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any') # binaries are for avr
url="https://github.com/arduino/ArduinoCore-avr"
# arduinocore-avr has no top-level license and contains a number of
# different licenses. Most is licensed LGPL-2.1+, but other licenses are used,
# including non-standard licenses.
# See https://github.com/arduino/ArduinoCore-avr/issues/376 for more information.
license=('LGPL-2.1-or-later AND BSD-3-Clause AND MIT AND GPL-2.0-or-later AND GPL-3.0-or-later AND ISC AND LicenseRef-wifishield AND LicenseRef-LUFA')
depends=('avrdude' 'avr-gcc' 'avr-libc')
makedepends=('git')
options=(!strip)
source=("git+$url#tag=$pkgver")
sha512sums=('f62044fc440445eb7f357bde19512f811441b9b4522a1bde8463342ec1484de2f14ca3692430505d8ce05402532dfa16f403de0a9b249b2d21f6d8285ec4bbaf')

prepare() {
	cd ArduinoCore-avr

	sed -i 's|{runtime.tools.avr-gcc.path}|/usr|' platform.txt
	sed -i 's|{runtime.tools.avrdude.path}|/|' platform.txt
}

package() {
	_avr_path="/usr/share/arduino/hardware/archlinux-arduino/avr"
	_avr_src="$srcdir/ArduinoCore-avr"
	install -d "${pkgdir}${_avr_path}" "$pkgdir/usr/share/licenses/$pkgname"
	cp -ar ArduinoCore-avr/* "${pkgdir}${_avr_path}"

	# Licenses
	cd "$pkgdir/usr/share/licenses/$pkgname/"
	# this is a modified GPL-3.0 file
	ln -s "$_avr_path/drivers/gemma/license/libusb0/installer_license.txt" LICENSE-GPL-3.0-libusb0
	# LicenseRef-wifishield
	ln -s "$_avr_path/firmwares/wifishield/wifiHD/src/license.txt" LICENSE-LicenseRef-wifishield
	# LicenseRef-LUFA, used in bootloaders/caterina* and firmwares/atmegaxxu2
	head -n 30 "$_avr_src/bootloaders/caterina/Caterina.c" >LICENSE-LicenseRef-LUFA
	# the MIT license of Udp.h
	head -n 33 "$_avr_src/cores/arduino/Udp.h" >LICENSE-MIT-Udp
	# similar yet different ISC licenses
	head -n 18 "$_avr_src/cores/arduino/CDC.cpp" >LICENSE-ISC-CDC
	head -n 19 "$_avr_src/cores/arduino/USBCore.cpp" >LICENSE-ISC-USBCore.cpp
	head -n 17 "$_avr_src/cores/arduino/USBCore.h" >LICENSE-ISC-USBCore.h
	head -n 18 "$_avr_src/cores/arduino/USBDesc.h" >LICENSE-ISC-USBDesc
	head -n 18 "$_avr_src/libraries/HID/src/HID.h" >LICENSE-ISC-HID
	# BSD-3-Clause licenses
	head -n 39 "$_avr_src/bootloaders/optiboot/boot.h" >LICENSE-BSD-3-Clause-optiboot
	head -n 30 "$_avr_src/firmwares/wifishield/wifi_dnld/src/clocks.h" >LICENSE-BSD-3-Clause-wifishield
}
