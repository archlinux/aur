pkgname=librepo
pkgver=1.7.15
pkgrel=1
pkgdesc="Repodata downloading library"
arch=('i686' 'x86_64')
url="https://github.com/Tojaj/$pkgname"
license=('LGPL2.1')
depends=('curl' 'expat' 'glib2' 'gpgme')
makedepends=('cmake' 'python')
checkdepends=('check' 'python-flask' 'python-nose' 'python-pygpgme' 'python-pyxattr')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgname-$pkgver.tar.gz")
md5sums=('e4971ffccf2c78c2b390df43b01297c3')

prepare() {
	cd "$pkgname-$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      -DENABLE_DOCS=OFF           \
	      ..
	make
}

check() {
	cd "$pkgname-$pkgname-$pkgver"/build
	make ARGS="-V" test
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
