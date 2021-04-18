# Uncomment to build documentation
#_with_docs=1

pkgname=libcomps
pkgver=0.1.16
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2' 'zlib')
makedepends=('cmake>=3.13' 'python')
((_with_docs)) && makedepends+=('doxygen' 'python-sphinx')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
md5sums=('be7ced6d824a77c7b12c1646ff168f55')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build -S libcomps \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -Wno-dev

	make -C build

	if ((_with_docs)); then
		make -C build docs
		make -C build pydocs
	fi
}

check() {
	cd "$pkgname-$pkgver"

	make -C build test
	make -C build pytest
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	# Install documentation
	if ((_with_docs)); then
		mkdir -p "$pkgdir/usr/share/doc/$pkgname"/{doxygen,sphinx}
		cp -Rp build/docs/libcomps-doc/html/ "$pkgdir/usr/share/doc/$pkgname/doxygen/"
		cp -Rp build/src/python/docs/html/   "$pkgdir/usr/share/doc/$pkgname/sphinx/"
	fi

	install -Dp -m644 README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
