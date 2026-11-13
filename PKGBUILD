# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux
pkgdesc="AmneziaWG prebuilt kernel module for stock Arch linux (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20261113
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-dkms" "amneziawg-linux-hardened")
makedepends=("linux" "linux-headers")
_kernel=$(pacman -Q linux | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz")
sha512sums=('1f96f6c2ae243517a3bc8aa5e65e4172dcdd80e6dc9c754db29c11faf07d9d0555bb45900d3a7434eb167cf6642768cd88444a13ab572dd8d3ed0a5393cc5696'
            '43219cf7139b75f463eb98dcb13a17175d441c8d2d401162c6ef7a776d757f5def180c5b32e59c08abd5829b3582aa1f30b48caf1d3d829475967d4e2a9748dc')
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
