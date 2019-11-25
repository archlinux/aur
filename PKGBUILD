# Uncomment to build documentation
#_with_docs=1

pkgname=libcomps
pkgver=0.1.12
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2' 'zlib')
makedepends=('cmake' 'python')
((_with_docs)) && makedepends+=('doxygen' 'python-sphinx')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('1fd641428842b90a73ec56305daf12e0')

prepare() {
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DPYTHON_DESIRED=3 \
	      -Wno-dev \
	      ../libcomps

	make

	if ((_with_docs)); then
		make docs
		make pydocs
	fi
}

check() {
	cd "$pkgname-$pkgver"/build
	make test
	make pytest
}

package() {
	cd "$pkgname-$pkgver"/build

	make DESTDIR="$pkgdir/" install

	# Install documentation
	install -Dp -m644 ../README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
	if ((_with_docs)); then
		mkdir -p "$pkgdir/usr/share/doc/$pkgname"/{doxygen,sphinx}
		cp -Rp docs/libcomps-doc/html/ "$pkgdir/usr/share/doc/$pkgname/doxygen/"
		cp -Rp src/python/docs/html/   "$pkgdir/usr/share/doc/$pkgname/sphinx/"
	fi
}

# vim: set ft=sh ts=4 sw=4 noet:
