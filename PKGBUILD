pkgbase=libaaruformat
pkgname=(libaaruformat aaruformattool)
_pkgver=1.0.0-beta.2
pkgver=${_pkgver/-/.}
pkgrel=3
pkgdesc="Library for reading and writing AaruFormat disk images"
arch=('x86_64')
url="https://github.com/aaru-dps/libaaruformat"
license=('LGPL-2.1-only')
makedepends=('cmake' 'git' 'ninja' 'argtable3' 'icu')
source=("libaaruformat::git+${url}.git#tag=v${_pkgver}"
        0001-Replace-slog-with-an-in-house-TRACE-FATAL-logger.patch
        0002-Remove-the-slog-submodule.patch)
sha256sums=('22c7096f7f3802544dfbb6bdf64989b50ad6fb1955b06182b1b81c3aa382673f'
            '1c73bbf809b59329feb57dc7c31fd0da2f3dec17cd9c176909d9a662b2ae65e2'
            'b0ecd18557b8596d39625dc25ed0aaedf7696c610d9ad3f56d499b4194b2cd6b')

prepare() {
	cd "$srcdir/${pkgbase}"
	git apply --index "${srcdir}"/*.patch
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
