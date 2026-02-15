# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux-hardened
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20260210
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
makedepends=("linux-hardened" "linux-hardened-headers")
_kernel=$(pacman -Q linux-hardened | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel}.tar.xz")
sha512sums=('705fbbb13e5d2f456fb321942ecd404420c5e54c75fbd28b7fd34583c9d6b0ca3b63e3eb18ddbb49f34354ffa0c042745fe2a0c97946a4dab65b52ebc864d5b5'
            '91450681e4d07ba20f8dfd5863748d5bb190615c17ab31f27b65e2b70f2785d70a1be4e565efc956f971bedc9806344f680c584560e2f132f3190c6c888ba981')
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
