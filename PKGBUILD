pkgname=drpm
pkgver=0.5.1
pkgrel=1
pkgdesc="A small library for fetching information from deltarpm packages"
arch=('i686' 'x86_64')
url="https://github.com/rpm-software-management/$pkgname"
license=('LGPL2.1' 'custom:BSD')
depends=('bzip2' 'openssl' 'rpm-tools' 'xz' 'zlib' 'zstd')
makedepends=('cmake>=3.13' 'doxygen')
checkdepends=('cmocka')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9e07c0eb3cdfb766d97224b3379ffe60fdb5ac4e04e2a32bb0a00ee2f7458fb6')

build() {
	cd "$pkgname-$pkgver"

	cmake -B build \
	      -DCMAKE_BUILD_TYPE=Release \
	      -DCMAKE_C_FLAGS_RELEASE='-DNDEBUG' \
	      -DCMAKE_INSTALL_PREFIX=/usr \
	      -DCMAKE_INSTALL_LIBDIR=lib \
	      -DWITH_ZSTD=ON

	make -C build VERBOSE=1
	make -C build doc
}

check() {
	cd "$pkgname-$pkgver"

	make -C build ARGS="-V" test
}

package() {
	cd "$pkgname-$pkgver"

	make -C build DESTDIR="$pkgdir/" install

	mkdir -p "$pkgdir"/usr/share/doc/$pkgname
	cp -Rp build/doc/html "$pkgdir"/usr/share/doc/$pkgname/html

	install -Dp -m644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
}

# vim: set ft=sh ts=4 sw=4 noet:
