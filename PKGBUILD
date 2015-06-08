# Maintainer : Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xemeraldia
pkgver=0.4.3
pkgrel=3
pkgdesc="A Tetris-like falling blocks game"
arch=('i686' 'x86_64')
url="http://www.reloco.com.ar/xemeraldia/"
license=('custom')
depends=('gtk2')
install="${pkgname}.install"
source=("http://www.reloco.com.ar/xemeraldia/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('55cb4d5ea0564e535ba7f8cb48a915da'
         '07bce1f57787d183ddff76a27ab0bf34'
         'dd3bd79c141edeb1f81675d07b5a7c1a'
         '25c363a68262b112905dc59d0ad42909')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i "../${pkgname}.patch"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -dm775 -g games "${pkgdir}/var/lib/${pkgname}"

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme files and license
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 NEWS README* "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"

  # Install translations
  cd po
  make DESTDIR="${pkgdir}" install
}
