# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20251009
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
makedepends=("linux" "linux-headers")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel}.tar.xz")
sha512sums=('1c807df0e54fa79f50c055229fe75a4289febd272c304528f5cfe57271aecfe2fb5a8c4480c82f527e1b0272bfae73e03b5b06119769e98d37bb4df65844f2ff'
        'SKIP')
install="amneziawg-linux.install"

prepare() {
    _linux=$(pacman -Q linux | awk '{print $2}')
}

build() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    ln -s ${srcdir}/linux-${_kernel} kernel
    make
}

package() {
#    depends+=("linux=$_linux")
    depends+=("linux")
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    install -Dm644 "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src/amneziawg.ko" "$pkgdir/usr/lib/modules/$(ls /usr/lib/modules/ | grep arch | sort -u | tail -1)/kernel/drivers/net/wireguard/amneziawg.ko"
}
