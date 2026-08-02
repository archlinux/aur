# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.0.20260731
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
makedepends=("linux" "linux-headers")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz"
        "ipv6-stub-fix.patch::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/commit/2a764691e22f15770aa1551ecae12c0431dbd651.patch")
sha512sums=('39fb2cb3ba7844c7c39fa0d4f41a07f61bd40d66582d69aa34065ef539b81b6b476a0ec97228e424f886708a9d8074763e101d7d8a79ef95dee55d79d44201e4'
            '17f95307b6e86a0794df146d97256ba4783b7a494f5eb43aafc14d64367541874cec7f6e8c2ea724eca149db18e4bd5880bf28a8c5e47ae8a769776bbd955af8'
            'cc7f9d303e6a8387e0682383585391be4b1c2f355129b7b7b4383c898d341f685e466f5c7f6b3ae8bfd724afcc00899baece980f0b6bc039ac300119f2d21243')
install="amneziawg-linux.install"

prepare() {
	_linux=$(pacman -Q linux | awk '{print $2}')
	cd "amneziawg-linux-kernel-module-${pkgver}"
	patch -Np1 -i "$srcdir/ipv6-stub-fix.patch"
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
