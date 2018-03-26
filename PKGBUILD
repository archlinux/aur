# Contributor: Vasil Yonkov <vasily@mm.st>

pkgname=xmr-stak_cpu
pkgver=2.3.0
pkgrel=1
pkgdesc="Unified All-in-one Monero miner"
arch=('x86_64')
url="https://github.com/fireice-uk/xmr-stak"
license=('GPL3')
makedepends=('cmake')
depends=('hwloc' 'openssl' 'libmicrohttpd')
source=("https://github.com/fireice-uk/xmr-stak/archive/${pkgver}.tar.gz"
        'disable_donation.diff')
sha256sums=('27059ebceccf8c79d88201b156debeda7a91d15dba589e624cb135f58deb217a'
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
