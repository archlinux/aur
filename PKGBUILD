# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=zstd-static
_pkgname=${pkgname%-static}
pkgver=1.3.0
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm'
arch=('i686' 'x86_64')
url='http://www.zstd.net/'
license=('BSD')
depends=('zlib' 'xz')
makedepends=('gtest')
options=('staticlibs')
source=("https://github.com/facebook/zstd/archive/v${pkgver}.tar.gz")
sha1sums=('1b254a1a7092886c7e17957b5f672b8c1b972b08')
provides=('zstd')
conflicts=('zstd')

build() {
    cd "$srcdir/$_pkgname-$pkgver"
    make CFLAGS="$CFLAGS -fPIC"
    make zstdmt
    make -C contrib/pzstd
}

package() {
    cd "$srcdir/$_pkgname-$pkgver"
    make PREFIX="/usr" DESTDIR="$pkgdir/" install
    install -D -m755 zstdmt "$pkgdir/usr/bin/zstdmt"
    install -D -m755 contrib/pzstd/pzstd "$pkgdir/usr/bin/pzstd"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -D -m644 PATENTS "$pkgdir/usr/share/licenses/$pkgname/PATENTS"
}
