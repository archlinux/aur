# Maintainer: Christopher Loen <christopherloen at gmail dot com>
# Co-Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
pkgver=1.6.9
pkgrel=3
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/arduino/Arduino"
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'jre8-openjdk' 'avrdude')
makedepends=('jdk8-openjdk' 'apache-ant')
provides=('arduino')
conflicts=('arduino-bin')
source=("https://github.com/arduino/Arduino/archive/${pkgver}.tar.gz")
sha512sums=('92b3508068e3aae6a88c3a395d0906fb63d2fd8ee20d003173b96f3f0ff6851eddcdb77c6349dfec3ad0ee36976f53432c643f56724490e9187d4af049fd4bf8')

build() {
	cd "Arduino-${pkgver}/build"
	ant clean build
}

package() {
	cd "Arduino-${pkgver}/build/linux/work"

	install -dm755 "${pkgdir}/usr/bin"
	install -dm755 "${pkgdir}/usr/share/"{doc,icons/hicolor,applications,mime/packages}

	# Copy the whole SDK
	cp -a . "${pkgdir}/usr/share/arduino"

	# Create symlinks
	ln -s /usr/share/arduino/arduino "${pkgdir}/usr/bin/arduino"
	ln -s /usr/share/arduino/reference "${pkgdir}/usr/share/doc/arduino"

	# Fix avrdude (see https://github.com/arduino/Arduino/issues/5094)
	rm -f "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"{,_bin}
	ln -s /usr/bin/avrdude "${pkgdir}/usr/share/arduino/hardware/tools/avr/bin/avrdude"

	# Install desktop icons (keep a symlink for the arduino binary)
	cp -a lib/icons/* "${pkgdir}/usr/share/icons/hicolor"
	rm -rf "${pkgdir}/usr/share/arduino/lib/icons"
	ln -s /usr/share/icons/hicolor "${pkgdir}/usr/share/arduino/lib/icons"

	# Create desktop file using existing template
	sed "s,<BINARY_LOCATION>,arduino %U,g;s,<ICON_NAME>,arduino,g" "lib/desktop.template" \
	> "${pkgdir}/usr/share/applications/arduino.desktop"

	# Install Arduino mime type
	ln -s /usr/share/arduino/lib/arduino-arduinoide.xml "${pkgdir}/usr/share/mime/packages/arduino.xml"
}
