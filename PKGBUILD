# Maintainer: Mike H Benton <bikepunk005 at hotmail dot com>
# Contributor: Danny Holman <dholman@gymli.org>
# Contributor: Kilian Köppchen <kiliankoeppchen at gmail dot com>
pkgname=libtmx-git
provides=('libtmx')
pkgver=209.11ffdcd
pkgrel=1
pkgdesc="A portable C library to load tiled maps in your games."
arch=(any)
url="https://github.com/baylej/tmx/"
license=('BSD')
depends=('zlib' 'libxml2' 'zstd')
makedepends=('cmake')
CFLAGS+=" -ffat-lto-objects"
source=("$pkgname"::'git+https://github.com/baylej/tmx.git')
b2sums=('SKIP')

pkgver() {
        cd "$pkgname"
        printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
        cd $pkgname
        mkdir build
        cd build
	cmake -DCMAKE_INSTALL_LIBDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_SHARED_LIBS=yes -DWANT_ZLIB=yes -DWANT_ZSTD=yes -DZSTD_PREFER_STATIC=no  ..
	make
}

package() {
        cd $pkgname/build
	make DESTDIR="$pkgdir" install
        cd ..
	install -m644 -D COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
