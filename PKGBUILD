# Contributor: Vasil Yonkov <vasily@mm.st>

pkgname=xmr-stak_cpu
pkgver=2.1.0
pkgrel=2
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('cmake')
depends=('hwloc')
# depends=('hwloc' 'openssl' 'libmicrohttpd')
source=("https://github.com/fireice-uk/xmr-stak/archive/v${pkgver}.tar.gz"
        'disable_donation.diff')
sha256sums=('8be57a0b9712d854859dc846efdae532c073b8d1767d969ef92ae81d519ddc12'
            '53062ef6b0a104164ac95f006201ca00d8c5c80b5cd2629ae0315a1ccefae856')

prepare() {
    cd "$srcdir/xmr-stak-$pkgver"
    patch -p0 -i ../../disable_donation.diff
}

build() {
    cd "xmr-stak-$pkgver"

    mkdir build
    cd build

    # https://github.com/fireice-uk/xmr-stak/blob/master/doc/compile.md
    cmake \
        .. \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_LINK_STATIC=OFF \
        -DCMAKE_BUILD_TYPE=Release \
        -DMICROHTTPD_ENABLE=OFF \
        -DOpenSSL_ENABLE=OFF \
        -DXMR-STAK_CURRENCY=monero \
        -DXMR-STAK_COMPILE=native \
        -DCPU_ENABLE=ON \
        -DHWLOC_ENABLE=ON \
        -DOpenCL_ENABLE=OFF \
        -DCUDA_ENABLE=OFF

    make
}

package() {
    cd "xmr-stak-$pkgver/build"
    make DESTDIR="$pkgdir/" install
}
