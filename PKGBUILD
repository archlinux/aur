# Uncomment to build documentation
#_with_docs=1

pkgname=libcomps
pkgver=0.1.9
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2')
makedepends=('cmake' 'python')
((_with_docs)) && makedepends+=('doxygen')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('2a1a1ca81c619e5cc630aa47b76db803')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build

	cmake -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS="$CFLAGS $CPPFLAGS" \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3 \
	      -Wno-dev \
	      ../libcomps

	make

	if ((_with_docs)); then
		make docs
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
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	# Install documentation
	install -Dp -m644 ../README.md  "$pkgdir/usr/share/doc/$pkgname/README.md"
	if ((_with_docs)); then
		mkdir -p "$pkgdir/usr/share/doc/$pkgname"
		cp -Rp docs/libcomps-doc/html/ "$pkgdir/usr/share/doc/$pkgname/"
	fi
}

# vim: set ft=sh ts=4 sw=4 noet:
