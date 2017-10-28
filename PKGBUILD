# Maintainer: GSI <2017 at groovy-skills dot com>
# Contributor: Saren Arterius <saren at wtako dot net>
# Contributor: Hui Yiqun <huiyiqun at gmail dot com>
pkgname=xmr-stak-nvidia-git
pkgver=r38.915ed85
pkgrel=1
pkgdesc="Monero Miner (NVIDIA)"
arch=('x86_64')
url="https://github.com/nicehash/xmr-stak-nvidia"
license=('GPL3')
makedepends=('git' 'cmake')
depends=('libmicrohttpd' 'openssl' 'cuda')
source=('git+https://github.com/fireice-uk/xmr-stak-nvidia.git'
        'no-donate.patch')
sha256sums=('SKIP'
            'b936a4db91f4c35e5ff0ac51c4c1590493ddf6427a82dd0e1f57ef931950e46f')


pkgver() {
    cd "$srcdir/xmr-stak-nvidia"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/xmr-stak-nvidia"
    #patch -p1 -i ../../no-donate.patch
}

build() {
    cd "$srcdir/xmr-stak-nvidia"

    # CUDA 9 lacks support for architectures 20 and 21. Explicitly naming the remaining ones:
    CC=/usr/bin/gcc-6 CXX=/usr/bin/g++-6 cmake . -DCUDA_COMPILER="nvcc" -DCUDA_ARCH="30;32;35;37;50;52;53;60;61;62"
    make
}

package() {
    install -D -m755 "$srcdir/xmr-stak-nvidia/bin/xmr-stak-nvidia" -t "$pkgdir/usr/bin/"
    install -D -m644 "$srcdir/xmr-stak-nvidia/config.txt" "$pkgdir/etc/xmr-stak-nvidia.json"
}
