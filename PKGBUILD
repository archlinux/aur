pkgname=libaaruformat
_pkgver=1.0.0-beta.2
pkgver=${_pkgver/-/.}
pkgrel=2
pkgdesc="Library for reading and writing AaruFormat disk images"
arch=('x86_64')
url="https://github.com/aaru-dps/libaaruformat"
license=('LGPL-2.1-only')
depends=('argtable3')
makedepends=('cmake' 'git' 'ninja')
source=("libaaruformat::git+${url}.git#tag=v${_pkgver}"
        0001-Replace-slog-with-an-in-house-TRACE-FATAL-logger.patch
        0002-Remove-the-slog-submodule.patch)
sha256sums=('22c7096f7f3802544dfbb6bdf64989b50ad6fb1955b06182b1b81c3aa382673f'
            '1c73bbf809b59329feb57dc7c31fd0da2f3dec17cd9c176909d9a662b2ae65e2'
            'b0ecd18557b8596d39625dc25ed0aaedf7696c610d9ad3f56d499b4194b2cd6b')

prepare() {
	cd "$srcdir/${pkgname}"
	git apply --index "${srcdir}"/*.patch
	git submodule update --init
}

build() {
	cd "$srcdir/${pkgname}"
	cmake -B build -S . \
	  -DCMAKE_BUILD_TYPE=Release \
	  -DCMAKE_INSTALL_PREFIX=/usr \
	  -DBUILD_SHARED_LIBS=ON \
	  -DBUILD_TOOL=ON \
	  -G Ninja
	cmake --build build
}

check() {
	cd "$srcdir/${pkgname}"
	ctest --verbose
}

package() {
	cd "$srcdir/${pkgname}"
	install -Dm644 -t "$pkgdir/usr/include" include/aaru.h include/aaruformat.h
	cp -r include/aaruformat "$pkgdir/usr/include"

	install -Dm755 build/libaaruformat.so* -t "$pkgdir/usr/lib"
	install -Dm755 build/tool/aaruformattool -t "$pkgdir/usr/bin"
}
