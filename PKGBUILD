# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Ghabry <gabriel-aur mastergk de>

pkgname=rttr
pkgver=0.9.6
pkgrel=4
pkgdesc="C++ Reflection Library"
arch=('x86_64')
url='https://github.com/rttrorg/rttr'
license=('MIT')
depends=('gcc-libs')
makedepends=('cmake')
provides=("librttr_core.so=$pkgver-64")
source=("$pkgname-$pkgver.tar.gz::https://www.rttr.org/releases/rttr-$pkgver-src.tar.gz")
sha256sums=('f62caee43016489320f8a69145c9208cddd72e451ea95618bc26a49a4cd6c990')

prepare() {
	mkdir -p build

	cd "$pkgname-$pkgver"
	# Fix incorrect file permissions after install
	sed -i 's/PERMISSIONS OWNER_READ//' CMake/*.cmake
}

build() {
	cmake \
		-B build \
		-S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=None \
		-DBUILD_EXAMPLES=OFF \
		-DBUILD_UNIT_TESTS=OFF \
		-DBUILD_PACKAGE=OFF \
		-DCMAKE_INSTALL_LIBDIR=lib \
		-Wno-dev
	make -C build
}

package() {
	make -C build DESTDIR="$pkgdir" install
	cd "$pkgname-$pkgver"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
