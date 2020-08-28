# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=9.4.0
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=6.1.1' 'pugixml' 'mustache' 'xapian-core' 'aria2' 'libmicrohttpd')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(ccc883d06f111ebcb7f3530299798501b97400f319814871e17f73fa3e349766)

build() {
	cd "${pkgname}-${pkgver}"
	# We want to ignore xapian ABI version mismatches
	arch-meson build -Dwerror=false
	ninja -C build
}

check() {
	cd "${pkgname}-${pkgver}/build"
	ninja meson-test
}

package() {
	install -Dm644 "${pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	cd "${pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
}
