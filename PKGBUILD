pkgname=libaaruformat
_pkgver=1.0.0-beta.1
pkgver=${_pkgver/-/.}
pkgrel=1
pkgdesc="Library for reading and writing AaruFormat disk images"
arch=('x86_64')
url="https://github.com/aaru-dps/libaaruformat"
license=('LGPL-2.1-only')
depends=('argtable3')
makedepends=('cmake' 'git' 'ninja')
source=("libaaruformat::git+${url}.git#tag=v${_pkgver}")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir/${pkgname}"
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
