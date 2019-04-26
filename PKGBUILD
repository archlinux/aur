# Maintainer: Jan Peter Koenig <public@janpeterkoenig.com>
# Contributor: Niklas <dev@n1klas.net>

pkgname=qt5-mqtt-git
pkgver=5.12.3.r3.gacff2f2
pkgrel=1
pkgdesc="Module to implement MQTT protocol v3.1/3.1.1/5.0"
arch=('i386' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="http://qt-project.org/"
license=('GPL3' 'custom')
depends=('qt5-base')
makedepends=('git')
provides=("qt5-mqtt")
conflicts=("qt5-mqtt")

source=(
	"qt5-mqtt::git://code.qt.io/qt/qtmqtt.git"
)
sha512sums=(
	'SKIP'
)

pkgver() {
	cd "${srcdir}/qt5-mqtt"
	git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
	mkdir -p "${srcdir}/build"
}

build() {
	cd "${srcdir}/build"
	qmake "../qt5-mqtt"
	make
}

package() {
	cd "${srcdir}/build"
	make INSTALL_ROOT="${pkgdir}" install

	# Drop QMAKE_PRL_BUILD_DIR because reference the build dir
	find "${pkgdir}/usr/lib" -type f -name '*.prl' \
		-exec sed -i -e '/^QMAKE_PRL_BUILD_DIR/d' {} \;

	install -Dm644 "${srcdir}/qt5-mqtt/LICENSE.GPL3-EXCEPT" \
		"${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.GPL3-EXCEPT"
}
