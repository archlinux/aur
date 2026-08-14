# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-linux-hardened
pkgdesc="AmneziaWG prebuilt kernel module for linux-hardened (AWG 3.1)"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=3.1.20260812
pkgrel=1
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
conflicts=("amneziawg-dkms" "amneziawg-linux")
makedepends=("linux-hardened" "linux-hardened-headers")
_kernel=$(pacman -Q linux-hardened | awk '{print $2}' | sed "s,.[a-zA-Z].*,,g")
source=("$pkgname-$pkgver.tar.gz::https://github.com/amnezia-vpn/amneziawg-linux-kernel-module/archive/refs/tags/v${pkgver}.tar.gz"
        "https://cdn.kernel.org/pub/linux/kernel/v7.x/linux-${_kernel}.tar.xz"
        "kernel-7.1.5-udp-tunnel.patch")
sha512sums=('2d53bcb822c3fe51e69c3167b1ffdb86b820b9f70f364d94e0c1ca8d131f91bc6b89db1a0fcfdefa5cc73580538d4b2c25586d66b7d5b7f86a3569d471a74a63'
            'e17057478fd498fd4d83c4b6d3712fdfc3c6ae1d077114ea74ee41186cbd75add292f5e5f810fdf41242fd506a476d34447392b1c8194b5e8a6af1a59ac48a74'
            '1847bd087dbf42e683a92df9933e2634d63e76492ae0936a9496d95cc2ad36991486270e72eefbf39b24263ccd414c543ec7c1af133f17846e88832a3a3510bb')
install="amneziawg-linux-hardened.install"

prepare() {
  cd "amneziawg-linux-kernel-module-${pkgver}"
  patch -Np1 -i "${srcdir}/kernel-7.1.5-udp-tunnel.patch"
}

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
