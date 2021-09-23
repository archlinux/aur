# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=3.2.2
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
source_armv7h=("https://dl.todesk.com/linux/${_pkgname}_${pkgver}_armv7.deb")
sha256sums_x86_64=('4fcf0805fa4a5cacccf46c24875ed96c42d360a9d68e85113121c9321f382c55')
sha256sums_aarch64=('297512e583f4d9d68ad0679e559200793dec32f3379c7becbffd0c035003e535')
sha256sums_armv7h=('7e998714285843d20d24ec8bea740ac84d368f7592a02fac0940fc8b0b1ed8f7')

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
