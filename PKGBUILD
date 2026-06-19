# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux-hardened
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20260611
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
makedepends=("linux-hardened" "linux-hardened-headers")
_kernel=$(pacman -Q linux-hardened | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz")
sha512sums=('3a99b7812b86087aa6f2c0af02a1c43aa6f540d025a1613d484930a99d3589c4ba2e6c2fb7f1b941357bf13855a56a220ff7c0688b22359f954b4dc689db0fdc'
            '5c1df7992b8b78ba28b441a5efdb3fd8d07c2a0ce1421e42a409001dea4b8bdf1aa2bda26645439603c3a903a00d7dfa14324ad2f59f8131174c83d1a5da2f45')
install="amneziawg-linux-hardened.install"

build() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    ln -s ${srcdir}/linux-${_kernel} kernel
    make
}

package() {
#    depends=("linux-hardened=$(pacman -Q linux-hardened | awk '{print $2}')")
    depends+=("linux-hardened")
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    install -Dm644 "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src/amneziawg.ko" "$pkgdir/usr/lib/modules/$(ls /usr/lib/modules/ | grep hardened | sort -u | tail -1)/kernel/drivers/net/wireguard/amneziawg.ko"
}
