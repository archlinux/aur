# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20241023
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
depends=("linux=$(pacman -Q linux | awk '{print $2}')" "linux-headers=$(pacman -Q linux-headers | awk '{print $2}')")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel}.tar.xz")
sha512sums=('2154f749d91adc2be185a02b58a6b20a079b3985277b8cb874b4affda00bfaabe949e01088c157d71e7d4a6e2e073f07e9dc370d8165465156f30ed8c9178a25'
            '532432967a1b343408be7764be67fd47dea28f41385efb6cba93f7039bf19e75027a59c53eb3752b32863d20f334e25d8dfe68237bc5449682d18eb2b7d0ea86')
install="amneziawg-linux.install"

build() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    ln -s ${srcdir}/linux-${_kernel} kernel
    make
}

package() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    install -Dm644 "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src/amneziawg.ko" "$pkgdir/usr/lib/modules/$(ls /usr/lib/modules/ | grep arch | sort -u | tail -1)/kernel/drivers/net/wireguard/amneziawg.ko"
}
