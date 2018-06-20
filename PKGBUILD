# Maintainer: gspu <bssbk2455[at]gmail[dot]com>
# Contributor: Previous maintainer Vasil Yonkov <vasily@mm.st>

pkgname=xmr-stak_cpu
pkgver=2.4.5
pkgrel=1
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('cmake')
depends=('hwloc' 'openssl' 'libmicrohttpd')
source=("https://github.com/fireice-uk/xmr-stak/archive/${pkgver}.tar.gz"
        'disable_donation.diff')
sha256sums=('deecf9c080465c6a124b64810e4fc2ef9e8346c722d1e193ae2fa6df2afea6d7'
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
        -DMICROHTTPD_ENABLE=ON \
        -DOpenSSL_ENABLE=ON \
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
