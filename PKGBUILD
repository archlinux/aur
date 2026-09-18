# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG prebuilt kernel module for stock Arch linux (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260906
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-dkms" "amneziawg-linux-hardened")
makedepends=("linux" "linux-headers")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz")
sha512sums=('30c0571c1c9954dc4d0dfded4238cf2daf3ed4beb4579047fec4fd92a8ad522db930c7f5454ceca6ae77951008ac0805a17bc569a78afdec32b14410bbdfaadf'
            '2bdcc46f2fb4368aace87b8d063ee50ba93e763f31b1b2401abe2109371bd7ccc1432d0d07159f00f0fc5dbe2e1953ade1d9973bcf4fbc73aaaf056d99652e67')
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
