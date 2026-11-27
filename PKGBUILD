pkgbase=libaaruformat
pkgname=(libaaruformat aaruformattool)
_pkgver=1.0.0-beta.3.2
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Library for reading and writing AaruFormat disk images"
arch=('x86_64')
url="https://github.com/aaru-dps/libaaruformat"
license=('LGPL-2.1-only')
makedepends=('cmake' 'git' 'ninja' 'argtable3' 'icu')
source=("libaaruformat::git+${url}.git#tag=v${_pkgver}")
sha256sums=('934f307ada5175ac2ab90bf8c38b655031699d4e849d2c0701ad4a6e26bbf61c')

prepare() {
	cd "$srcdir/${pkgbase}"
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgbase}"
	cmake -B build -S . \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DBUILD_SHARED_LIBS=ON \
	  -DBUILD_TOOL=ON \
	  -G Ninja
	cmake --build build
}

check() {
	cd "$srcdir/${pkgbase}"
	ctest --verbose
}

package_libaaruformat() {
	depends=()

	cd "$srcdir/${pkgbase}"
	install -Dm644 -t "$pkgdir/usr/include" include/aaru.h include/aaruformat.h
	cp -r include/aaruformat "$pkgdir/usr/include"

	install -Dm755 build/libaaruformat.so* -t "$pkgdir/usr/lib"
}

package_aaruformattool() {
	pkgdesc="Command-line tool for inspecting and manipulating AaruFormat disk images (dangerous!)"
	depends=('libaaruformat' 'argtable3' 'icu')

	cd "$srcdir/${pkgbase}"
	install -Dm755 build/tool/aaruformattool -t "$pkgdir/usr/bin"
}
