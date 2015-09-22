pkgname=librepo
pkgver=1.7.16
pkgrel=2
pkgdesc="Repodata downloading library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('curl' 'expat' 'glib2' 'gpgme')
makedepends=('cmake' 'python')
checkdepends=('check' 'python-flask' 'python-nose' 'python-pygpgme' 'python-pyxattr')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgname-$pkgver.tar.gz"
        "xattr-skiptest.patch::$url/commit/96457dc6a76418af0ea4f8c3405471710fd06b9d.patch")
md5sums=('d09540e71574ee8b1b6ea97aa0a61b89'
         '60b12b69a8d5e16f32d79a4f5bf02fa4')

prepare() {
	mv "$pkgname-$pkgname-$pkgver" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build

	# FTBFS with filesystems which do not have xattr support
	patch -p1 < "$srcdir"/xattr-skiptest.patch
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DPYTHON_DESIRED=3          \
	      -DENABLE_DOCS=OFF           \
	      ..
	make
}

check() {
	cd "$pkgname-$pkgver"/build
	make ARGS="-V" test
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
