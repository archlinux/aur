# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=autodesk-nlm
pkgver=11.14.1.3
pkgrel=1
pkgdesc="FLEXnet License Manager (lmgrd) + Autodesk® vendor daemon (adskflex)"
arch=(x86_64)
url="https://knowledge.autodesk.com/customer-service/network-license-administration"
license=(custom:'¯\_(ツ)_/¯')
depends=('gcc-libs' 'ld-lsb')
provides=("flexnet=$pkgver") # well, not for ARM...
conflicts=('flexnet')
source=("https://knowledge.autodesk.com/sites/default/files/file_downloads/nlm11.14.1.3_ipv4_ipv6_linux64.tar.gz"
        "lmgrd.service")
md5sums=('77964c1c86b3e13979306f1840a05425'
         '6c3e1e09dc14b42eac9c5a83d91174ba')
sha256sums=('6c659f9908ec2477a935f977cc036664ee5172b8c8849e32218da6faa4134244'
            '10fdaa80006dabba99cdd1ea754043812fb66f8f6ea9ce08998932e1ea6a5086')

prepare() {
  bsdtar xvf "nlm${pkgver}_ipv4_ipv6_linux64.rpm"
}

package() {
  mkdir -p "$pkgdir"/usr/lib
  cp -a opt/flexnetserver "$pkgdir"/usr/lib/flexnetserver

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
