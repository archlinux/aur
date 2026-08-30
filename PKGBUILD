# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux-hardened
pkgdesc="AmneziaWG prebuilt kernel module for linux-hardened (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260828
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-dkms" "amneziawg-linux")
makedepends=("linux-hardened" "linux-hardened-headers")
_kernel=$(pacman -Q linux-hardened | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz")
sha512sums=('8465b554955363d3a0702208d7ee39d3b38baaa87d4031e1f5a87196df382c7edc674aaa47a6a97590c006b73183feb725a7e451e5c7939a1d13808f7f3568a6'
            'b139d559aba45cebd69d9172372f11d9d30e95008f0d721f160352390c91b5e42955c66c0e725f9eab461165e51f6685d0402e5349624b9e4d48eb6f166413be')
install="amneziawg-linux-hardened.install"

build() {
  cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src"
  ln -sfn "${srcdir}/linux-${_kernel}" kernel
  make
}

package() {
  depends+=("linux-hardened")
  cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src"
  local _kver
  _kver=$(ls /usr/lib/modules/ | grep -- 'hardened' | sort -V | tail -1)
  install -Dm644 amneziawg.ko \
    "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireguard/amneziawg.ko"
}
