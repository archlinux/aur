# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=rott-svn
pkgver=1.1.2.r278
pkgrel=1
pkgdesc='"Rise of the Triad" is a high quality first-person perspective 3D action game (development version)'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('svn')
depends=('sdl_mixer')
url="http://icculus.org/rott/"
source=(rott::"svn://svn.icculus.org/rott/trunk"
        "rott.sh")
sha256sums=('SKIP'
            '19f5c5ccf4b6bd592a8e119f8172a0cb180caf1ab831b820786000dbeaf9651e')

pkgver() {
  cd rott
  local ver="$(svnversion)"
  printf "1.1.2.r%s" "${ver//[[:alpha:]]}" # TODO: fix hardcoded version
}

build() {
  cd rott
  # We can not just build all editions, because of a Makefile quirk. Object files will overlap when parallel building is used (-j2).
  # You can choose your edition(s) here:
  make rott-huntbgin # shareware
  make rott-darkwar  # commercial
  make rott-rottcd   # cd
  #make rott-rottsite # site license cd
}

package() {
  cd rott
  # copy all editions and launcher
  install -d "$pkgdir"/usr/bin
  install -m755 rott-* "$pkgdir"/usr/bin
  install -m755 misc/runrott.sh "$pkgdir"/usr/bin/runrott
  install -m755 ../rott.sh "$pkgdir"/usr/bin/rott
  # doc
  install -Dm644 doc/rott.6 "$pkgdir"/usr/share/man/man6/rott.6
  install -d "$pkgdir"/usr/share/doc/$pkgname
  install -m644 doc/*.txt "$pkgdir"/usr/share/doc/$pkgname
  # .desktop entry
  install -Dm644 misc/rott.png "$pkgdir"/usr/share/pixmaps/rott.png
  install -Dm644 misc/rott.desktop "$pkgdir"/usr/share/applications/rott.desktop

  # set the cd version as default (as it is a common version, for example still sold at gog.com)
  # You can also use all other targets from the build() function, for example 'huntbgin' for the shareware version
  sed 's|EDITION|rottcd|' -i "$pkgdir"/usr/bin/rott
}
