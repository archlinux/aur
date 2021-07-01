# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=2.0.2
pkgrel=2
pkgdesc="Remote control and team work"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://www.todesk.com/"
license=('unknown')
depends=('gtk3')
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
sha256sums_x86_64=('dd6d811e0f4350ec9b4dd8623579b5e686e2505c0952ae1736ceb8bd7b0ace70')
sha256sums_aarch64=('90fcde5dd7c772272606ab6be81665c0929ae7ec143d7ced09928164c660cab9')
sha256sums_armv7h=('1134f180d01d7c5eb392f936582e99c10a133ddd6335f17ca5f51925b932674c')

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
  # find opt/${_pkgname}/plugins -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # font & icon
  find opt/${_pkgname}/res     -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # config 
  # empty dir
  install -dm755 ${pkgdir}/opt/${_pkgname}/config

  # binary & scripts
  install -Dm755 opt/${_pkgname}/bin/${_pkgname} -t ${pkgdir}/opt/${_pkgname}/bin
  install -Dm755 opt/${_pkgname}/bin/${_pkgname}d -t ${pkgdir}/opt/${_pkgname}/bin
  install -Dm755 opt/${_pkgname}/bin/${_pkgname}c -t ${pkgdir}/opt/${_pkgname}/bin

  # qt.conf 
  # install -Dm644 opt/${_pkgname}/bin/qt.conf -t ${pkgdir}/opt/${_pkgname}/bin

  # desktop entry 
  install -Dm644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications

  # systemd service
  install -Dm644 etc/systemd/system/${_pkgname}d.service -t ${pkgdir}/usr/lib/systemd/system 

  # icon
  # install -Dm644 usr/share/pixmaps/${_pkgname}.png -t ${pkgdir}/usr/share/pixmaps
  find usr/share/icons -type f -exec install -Dm644 {} ${pkgdir}/{} \;

}
# vim: set sw=2 ts=2 et:
