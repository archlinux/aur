# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=lincity-ng-git
pkgver=2.9.beta.r1832.4900c2e
pkgrel=1
pkgdesc="A city simulation game (development version)"
arch=('i686' 'x86_64')
url="https://code.google.com/p/lincity-ng/"
license=('GPL2')
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver%.r*}")
depends=('sdl_mixer' 'sdl_image' 'sdl_ttf' 'sdl_gfx' 'physfs' 'libxml2' 'libgl')
makedepends=('git' 'ftjam' 'mesa' 'glu')
source=("git+https://code.google.com/p/lincity-ng/")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  # get version from autotools
  local _ver="$(grep 'AC_INIT(.*)' configure.ac | cut -d',' -f2 | tr -d ' []')"
  printf "%s.r%s.%s" "$_ver" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname%-*}
  # fix https://code.google.com/p/lincity-ng/issues/detail?id=5 ... yeah it is ugly, better patch proposed
  rm src/lincity-ng/getBundleSharePath.cpp
  # generate CREDITS file
  eval $(grep -m1 CREDITS makerelease.sh)
}

build () {
  cd ${pkgname%-*}

  ./autogen.sh
  ./configure --prefix=/usr
  jam
}

package () {
  cd ${pkgname%-*}

  jam -sprefix="$pkgdir/usr" install

  # licenses
  install -Dm644 COPYING-data.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING-data.txt
  install -Dm644 COPYING-fonts.txt "$pkgdir"/usr/share/licenses/$pkgname/COPYING-fonts.txt
}
