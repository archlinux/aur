# Maintainer: Vladislav Minakov <v@minakov.pro>

pkgname=amneziawg-dkms
pkgdesc="AmneziaWG kernel module with AWG 3.0 (Header Protection) + kernel 7.1 fixes"
url="https://github.com/amnezia-vpn/amneziawg-linux-kernel-module"
arch=("x86_64")
pkgver=1.0.20260728.r1350.86b4403
pkgrel=2
license=('GPLv2')
provides=("AMNEZIAWG-MODULE")
source=("git+https://github.com/amnezia-vpn/amneziawg-linux-kernel-module.git#branch=feat/awg3"
        "kernel-7.1-compat.patch"
        "awg3-keepalive-nla-u32.patch")
sha256sums=('SKIP'
            '79531d6ba515395ef4abbe96196fa5fb39b29163629cbd742223bbc21efa233a'
            'a06885a1719735d12a8cd4315113b67ea023c96ad7cfd9808c741a492377998d')
makedepends=("git")
conflicts=("amneziawg-linux" "amneziawg-linux-hardened")

pkgver() {
  cd amneziawg-linux-kernel-module
  printf "1.0.20260728.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd amneziawg-linux-kernel-module
  patch -Np1 -i "${srcdir}/kernel-7.1-compat.patch"
  patch -Np1 -i "${srcdir}/awg3-keepalive-nla-u32.patch"
  sed -i 's/MODERN_KERNEL_SOURCES_NOT_FOUND_ERROR/KERNEL_SRC_ABSENT_ERR/g' src/Makefile
}

package() {
  depends+=("dkms")
  cd amneziawg-linux-kernel-module/src
  make DESTDIR="${pkgdir}" dkms-install
}
