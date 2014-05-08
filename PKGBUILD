#Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=ctwm-git
pkgver=3.8.1.12
pkgrel=2
pkgdesc="Claude's Tab Window Manager"
arch=('i686' 'x86_64')		
url="http://ctwm.free.lp.se/"
license=('custom:MIT/X Consortium')
provides=('ctwm')
conflicts=('ctwm')
depends=('libxmu' 'libxpm' 'libjpeg' 'rplay')
makedepends=('imake' 'setconf' 'git' 'bison' 'flex')
backup=('etc/X11/ctwm/system.ctwmrc')
source=("$pkgname::git+https://github.com/bbidulock/ctwm.git#branch=ctwm.rhialto.cleanup")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --always |sed 's,^[^0-9]*,,;s,-,.,g;s,\.g[a-f0-9]*$,,'
}

prepare() {
  cd $pkgname
  MANWIDTH=80 man ./ctwm.man | cat | sed -n '/COPYRIGHT/,/^$/p;/AUTHORS/,/^$/p' >COPYRIGHT
  sed -i 's,#include "sounds.h",#include "sound.h",' events.c
}

build() {
  cd $pkgname
  setconf Imakefile CONFDIR /etc/X11/ctwm
  setconf Imakefile PIXMAPDIR /etc/X11/ctwm/pixmaps
  cat>Imakefile.local<<EOF
#define USEM4
#define XPM
#define JPEG
#define GNOME
#define USE_SOUND
#define USE_GNU_REGEX
EOF
  xmkmf
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" install.man
  install -Dm0644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}

# vim:set et sw=2:
