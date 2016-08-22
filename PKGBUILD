# Maintainer: NicoHood <aur {at} nicohood {dot} de>
# Contributor: Tomas Schertel <tschertel at gmail dot com>
# Contributor: Christopher Loen <christopherloen at gmail dot com>
# Contributor: Peter Reschenhofer <peter.reschenhofer@gmail.com>
# Contributor: Niels Martignène <niels.martignene@gmail.com>
# Contributor: PyroPeter <googlemail.com@abi1789>
# Contributor: darkapex <me@jailuthra.in>
# Contributor: tty0 <vt.tty0[d0t]gmail.com>

pkgname=arduino
pkgver=1.6.11
pkgrel=2
epoch=1
pkgdesc="Arduino prototyping platform SDK"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="https://github.com/arduino/Arduino"
license=('GPL' 'LGPL')
depends=('gtk2' 'desktop-file-utils' 'shared-mime-info' 'java-runtime=8')
makedepends=('java-environment=8' 'apache-ant' 'unzip')
options=(!strip staticlibs)
install="arduino.install"
source=("https://github.com/arduino/Arduino/archive/${pkgver}.tar.gz")
sha512sums=('f18f173c95aea1b60aa4e7ef98e0dc1a44595571d522569b53842fe8c110e92da82902c25aea6b1affe4e3dfe0098ce0c173cf73c42b2237ce353a5a70932f68')

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
