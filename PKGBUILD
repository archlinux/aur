# Maintainer: L <alaviss at gmail dot c o m>

pkgname=sachesi-git
_pkgname=Sachesi #no uppercase letter in pkgname
pkgver=2.0.0rc.r42.ga31f73b
pkgrel=1
pkgdesc="Firmware, extractor, searcher and installer for Blackberry 10"
arch=('i686' 'x86_64')
url="https://github.com/xsacha/Sachesi"
license=('GPL3')
depends=('qt5-declarative' 'quazip-qt5' 'libusb' 'lzo')
makedepends=('git' 'gendesk' 'qt5-quickcontrols' 'qt5-tools')
source=(git+https://github.com/xsacha/Sachesi.git)
sha1sums=('SKIP')
install=sachesi.install

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags --long | sed 's/-/.r/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake-qt5 CONFIG+="shared_lzo2 shared_quazip"
  make ${MAKEFLAGS}
}

package() {
  cd "${srcdir}/${_pkgname}"
  install -Dm755 Sachesi "${pkgdir}/usr/bin/Sachesi"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Generate desktop file
  gendesk --pkgname=${_pkgname} --pkgdesc="${pkgdesc}" -n
  install -Dm644 ${_pkgname}.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  rm ${_pkgname}.desktop
  install -Dm644 "assets/${pkgname%-git}.png" "$pkgdir/usr/share/pixmaps/${_pkgname}.png"
}
