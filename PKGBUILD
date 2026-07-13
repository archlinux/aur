# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG is a contemporary version of the popular VPN protocol, WireGuard."
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20260611
pkgrel=2
license=('GPLv2')
provides=("AMNEZIAWG-MODULE=${pkgver}")
makedepends=("linux" "linux-headers")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz"
        "ipv6-stub-fix.patch::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/commit/2a764691e22f15770aa1551ecae12c0431dbd651.patch")
sha512sums=('3a99b7812b86087aa6f2c0af02a1c43aa6f540d025a1613d484930a99d3589c4ba2e6c2fb7f1b941357bf13855a56a220ff7c0688b22359f954b4dc689db0fdc'
            '1c5e7e16c73f4942dcdc1783987e65351259d1f2d4ff39c91182529e2f9e689b62b3df3ec89b61514c473eb13ecb004a3825716b9c583fc41e25fc01fe569b30'
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
