# Uncomment to build documentation
#_with_docs=1

pkgname=libcomps
pkgver=0.1.18
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2' 'zlib')
makedepends=('cmake>=3.13' 'python' 'python-setuptools')
((_with_docs)) && makedepends+=('doxygen' 'python-sphinx')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('02f8aa83dfd19beb7ce250b39818017a6eda7c3984caf8efbd2fc0c70d97bc9a')

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
