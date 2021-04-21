# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgbase=autodesk-nlm
pkgname=(autodesk-nlm autodesk-lmgrd)
pkgver=11.18.0.0
pkgrel=1
pkgdesc="FLEXnet License Manager (lmgrd) + Autodesk® vendor daemon (adskflex)"
arch=(x86_64)
url="https://knowledge.autodesk.com/customer-service/network-license-administration"
license=(custom:'¯\_(ツ)_/¯')
depends=('gcc-libs' 'ld-lsb')
source=("https://knowledge.autodesk.com/sites/default/files/file_downloads/nlm${pkgver}_ipv4_ipv6_linux64.tar.gz"
        "lmgrd.service")
md5sums=('d0c9685121f5fa31c58febb7f1fe27f5'
         '6c3e1e09dc14b42eac9c5a83d91174ba')
sha256sums=('a5b5b294b1108cff8e785777c4f5c849e13a87eb2d063b36986daa6f5f2aa4fb'
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
  utils=(lmborrow lmborrowl lmdiag lmdown lmhostid lminstall lmlicvalidator
         lmnewlog lmpath lmremove lmreread lmswitch lmswitchr lmstat lmtpminfo
         lmver lmvminfo)
  for bin in ${utils[@]}; do
    ln -s lmutil "$pkgdir"/usr/bin/$bin
  done

  mkdir -p "$pkgdir"/usr/lib/systemd/system
  install -m 644 lmgrd.service "$pkgdir"/usr/lib/systemd/system/lmgrd.service
}

# vim: ts=2:sw=2:et:
