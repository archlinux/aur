# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgbase=autodesk-nlm
pkgname=(autodesk-nlm autodesk-lmgrd)
pkgver=11.16.2.0
pkgrel=2
pkgdesc="FLEXnet License Manager (lmgrd) + Autodesk® vendor daemon (adskflex)"
arch=(x86_64)
url="https://knowledge.autodesk.com/customer-service/network-license-administration"
license=(custom:'¯\_(ツ)_/¯')
depends=('gcc-libs' 'ld-lsb')
source=("https://knowledge.autodesk.com/sites/default/files/file_downloads/nlm11.16.2.0_ipv4_ipv6_linux64.tar.gz"
        "lmgrd.service")
md5sums=('b97dafa3a2b748e54951d8ac0f06bd44'
         '6c3e1e09dc14b42eac9c5a83d91174ba')
sha256sums=('5ca7e70c81859273554f8c474c8befe550a0370253f18fe90e1efaa23fa9fd5d'
            '10fdaa80006dabba99cdd1ea754043812fb66f8f6ea9ce08998932e1ea6a5086')

prepare() {
  bsdtar xvf "nlm${pkgver}_ipv4_ipv6_linux64.rpm"
}

package_autodesk-nlm() {
  pkgdesc="Autodesk® vendor daemon (adskflex) for FLEXnet License Manager"
  optdepends=("autodesk-lmgrd: FLEXnet License Manager core (lmgrd) distributed by Autodesk"
              "flexnet: FLEXnet License Manager core (lmgrd) distributed by Arm"
              "lmgrd: FLEXnet License Manager core (lmgrd) distributed by MATLAB")

  mkdir -p "$pkgdir"/usr/lib/flexnetserver
  cp -a opt/flexnetserver/adskflex "$pkgdir"/usr/lib/flexnetserver/adskflex
}

package_autodesk-lmgrd() {
  pkgdesc="FLEXnet License Manager (lmgrd) distributed by Autodesk"
  provides=("flexnet=$pkgver" "lmgrd=$pkgver") # well, not for ARM...
  conflicts=("flexnet" "lmgrd")
  optdepends=("autodesk-nlm: Autodesk licensing vendor daemon (adskflex)")

  mkdir -p "$pkgdir"/usr/lib
  cp -a opt/flexnetserver "$pkgdir"/usr/lib/flexnetserver
  rm -f "$pkgdir"/usr/lib/flexnetserver/adskflex

  mkdir -p "$pkgdir"/usr/bin
  ln -s ../lib/flexnetserver/lmutil "$pkgdir"/usr/bin/lmutil
  utils=(lmborrow lmdiag lmdown lmhostid lminstall lmnewlog lmpath
         lmremove lmreread lmswitchr lmstat lmswitch lmver lmvminfo)
  for bin in ${utils[@]}; do
    ln -s lmutil "$pkgdir"/usr/bin/$bin
  done

  mkdir -p "$pkgdir"/usr/lib/systemd/system
  install -m 644 lmgrd.service "$pkgdir"/usr/lib/systemd/system/lmgrd.service
}

# vim: ts=2:sw=2:et:
