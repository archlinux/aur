# Maintainer: SanskritFritz (gmail)
# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eric Bélanger <eric@archlinux.org>
# Contributor: useraur111 (AUR)

pkgname=neverball
pkgver=1.6.0
pkgrel=5
pkgdesc="3D game similar to Super Monkey Ball or Marble Madness"
arch=('x86_64')
url="http://neverball.org/"
license=('GPL')
depends=('sdl2_ttf' 'libgl' 'libpng' 'libjpeg' 'libvorbis' 'physfs' \
         'hicolor-icon-theme' 'xdg-utils')
makedepends=('mesa')
source=(http://neverball.org/${pkgname}-${pkgver}.tar.gz
        neverball-filesystem.patch::"https://github.com/Neverball/neverball/commit/27279856.patch"
        neverball-gcc10.patch::"https://github.com/Neverball/neverball/commit/a42492b8db06934c7a794630db92e3ff6ebaadaa.patch")
sha256sums=('73fe63cca4f96e2d355480d03bc0b2904e83a0abdf65fe8c52db5cc3cca88fa0'
            'b93f17315766a8f1a70f46716cd99260981f4797ec1589b26f03bfca201a8e0d'
            '6bc37c97b9fbbdbcb890344d08a958b038b0333bc74230147b93d9be9341d89e')

prepare() {
  cd $pkgname-$pkgver
  patch -Np1 <../neverball-filesystem.patch # Fix creating settings dir
  patch -Np1 <../neverball-gcc10.patch # Fix building with -fno-common
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
