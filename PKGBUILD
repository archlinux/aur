# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=zstd-static
_pkgname=${pkgname%-static}
pkgver=1.4.1
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm'
arch=('x86_64')
url='http://www.zstd.net/'
license=('BSD')
depends=('zlib' 'xz' 'lz4')
options=('staticlibs')
source=("https://github.com/facebook/zstd/archive/v${pkgver}.tar.gz")
sha256sums=('f91ea3397e6cc65d398e1bc0713cf2f0b0de2fb85ea9dabb1eb3e8f1b22f8d6f')
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

check() {
    cd "$srcdir/$_pkgname-$pkgver"
    make check
}
