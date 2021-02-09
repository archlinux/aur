# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=1.2.4d
pkgrel=1
pkgdesc="Remote control and team work"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.todesk.cn/"
license=('unknown')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# !strip: strip could generate error.
# ---> 
# strip: error: the input file './opt/todesk/bin/todeskc' has no sections
#
# emptydirs: leave /opt/todesk/config empty dir
options=('!strip' 'emptydirs')
install="${_pkgname}.install"
source_x86_64=("https://update.todesk.com/linux/${_pkgname}_${pkgver}_amd64.deb")
source_aarch64=("https://update.todesk.com/linux/${_pkgname}_${pkgver}_aarch64.deb")
source_armv7h=("https://update.todesk.com/linux/${_pkgname}_${pkgver}_armv7.deb")
sha256sums_x86_64=('ea82cdf8dd0439a7282a3f50b4fab8b95fbd873e68be5e9ef1bfd68c93a1e691')
sha256sums_aarch64=('1131532d3e6b8d0ebc2d9ea792d9eee37925f2b1f74259ceeb362a9e66e77498')
sha256sums_armv7h=('e79cd6063baedce0326f90376114b7453964c7b22886e8467d5b846df238d26a')

build() {
  mkdir -p ${srcdir}/build

  tar -xf ${srcdir}/data.tar.xz -C ${srcdir}/build 
}

package() {
  cd ${srcdir}/build/

  # binary wrapper
  install -Dm 755 usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/

  # lib
  find opt/${_pkgname}/lib     -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  find opt/${_pkgname}/plugins -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # font
  find opt/${_pkgname}/res     -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # config 
  # empty dir
  install -dm755 ${pkgdir}/opt/${_pkgname}/config

  # binary & scripts
  install -Dm755 opt/${_pkgname}/bin/${_pkgname} -t ${pkgdir}/opt/${_pkgname}/bin
  install -Dm755 opt/${_pkgname}/bin/${_pkgname}d -t ${pkgdir}/opt/${_pkgname}/bin
  install -Dm755 opt/${_pkgname}/bin/${_pkgname}c -t ${pkgdir}/opt/${_pkgname}/bin

  # qt.conf 
  install -Dm644 opt/${_pkgname}/bin/qt.conf -t ${pkgdir}/opt/${_pkgname}/bin

  # desktop entry 
  install -Dm 644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # systemd service
  install -Dm644 etc/systemd/system/${_pkgname}d.service -t ${pkgdir}/usr/lib/systemd/system 

  # icon
  install -Dm 644 usr/share/pixmaps/${_pkgname}.png -t ${pkgdir}/usr/share/pixmaps
}
# vim: set sw=2 ts=2 et:
