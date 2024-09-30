# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20240213
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.a.*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-${_kernel}.tar.xz")
sha512sums=('bc7c871b545a405ecf108a6ac20c5719576b1d903f967b022a00e1a01c6b5b51a01c1ddebbf8c24c35a0dd9911c8913a8b4639797a1ed2ae15e0635c8efe180e'
            '329c1f94008742e3f0c2ce7e591a16316d1b2cb9ea4596d4f45604097e07b7aa2f64afa40630a07f321a858455c77aa32ba57b271932ddcf4dc27863f9081cea')
install="amneziawg-linux.install"

build() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    ln -s ${srcdir}/linux-${_kernel} kernel
    make
}

package() {
    cd ${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src
    install -Dm644 "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src/amneziawg.ko" "$pkgdir/usr/lib/modules/$(uname -r)/kernel/drivers/net/wireguard/amneziawg.ko"
}
