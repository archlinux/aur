# Maintainer: tippfehlr <tippfehlr@tippfehlr.eu>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

# should be renamed to arduino-core-avr to match upstream and Debian.
pkgname=arduino-avr-core
pkgver=1.8.8
pkgrel=1
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
sha512sums=('fbab58707402f4be5afacb84ff1ee1bc872dc9c23086a3be3d0074de8262a8882d1a2aab015211c5938f0dcca22d7a40fd4c4517e55fcb494d0a9a423a58e36e')

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
	sed -n '1,/\*\//p; 1,/^\*\//d; 1,/\*\//p' "$_avr_src/bootloaders/caterina/Caterina.c" >LICENSE-LicenseRef-LUFA
	# the MIT license of Udp.h
	sed -n '1,/^ \*\//p' "$_avr_src/cores/arduino/Udp.h" >LICENSE-MIT-Udp
	# similar yet different ISC licenses
	sed -n '1,/^\*\//p' "$_avr_src/cores/arduino/CDC.cpp" >LICENSE-ISC-CDC
	sed -n '1,/^\*\//p' "$_avr_src/cores/arduino/USBCore.cpp" >LICENSE-ISC-USBCore.cpp
	sed -n '1,/^\*\//p' "$_avr_src/cores/arduino/USBCore.h" >LICENSE-ISC-USBCore.h
	sed -n '1,/^ \*\//p' "$_avr_src/cores/arduino/USBDesc.h" >LICENSE-ISC-USBDesc
	sed -n '1,/^ \*\//p' "$_avr_src/libraries/HID/src/HID.h" >LICENSE-ISC-HID
	# BSD-3-Clause licenses
	sed -n '1,/^\*\//d; 1,/\*\//p' "$_avr_src/bootloaders/optiboot/boot.h" >LICENSE-BSD-3-Clause-optiboot
	sed -n '1,/^ \*\//p' "$_avr_src/firmwares/wifishield/wifi_dnld/src/clocks.h" >LICENSE-BSD-3-Clause-wifishield
}
