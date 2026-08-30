# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG prebuilt kernel module for stock Arch linux (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260828
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-dkms" "amneziawg-linux-hardened")
makedepends=("linux" "linux-headers")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz")
sha512sums=('8465b554955363d3a0702208d7ee39d3b38baaa87d4031e1f5a87196df382c7edc674aaa47a6a97590c006b73183feb725a7e451e5c7939a1d13808f7f3568a6'
            '3ac4da40f16fe16ad628b073f0d80488098dce68fecb0a413b0091786dd2487fb0a571d648f4c6172d4a094fe8b677042c10179aa074fb7c7948100180067260')
install="amneziawg-linux.install"

build() {
  cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src"
  ln -sfn "${srcdir}/linux-${_kernel}" kernel
  make
}

package() {
  depends+=("linux")
  cd "${srcdir}/amneziawg-linux-kernel-module-${pkgver}/src"
  local _kver
  _kver=$(ls /usr/lib/modules/ | grep -- '-arch' | sort -V | tail -1)
  install -Dm644 amneziawg.ko \
    "${pkgdir}/usr/lib/modules/${_kver}/kernel/drivers/net/wireguard/amneziawg.ko"
}
