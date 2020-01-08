# Maintainer: GSI <2017 at groovy-skills dot com>
# Contributor: Saren Arterius <saren at wtako dot net>
# Contributor: Hui Yiqun <huiyiqun at gmail dot com>
pkgname=xmr-stak-nvidia-git
pkgver=r1457.67cf951
pkgrel=1
pkgdesc="Monero Miner (NVIDIA)"
arch=('x86_64')
url="https://github.com/fireice-urk/xmr-stak"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'cuda' 'hwloc')
source=('git+https://github.com/fireice-uk/xmr-stak.git')
sha512sums=('SKIP')


pkgver() {
    cd "$srcdir/xmr-stak"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/xmr-stak"

    mkdir build
    cd build

    # https://github.com/fireice-uk/xmr-stak/blob/master/doc/compile/compile_Linux.md
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
        -DCUDA_ENABLE=ON

    make
}

package() {
    cd "xmr-stak/build"
    make DESTDIR="$pkgdir/" install
}
