# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Schrottfresse <schrottfresse@gmx.de>

pkgname=libspatialindex-git
_pkg="${pkgname%-git}"
pkgver=1.9.3.r30.g3be6758
pkgrel=1
pkgdesc="C++ implementation of R*-tree, an MVR-tree and a TPR-tree with C API"
arch=('x86_64')
url='https://github.com/libspatialindex/libspatialindex'
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'python')
provides=("$_pkg" "$_pkg.so" "${_pkg}_c.so")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/-/.r/;s/-/./'
}

build() {
	cmake \
		-B build \
		-S "$_pkg" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_TESTING=ON \
		-Wno-dev
	cmake --build build
}

check() {
	ctest --test-dir build --output-on-failure
}

package() {
	DESTDIR="$pkgdir" cmake --install build
	install -Dvm644 "$_pkg/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
