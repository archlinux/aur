# Maintainer: Anton Bazhenov <anton.bazhenov at gmail>

pkgname=xtetris
pkgver=2.6
pkgrel=2
pkgdesc="A classical tetris game for X11"
arch=('i686' 'x86_64')
url="http://happypenguin.org/show?XTetris"
license=('custom')
depends=('libxaw' 'xbitmaps')
makedepends=('imake')
install="${pkgname}.install"
source=("http://www.ibiblio.org/pub/Linux/games/arcade/tetris/${pkgname}-${pkgver}.tar.gz"
        "${pkgname}.patch"
        "${pkgname}.png"
        "${pkgname}.desktop")
md5sums=('9547dd17d0e53e295dd61f794b7acdb2'
         '50f4ac4b36845da03e2a7e3757696a2c'
         '98f0495078541db455b5fc5da896b83b'
         'ebdda0c5f9dfd764cbc59e77a6f664b8')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "../${pkgname}.patch"
  xmkmf
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install game files
  make DESTDIR="${pkgdir}" \
       ETCX11DIR="/usr/share/X11" \
       LIBDIR="/usr/share/${pkgname}" \
       MANDIR="/usr/share/man/man6/" \
       MANSUFFIX=6 \
       SCOREFLAGS="-m664 -g games" \
       install install.man

  # Install pixmap and .desktop file
  install -Dm644 "../${pkgname}.png" "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "../${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # Install readme and license
  install -Dm644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
  install -Dm644 COPYRIGHT "${pkgdir}/usr/share/licenses/${pkgname}/COPYING"
}

# vim:set ts=2 sw=2 et:
