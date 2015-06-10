pkgname=libcomps
pkgver=0.1.6
pkgrel=1
pkgdesc="Comps XML file manipulation library"
arch=('i686' 'x86_64')
url="https://github.com/midnightercz/$pkgname"
license=('GPL2')
depends=('expat' 'libxml2')
makedepends=('cmake' 'python')
checkdepends=('check')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('50611b9564f15b6a06e0f40f7683a0f0')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release    \
	      -DCMAKE_INSTALL_PREFIX=/usr   \
		  -DCMAKE_SKIP_INSTALL_RPATH=ON \
	      -DPYTHON_DESIRED=3            \
	      ../libcomps
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"/build
	make test
	make pytest
}

package() {
	cd "$pkgname-$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -D -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
