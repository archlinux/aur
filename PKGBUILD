# Maintainer: hashworks <mail@hashworks.net>
pkgname=kiwix-lib
pkgver=9.3.0
pkgrel=1
pkgdesc="Library providing the Kiwix software core"
license=('GPL3')
arch=('armv7h' 'i686' 'x86_64')
depends=('libzim>=6.1.1' 'pugixml' 'mustache' 'xapian-core' 'aria2' 'libmicrohttpd')
makedepends=('meson' 'gtest')
url='https://github.com/kiwix/kiwix-lib'
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz")
sha256sums=(b521b3b8e3eee7821adb162988b15f87117024a6a927c2b8a8b9231f0c486bc3)

build() {
	cd "${pkgname}-${pkgver}"
	# We want to ignore xapian ABI version mismatches
	CXXFLAGS="${CXXFLAGS} -fpermissive" arch-meson build -Dwerror=false
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
