pkgname=drpm
pkgver=0.5.0
pkgrel=1
pkgdesc="A small library for fetching information from deltarpm packages"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1' 'custom:BSD')
depends=('bzip2' 'openssl' 'rpm-tools' 'xz' 'zlib' 'zstd')
makedepends=('cmake>=2.8.5' 'doxygen')
checkdepends=('cmocka')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('3c8d04d5ae70de42c75be9243cbb519a')

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
	      -DWITH_ZSTD=ON \
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
