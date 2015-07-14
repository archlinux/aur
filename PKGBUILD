# Maintainer Jens Staal <staal1978@gmail.com>
# Big thanks to ids1024 !
# old maintainer Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xbic
pkgver=1.0
pkgrel=1
pkgdesc="A tactical turn-based game based on the Battle Isle series"
arch=('i686' 'x86_64')
url="http://www.ibiblio.org/pub/Linux/games/strategy"
license=('GPL2')
depends=('libpng' 'qt5-base')
source=("http://www.ibiblio.org/pub/Linux/games/strategy/${pkgname}-${pkgver}.tgz"
        "${pkgname}.png"
        "${pkgname}.desktop"
        "${pkgname}.sh"
        "qt2to4.patch"
        "qstring-qt5.patch")
md5sums=('d6116030331749a1da67d4bc2dc756b1'
         '52fad6ae9e03dcfc1efb58f05d391e31'
         '794d58f764c172b1c8574ebb18fd6a02'
         '4d412141ddaf38f927e2f13565f6b5cc'
         '94c0b52a27c6083a285302d5ec2a1556'
         '29b14f248a8379556f23137712709c68')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}_qtlib2/src"

  # Apply patches to fix compilation issues
  patch -Np2 -i ../../qt2to4.patch
  patch -Np2 -i ../../qstring-qt5.patch

  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}_qtlib2"

  # Install game files
  mkdir -p "${pkgdir}/opt/${pkgname}"
  cp -r anim bin level* pics start_game "${pkgdir}/opt/${pkgname}"

  # Install a launcher
  install -Dm755 ../${pkgname}.sh "${pkgdir}/usr/bin/${pkgname}"

  # Install a desktop entry
  install -Dm644 ../${pkgname}.png "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 ../${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install documentation
  mkdir -p "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 README* "${pkgdir}/usr/share/doc/${pkgname}"
}
