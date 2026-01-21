# Maintainer: tippfehlr@tippfehlr.dev
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>

# should be renamed to arduino-core-avr to match upstream and Debian.
pkgname=arduino-avr-core
pkgver=1.8.7
pkgrel=1
pkgdesc="Arduino AVR core with upstream avr-gcc and avrdude"
arch=('any')
url="https://github.com/arduino/ArduinoCore-avr"
# arduinocore-avr has no top-level license and contains a number of
# different licenses. Most is licensed LGPL-2.1+, but other licenses are used,
# including non-standard licenses.
# See https://github.com/arduino/ArduinoCore-avr/issues/376 for more information.
#
# All licenses provided by the repository are packaged in 
# /usr/share/arduino/hardware/archlinux-arduino/avr
license=('LGPL-2.1-or-later AND BSD-3-Clause AND MIT AND GPL-2.0-or-later AND ISC AND LicenseRef-custom')
depends=('avrdude' 'avr-gcc' 'avr-libc')
options=(!strip !emptydirs !debug)
source=("https://github.com/arduino/ArduinoCore-avr/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "platform.patch")
sha512sums=('d7a84d702c41909762a1815eb42b68fe8324a5f5e7124c5c49113babeb1ee67c958c355b31a7ff79102d4dbe91fc14d61c05b8ca50e074056554187a9043536d'
            '916d76a1313fa9372e141eb132eb3d5d4db32e27f695d3b6b0e2894111bfdacd54feec2ba6ea89b10918b9ef904f9b3d4c105c37d5a6851ac92c5c1758679f00')
validpgpkeys=('326567C1C6B288DF32CB061A95FA6F43E21188C4') # Arduino Packages <support@arduino.cc>

prepare() {
	# Prepare arduino avr core to be used with internal avr-gcc
	cd ArduinoCore-avr-$pkgver

	# Update version in patchfile, then apply it
	sed -i "s/^ version=.*/ version=${pkgver}/" "${srcdir}/platform.patch"
	patch -Np1 -i "${srcdir}/platform.patch"

	# Remove elf files
	find . -name "*.elf" -type f -exec rm -f {} \;
	find . -name "*.a" -type f -exec rm -f {} \;
}

package() {
	# Copy archlinux arduino avr core
	install -dm755 "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino/avr"
	cp -ar ArduinoCore-avr-$pkgver/* "${pkgdir}/usr/share/arduino/hardware/archlinux-arduino/avr"
}
