pkgname=librepo
pkgver=1.13.0
pkgrel=1
pkgdesc="Repodata downloading library"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1')
depends=('curl>=7.52.0' 'glib2' 'gpgme' 'libxml2' 'openssl' 'zchunk>=0.9.11')
makedepends=('cmake>=3.13' 'python')
checkdepends=('check' 'python-flask' 'python-gpgme' 'python-nose'
              'python-pyxattr' 'python-requests')
optdepends=('python: for python bindings')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('52dd2f4d9108a92f221bde3279bb75f1')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DENABLE_DOCS=OFF \
	      -DENABLE_PYTHON=ON \
	      -DWITH_ZCHUNK=ON

	make -C build
}

check() {
	cd "$pkgname-$pkgver"

	make -C build ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
