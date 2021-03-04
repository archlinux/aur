# Maintainer: Guillaume Horel <guillaume.horel@gmail.com>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Johan Förberg <johan@forberg.se>

pkgname=zstd-static
_pkgname=${pkgname%-static}
pkgver=1.4.9
pkgrel=1
pkgdesc='Zstandard - Fast real-time compression algorithm'
arch=('x86_64')
url='http://www.zstd.net/'
license=('BSD')
depends=('zlib' 'xz' 'lz4')
makedepends=('cmake')
options=('staticlibs')
source=("https://github.com/facebook/zstd/archive/v${pkgver}.tar.gz")
sha256sums=('acf714d98e3db7b876e5b540cbf6dee298f60eb3c0723104f6d3f065cd60d6a8')
provides=('zstd')
conflicts=('zstd')

build() {
    cmake -B build -S "$_pkgname-${pkgver}/build/cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBDIR=/usr/lib
    make -C build
}

package() {
    make DESTDIR="$pkgdir/" -C build/lib install
    make DESTDIR="$pkgdir" -C build/programs install
    cd "$_pkgname-${pkgver}"
    install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check() {
    cd "$_pkgname-$pkgver"
    make check
}
