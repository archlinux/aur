# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=1.2.2
pkgrel=1
pkgdesc="Remote control and team work"
arch=('x86_64')
url="https://www.todesk.cn/"
license=('unknown')
depends=('libxtst'
         'freetype2')
makedepends=('tar')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
install="${_pkgname}.install"
source=("https://update.todesk.com/${_pkgname}_${pkgver}.deb")
sha256sums=('5fc963b659090d888e7abe64e554102557debd50d903d4cc8443e9708fc1e0b5')

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

  # binary & scripts
  install -Dm755 opt/${_pkgname}/${_pkgname} -t ${pkgdir}/opt/${_pkgname}/
  install -Dm755 opt/${_pkgname}/${_pkgname}d -t ${pkgdir}/opt/${_pkgname}/
  install -Dm755 opt/${_pkgname}/daemon.sh -t ${pkgdir}/opt/${_pkgname}/

  # qt.conf & todeskd.conf
  install -Dm644 opt/${_pkgname}/qt.conf -t ${pkgdir}/opt/${_pkgname}/
  install -Dm644 opt/${_pkgname}/${_pkgname}d.conf -t ${pkgdir}/opt/${_pkgname}/

  # desktop entry 
  install -Dm 644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  sed -i "s|Emulator;||g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # systemd service
  install -Dm644 etc/systemd/system/${_pkgname}d.service -t ${pkgdir}/usr/lib/systemd/system 

  # icon
  install -Dm 644 usr/share/pixmaps/${_pkgname}.png -t ${pkgdir}/usr/share/pixmaps
}

# vim: set sw=2 ts=2 et:
