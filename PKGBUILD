# Maintainer: Xentec <xentec at aix0 dot eu>

pkgname=cppformat
pkgver=2.0.1
pkgrel=1
pkgdesc="Small, safe and fast formatting library for C++"
arch=('i686' 'x86_64')
url="http://cppformat.github.io"
license=('BSD')

depends=('gcc-libs')
makedepends=('cmake' 'doxygen' 'nodejs-less' 'python-virtualenv')
checkdepends=('gmock')
conflicts=('cppformat-git')

install=$pkgname.install

source=("https://github.com/cppformat/$pkgname/archive/$pkgver.tar.gz")
sha256sums=('5e8d66a53fb0d5c70d0c66c946bfb61274fff4de7af877ce013be81313c1d5b4')

prepare() {
	cd "$pkgname-$pkgver"

	# removes the need for nodejs-clean-css package
	sed -i  "s/'--clean-css',//" doc/build.py
}

build() {
	cd "$pkgname-$pkgver"
	mkdir -p build && cd build

	cmake \
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release \
		-DBUILD_SHARED_LIBS=1 \
		-DFMT_TEST=0 \
		-Wno-dev \
		..

	make
	make doc
}

check() {
	cd "$pkgname-$pkgver/build"

	cmake \
		-DFMT_TEST=1 \
		-Wno-dev \
		..

	make
	make test
}

package() {
	cd "$pkgname-$pkgver/build"

	make DESTDIR="$pkgdir" install
	install -D -m644 ../LICENSE.rst ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
	install -D -m644 ../ChangeLog.rst ${pkgdir}/usr/share/doc/${pkgname}/ChangeLog.rst

	# clean up
	rm -rf ${pkgdir}/usr/share/doc/${pkgname}/{.buildinfo,.doctrees,_sources}
}

