# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=lincity-ng-git
pkgver=2.9.beta.r102.gd35c3bee
pkgrel=1
pkgdesc="A city simulation game (development version)"
arch=('i686' 'x86_64')
url="https://github.com/lincity-ng/lincity-ng"
license=('GPL2')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver%.r*}")
depends=('sdl2_mixer' 'sdl2_image' 'sdl2_ttf' 'sdl2_gfx' 'physfs' 'libxml2' 'libgl')
makedepends=('git' 'ftjam' 'mesa' 'glu')
source=("git+https://github.com/lincity-ng/lincity-ng.git")
md5sums=('SKIP')

pkgver() {
  cd lincity-ng

  git describe --long --tags | sed 's/^lincity-ng-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd lincity-ng

  # generate CREDITS file
  eval $(grep -m1 CREDITS makerelease.sh)
}

build () {
  cd lincity-ng

  ./autogen.sh
  ./configure --prefix=/usr
  jam -j2 # assume dual core machine at least
}

package () {
  cd lincity-ng

  jam -j2 -sprefix="$pkgdir/usr" install

  # fixup man
  install -Dm644 doc/lincity-ng.6 "$pkgdir"/usr/share/man/man6/lincity-ng.6

  # fixup doc dir
  mv "$pkgdir"/usr/share/doc/{lincity-ng*,lincity-ng}

  # licenses
  install -Dm644 COPYING-data.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING-data.txt
  install -Dm644 COPYING-fonts.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING-fonts.txt
}
