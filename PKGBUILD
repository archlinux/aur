pkgname=libcomps
pkgver=0.1.8
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2')
makedepends=('cmake' 'python')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('0461077e6720ea206af8d8bae004a0b7')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
		  -Wno-dev                    \
	      ../libcomps
	make
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

	install -D -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
