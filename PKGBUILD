# Maintainer: Davide Depau <davide@depau.eu>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=neverball-git
pkgver=1.6.0.r154.gc1f75922
pkgrel=1
pkgdesc="3D game similar to Super Monkey Ball or Marble Madness"
arch=('x86_64')
url="http://neverball.org/"
license=('GPL')
depends=('sdl2_ttf' 'libgl' 'libpng' 'libjpeg' 'libvorbis' 'physfs' \
         'hicolor-icon-theme' 'xdg-utils')
makedepends=('mesa')
source=("${pkgname}::git+https://github.com/Neverball/neverball.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  # cutting off 'foo-' prefix that presents in the git tag
  git describe --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/neverball[.]//g'
}

build() {
  cd ${pkgname}
  make DATADIR=/usr/share/neverball LOCALEDIR=/usr/share/locale \
    CPPFLAGS="$CPPFLAGS -DNDEBUG" CFLAGS="$CFLAGS"
}

package(){
  cd ${pkgname}
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
