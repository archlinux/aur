# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Schrottfresse <schrottfresse@gmx.de>

pkgname=libspatialindex
pkgver=1.9.3
_commit=1896a18
pkgrel=1
pkgdesc="C++ implementation of R*-tree, an MVR-tree and a TPR-tree with C API"
arch=('x86_64')
url='https://github.com/libspatialindex/libspatialindex'
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'python')
provides=("$pkgname.so" "${pkgname}_c.so")
source=("$pkgname::git+$url#commit=$_commit?signed")
sha256sums=('SKIP')
validpgpkeys=('776F7A23F16801DE78978EC7C015A12DBFE1B014')

build() {
	cmake \
		-B build \
		-S "$pkgname" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DSIDX_BUILD_TESTS=ON \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dvm644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
