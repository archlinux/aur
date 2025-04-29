# Maintainer: Konstantin Shurukhin <kshurukhin (at)gmail(dot)com>

pkgname=rtw89bt-dkms-git
pkgver=5.15.0.r40.g101e29a
pkgrel=1
pkgdesc="Out-of-kernel driver for Realtek BT devices found in rtw89 devices (8852AE, RTW8852BE, RTW8852CE). Kernel >= 5.15.0"
arch=('i686' 'x86_64')
url="https://github.com/lwfinger/rtw89-BT"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'sed' 'awk')
conflicts=("${pkgname}")
source=("git+https://github.com/lwfinger/rtw89-BT.git")
sha256sums=('SKIP')
pkgver() {
  cd ${srcdir}/rtw89-BT
  printf '%s.r%s.g%s' '5.15.0' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/rtw89-BT
  read MAJOR_VERSION MINOR_VERSION <<<$(uname -r | awk -F '.' '{print $1, $2}')
  if [ $MAJOR_VERSION -ge 6 ] && [ $MINOR_VERSION -ge 12 ] || [ $MAJOR_VERSION -ge 7 ]; then
    printf '\e[1;33m%-6s\e[m\n' "Patching sources for compatibility with Kernel headers version >= 6.12"
    for f in $(grep 'asm.unaligned.h' -rl *); do
      sed -i 's|asm/unaligned.h|linux/unaligned.h|g' $f
    done
  fi
  mkdir -p ${pkgdir}/usr/src/${pkgname}-${pkgver}
  cp -pr * ${pkgdir}/usr/src/${pkgname}-${pkgver}
  cp ${srcdir}/rtw89-BT/debian/rtw89bt-dkms.dkms ${pkgdir}/usr/src/${pkgname}-${pkgver}/dkms.conf
}
