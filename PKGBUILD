pkgname=librepo
pkgver=1.11.3
pkgrel=1
pkgdesc="Repodata downloading library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('curl' 'glib2' 'gpgme' 'libxml2' 'openssl' 'zchunk>=0.9.11')
makedepends=('cmake' 'python')
checkdepends=('check' 'python-flask' 'python-gpgme' 'python-nose'
              'python-pyxattr' 'python-requests')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('19df513ab9ff5ee26bf00c9ac0311099')

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
	      -DENABLE_DOCS=OFF \
	      -DENABLE_PYTHON_TESTS=ON \
	      -DWITH_ZCHUNK=ON \
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

	install -Dp -m644 ../README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
