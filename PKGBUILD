# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=zstd-static
_pkgname=${pkgname%-static}
pkgver=1.3.3
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm'
arch=('i686' 'x86_64')
url='http://www.zstd.net/'
license=('BSD')
depends=('zlib' 'xz' 'lz4')
makedepends=('gtest')
options=('staticlibs')
source=("https://github.com/facebook/zstd/archive/v${pkgver}.tar.gz")
sha256sums=('a77c47153ee7de02626c5b2a097005786b71688be61e9fb81806a011f90b297b')
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
}
