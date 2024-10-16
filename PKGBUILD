# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux-hardened
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20240711
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
depends=("linux-hardened=$(pacman -Q linux-hardened | awk '{print $2}')" "linux-hardened-headers=$(pacman -Q linux-hardened-headers | awk '{print $2}')")
_kernel=$(pacman -Q linux-hardened | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel}.tar.xz")
sha512sums=('0499fc3c29ceaa3e57611fd86c943e57b9621aa2db31f8fdafcfe0ff0dfaf5aa07381d462d9b194c8ea206f5eb9d1160976bfc6d0fdaf112b81b87ad3d391538'
            'SKIP')
install="amneziawg-linux-hardened.install"

build() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    ln -s ${srcdir}/linux-${_kernel} kernel
    make
}

package() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    install -Dm644 "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src/amneziawg.ko" "$pkgdir/usr/lib/modules/$(ls /usr/lib/modules/ | grep hardened | sort -u | tail -1)/kernel/drivers/net/wireguard/amneziawg.ko"
}
