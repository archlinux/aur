# Maintainer: Xentec <artificial.i7 at gmail dot com>

pkgname=cppformat-git
pkgver=1.1.0.r256.g69a0317
pkgrel=1
pkgdesc="Small, safe and fast formatting library for C++"
arch=('i686' 'x86_64')
url="http://cppformat.github.io"
license=('BSD')

conflicts=('cppformat')
depends=('gcc-libs')
makedepends=('cmake' 'git' 'doxygen' 'nodejs-less-plugin-clean-css' 'python-virtualenv')
source=("$pkgname"::'git+https://github.com/cppformat/cppformat')
sha256sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-Wno-dev \
		..
	make
	make doc
}

check() {
	cd "$pkgname"
	cd build

	make test
}

package() {
	cd "$pkgname"

	install -D -m644 LICENSE.rst "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	cd build
	make DESTDIR="$pkgdir" install
}

