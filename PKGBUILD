pkgname=librepo
_gitrev=d9bed0d9f96b505fb86a1adc50b3d6f8275fab93
pkgver=1.7.16
pkgrel=1
pkgdesc="Repodata downloading library"
arch=('i686' 'x86_64')
url="https://github.com/Tojaj/$pkgname"
license=('LGPL2.1')
depends=('curl' 'expat' 'glib2' 'gpgme')
makedepends=('cmake' 'python')
checkdepends=('check' 'python-flask' 'python-nose' 'python-pygpgme' 'python-pyxattr')
optdepends=('python: for python bindings')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$_gitrev.tar.gz")
md5sums=('3df89269456df9dce6d1205b8a717f53')

prepare() {
	cd "$pkgname-$_gitrev"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$_gitrev"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      -DENABLE_DOCS=OFF           \
	      ..
	make
}

check() {
	cd "$pkgname-$_gitrev"/build
	make ARGS="-V" test
}

package() {
	cd "$pkgname-$_gitrev"/build
	make DESTDIR="$pkgdir/" install
	if [[ "$CARCH" == "x86_64" ]]; then
		mv "$pkgdir/"usr/lib64/* "$pkgdir/"usr/lib
		rmdir "$pkgdir/"usr/lib64
	fi

	install -D -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
