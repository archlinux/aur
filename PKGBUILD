# Maintainer:
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=neverball
pkgver=1.6.0
pkgrel=3
pkgdesc="3D game similar to Super Monkey Ball or Marble Madness"
arch=('x86_64')
url="http://neverball.org/"
license=('GPL')
depends=('sdl2_ttf' 'libgl' 'libpng' 'libjpeg' 'libvorbis' 'physfs' \
         'hicolor-icon-theme' 'xdg-utils')
makedepends=('mesa')
source=(http://neverball.org/${pkgname}-${pkgver}.tar.gz
        neverball-filesystem.patch::"https://github.com/Neverball/neverball/commit/27279856.patch")
sha1sums=('3faebf15fea9361358a416176b9689f966c456ea'
          '715d3ce441bd5835175fd1703addb61f71603d8c')

prepare() {
  cd $pkgname-$pkgver
  patch -p1 -i ../neverball-filesystem.patch # Fix creating settings dir
}

build() {
  cd ${pkgname}-${pkgver}
  make DATADIR=/usr/share/neverball LOCALEDIR=/usr/share/locale \
    CPPFLAGS="$CPPFLAGS -DNDEBUG" CFLAGS="$CFLAGS"
}

package(){
  cd ${pkgname}-${pkgver}
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}"/usr/share/{neverball,locale,applications,doc/neverball}
  install -d "${pkgdir}"/usr/share/man/man{1,6}

  install -m755 neverball neverputt mapc "${pkgdir}/usr/bin"
  cp -r locale/* "${pkgdir}/usr/share/locale/"
  cp -r data/* "${pkgdir}/usr/share/neverball/"
  cp -r doc/* "${pkgdir}/usr/share/doc/neverball/"
  install -m644 dist/*.desktop "${pkgdir}/usr/share/applications/"
  install -m644 dist/mapc.1 "${pkgdir}/usr/share/man/man1"
  install -m644 dist/{neverball.6,neverputt.6} "${pkgdir}/usr/share/man/man6"

  for i in 16 24 32 48 64 128 256 512; do
    install -D -m644 dist/neverball_$i.png "${pkgdir}/usr/share/icons/hicolor/${i}x$i/apps/neverball.png"
    install -D -m644 dist/neverputt_$i.png "${pkgdir}/usr/share/icons/hicolor/${i}x$i/apps/neverputt.png"
  done

  chmod -R u=rwX,go=rX "${pkgdir}/usr/share/neverball"
}
