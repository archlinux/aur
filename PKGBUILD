# Maintainer: Max Bruckner <max at maxbruckner dot de>

pkgname=cjson
pkgver=1.7.7
pkgrel=1
pkgdesc="Ultralightweight JSON parser in ANSI C"
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/DaveGamble/cJSON"
license=('MIT')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::https://github.com/DaveGamble/cJSON/archive/v$pkgver.tar.gz")
sha512sums=('5b845ed0c7ab1387b63f431b39c9ebfd51e859d057fa795daf7c7a26214618e1cb9f37368d460415d6a6da2cdee33fc4f2b43e2e28b87dfc0b0614fbec2e5feb')

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
