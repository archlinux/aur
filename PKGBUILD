# Maintainer: yjun <jerrysteve1101 at gmail dot com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=4.0.1
pkgrel=1
pkgdesc="Remote control and team work"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.todesk.com/"
license=('unknown')
depends=('gtk3')
optdepends=("noto-fonts-cjk: Chinese display support")
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# !strip: strip could generate error.
# ---> 
# strip: error: the input file './opt/todesk/bin/todesk' has no sections
# strip: error: the input file './opt/todesk/bin/todeskd' has no sections
#
# emptydirs: leave /opt/todesk/config empty dir
options=('!strip' 'emptydirs')
install="${_pkgname}.install"
source_x86_64=("https://dl.todesk.com/linux/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://dl.todesk.com/linux/${_pkgname}_${pkgver}_aarch64.deb")
source_armv7h=("https://dl.todesk.com/linux/${_pkgname}_${pkgver}_armv7l.deb")
sha256sums_x86_64=('4a0903088d3067c28e97dc1593ce4f6b48c48194f3b46f82bad53be2839bb0f7')
sha256sums_aarch64=('b9dc79c058341b1a5fa981930ec1c9f989212ac8b8f03cc7e4d93491601b8805')
sha256sums_armv7h=('5c53ac2f8e2ff099649c55f0b925d71b02af32190fe2c5e475aa05282ec16a35')

_install() {
  find ${@: 2} -type f -exec install -Dm$1 {} ${pkgdir}/{} \;
}

build() {
  mkdir -p ${srcdir}/build

  tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/build 
}

package() {
  cd ${srcdir}/build/

  # binary wrapper
  install -Dm755 usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/

  # lib
  # find opt/${_pkgname}/lib     -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  _install 644 opt/${_pkgname}/lib

  # icon
  # find opt/${_pkgname}/res -maxdepth 1 -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  _install 644 opt/${_pkgname}/res -maxdepth 1

  # config 
  # empty dir
  install -dm755 ${pkgdir}/opt/${_pkgname}/config

  # binary & scripts
  install -Dm755 opt/${_pkgname}/bin/${_pkgname}{,c,d} -t ${pkgdir}/opt/${_pkgname}/bin

  # desktop entry 
  install -Dm644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # systemd service
  install -Dm644 etc/systemd/system/${_pkgname}d.service -t ${pkgdir}/usr/lib/systemd/system 

  # icon
  # find usr/share/icons -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  _install 644 usr/share/icons
}
# vim: set sw=2 ts=2 et:
