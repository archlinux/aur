# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=rott-svn
pkgver=1.1.2.r287
pkgrel=1
pkgdesc='"Rise of the Triad" is a high quality first-person perspective 3D action game (development version)'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('svn')
depends=('sdl_mixer')
url="http://icculus.org/rott/"
source=(rott::"svn://svn.icculus.org/rott/trunk")
sha256sums=('SKIP')

pkgver() {
  cd rott
  local ver="$(svnversion)"
  printf "1.1.2.r%s" "${ver//[[:alpha:]]}" # TODO: fix hardcoded version
}

build() {
  cd rott
  autoreconf -fi
  ./configure --enable-suffix=registered
  make

  ./configure --enable-shareware --enable-suffix=shareware
  make
}

package() {
  cd rott
  # copy both editions and launcher
  install -Dm755 rott/rott-registered "$pkgdir"/usr/bin/rott
  install -m755 rott/rott-shareware "$pkgdir"/usr/bin
  install -m755 misc/runrott.sh "$pkgdir"/usr/bin/runrott
  # doc
  install -Dm644 doc/rott.6 "$pkgdir"/usr/share/man/man6/rott.6
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.txt "$pkgdir"/usr/share/doc/$pkgname
  # .desktop entry
  install -Dm644 misc/rott.png "$pkgdir"/usr/share/pixmaps/rott.png
  install -Dm644 misc/rott.desktop "$pkgdir"/usr/share/applications/rott.desktop
}
