# Maintainer: envolution
# Contributor: Miguel de Val-Borro <miguel.deval [at] gmail [dot] com>
# Contributor: Matteo Paoluzzi <duwath [at] gmail [dot] com>
# Contributor: jmf <jmf [at] mesecons [dot] net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=xephem
_pkgname=XEphem
pkgver=4.2.0
pkgrel=3
pkgdesc="The Serious Interactive Astronomical Software Ephemeris"
arch=('i686' 'x86_64')
url="https://github.com/XEphem/XEphem"
license=('custom:MIT')
depends=('libxmu' 'openmotif' 'perl' 'openssl')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz"
  "xephem.desktop" "xephem.png")
sha256sums=('4d67b923e342e56b2a4a49f574e576fc183f1747edb693bab3709e83c8ad9c1b'
            'aa4e19b043cea5f13dcb9314b794c7152510a20289bf20a077a586ca913c65be'
            'fbca29143ecf5d89923ba6b68279cbc396886b229689dcd3b70999675bdb6c20')

prepare() {
  cd ${_pkgname}-${pkgver}/GUI/$pkgname
  if [ "$pkgver" = '4.2.0' ]; then #this is already fixed in git - just broken in current 4.2.0 release
    sed -i '4i\#define _XOPEN_SOURCE' sunmenu.c
  fi
  sed -i '4i#define _GNU_SOURCE' imregmenu.c
  sed -i '5i#include <unistd.h>' imregmenu.c
  sed -i '20i#define _GNU_SOURCE' indimenu.c
  sed -i '21i#include <unistd.h>' indimenu.c
  sed -i '6i#define _GNU_SOURCE' mainmenu.c
  sed -i '7i#include <unistd.h>' mainmenu.c
  sed -i '4i#define _GNU_SOURCE' skyfits.c
  sed -i '5i#include <unistd.h>' skyfits.c
  sed -i '5i#define _GNU_SOURCE' splash.c
  sed -i '6i#include <unistd.h>' splash.c
  sed -i '3i#define _GNU_SOURCE' webdbmenu.c
  sed -i '4i#include <unistd.h>' webdbmenu.c
  sed -i '5i#define _GNU_SOURCE' xephem.c
  sed -i '6i#include <unistd.h>' xephem.c
  
  sed -i 's/^CFLAGS =/CFLAGS = -std=c17/' Makefile
  cd ../../libip
  sed -i 's/^CFLAGS=/CFLAGS= -std=c17 /' Makefile
  cd ../libjpegd
  sed -i 's/^CFLAGS=/CFLAGS= -std=c17 /' Makefile
}

build() {
  cd ${_pkgname}-${pkgver}/GUI/$pkgname
  make MOTIF=/usr/lib/
}

package() {
  cd ${_pkgname}-${pkgver}/GUI/$pkgname

  #binary
  install -Dm755 $pkgname "$pkgdir"/usr/bin/$pkgname

  #shared resources
  local share_dir="$pkgdir"/usr/share/$pkgname
  install -d "$share_dir"
  cp -R auxil catalogs fifos fits gallery help lo "$share_dir"/

  #man page
  install -Dm644 $pkgname.1 "$pkgdir"/usr/share/man/man1/$pkgname.1

  #X11 app defaults
  install -d "$pkgdir"/usr/share/X11/app-defaults
  echo "XEphem.ShareDir: /usr/share/xephem" >"$pkgdir"/usr/share/X11/app-defaults/XEphem

  #desktop and icon
  install -Dm644 "$srcdir/${pkgname}.desktop" "$pkgdir/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "$srcdir/${pkgname}.png" "$pkgdir/usr/share/pixmaps/${pkgname}.png"

  #license
  install -Dm644 "$srcdir"/${_pkgname}-${pkgver}/LICENSE \
    "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
# vim:set ts=2 sw=2 et:
