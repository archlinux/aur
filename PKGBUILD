pkgname=drpm
_commit=f955e6ba5f920dea25d9ec28f93ce650bf9d6c9d
pkgver=0.3.0
pkgrel=2
pkgdesc="A small library for fetching information from deltarpm packages"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('BSD' 'LGPL3')
depends=('bzip2' 'openssl' 'rpm-org' 'xz' 'zlib')
makedepends=('cmake' 'doxygen')
checkdepends=('cmocka')
source=("$url/archive/$_commit/$pkgname-$pkgver.tar.gz")
md5sums=('f2b03f8821c61a23264becbad01cda63')

prepare() {
	mv "$pkgname-$_commit" "$pkgname-$pkgver"
	cd "$pkgname-$pkgver"
	rm -rf build
	mkdir build
}

build() {
	cd "$pkgname-$pkgver"/build
	cmake -DCMAKE_BUILD_TYPE=Release  \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DINCLUDE_INSTALL_DIR=/usr/include \
	      -DLIB_INSTALL_DIR=/usr/lib \
	      ..

	make
	make doc
}

check() {
	cd "$pkgname-$pkgver"/build
	make ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"/build
	make DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir"/usr/share/doc/$pkgname
	cp -Rp doc/html "$pkgdir"/usr/share/doc/$pkgname/html

	install -Dp -m644 ../LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set ft=sh ts=4 sw=4 noet:
