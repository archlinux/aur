# Maintainer: Max Bruckner <max at maxbruckner dot de>

pkgname=cjson
pkgver=1.7.10
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('f8d7c9fe798b51ec3c69cabe4124d2f6372f0e6d282285e3ca951c58c971a9a520d87550530d750ff7f8055c0b6ff566f237b9af9eb345cf4f4fc4ff8c910740')

build() {
	cd "$srcdir/cJSON-$pkgver" || return 1

	rm -rf build
	mkdir build
	cd build || return 1
	cmake .. -DENABLE_CJSON_UTILS=On -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib
	make || return 1
}

check() {
	cd "$srcdir/cJSON-$pkgver/build" || return 1
	make check || return 1
}

package() {
	cd "$srcdir/cJSON-$pkgver/build" || return 1

	make DESTDIR="$pkgdir" install || return 1

	# install license files
	install -Dm644 "$srcdir/cJSON-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
