# Maintainer: yjun <jerrysteve1101@gmail.com>

pkgname=todesk-bin
_pkgname=${pkgname%-bin}
pkgver=1.1.0c
pkgrel=2
pkgdesc="Remote control and team work"
arch=('x86_64')
url="https://www.todesk.cn/"
license=('custom' )
makedepends=('tar')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
source=("${_pkgname}-${pkgver}.deb::https://update.todesk.com/${_pkgname}Beta_${pkgver}.deb")
sha256sums=('0d93806f7275be5487ed91fe4cfc4deea452a07508d4046a17f8ea7592905735')

prepare() {
  install -dm 755 ${srcdir}/${_pkgname}

  tar --owner=root --group=root -xf ${srcdir}/data.tar.xz -C ${srcdir}/${_pkgname} 
}

package() {
  cd ${srcdir}/${_pkgname}/

  # binary wrapper
  install -Dm 755 usr/local/bin/${_pkgname} -t ${pkgdir}/usr/bin/

  # lib
  find opt/${_pkgname}/lib     -type f -exec install -Dm644 {} ${pkgdir}/{} \;
  find opt/${_pkgname}/plugins -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # font
  find opt/${_pkgname}/res     -type f -exec install -Dm644 {} ${pkgdir}/{} \;

  # binary
  install -Dm755 opt/${_pkgname}/${_pkgname} -t ${pkgdir}/opt/${_pkgname}/

  # qt.conf
  install -Dm644 opt/${_pkgname}/qt.conf -t ${pkgdir}/opt/${_pkgname}/

  # desktop entry 
  install -Dm 644 usr/share/applications/${_pkgname}.desktop -t ${pkgdir}/usr/share/applications
  sed -i "s|Emulator;||g" ${pkgdir}/usr/share/applications/${_pkgname}.desktop

  # icon
  install -Dm 644 usr/share/pixmaps/${_pkgname}.png -t ${pkgdir}/usr/share/pixmaps
}

# vim: set sw=2 ts=2 et:
