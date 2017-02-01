# Maintainer: uleenucks <dev@uleenucks.de>
pkgname=dwm-uleenucks-git
_pkgname=dwm
pkgdesc="dwm with uleenucks personalisations"
pkgver=6.1.14.gbb3bd6f
pkgver(){
  cd $_pkgname
  git describe --tags |sed 's/-/./g'
}
pkgrel=1
pkgdesc="A dynamic window manager for X"
url="http://dwm.suckless.org"
arch=('i686' 'x86_64')
license=('MIT')
options=(zipman)
depends=('libx11' 'libxinerama' 'libxft')
makedepends=('git')
install=dwm.install
provides=('dwm')
conflicts=('dwm')
replaces=('dwm')
epoch=1
source=("$_pkgname::git+http://git.suckless.org/dwm"
        config.def.h.x200s
        config.def.h.work
        compile.sh
        dwm-6.1-center.diff)

md5sums=('SKIP'
         'fbfa9c221f239c45c422876a7d236200'
         'a604227c591b5bb06498316de684f91a'
         '8d309c744a149e807b66139978301c9b'
         '5f6f840c692f43f7e349bb87e895ff26')

prepare() {
  if [[ -f $SRCDEST/config.def.h ]]; then
    ln -sf $SRCDEST/config.def.h $srcdir/dwm/config.h
  fi
}

build() {
  cd $_pkgname

  patch -p1 < ../dwm-6.1-center.diff || exit 1
  make X11INC=/usr/include/X11 X11LIB=/usr/lib/X11
}

package() {
  make -C $_pkgname PREFIX=/usr DESTDIR=$pkgdir install
  install -m644 -D $_pkgname/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -m644 -D $_pkgname/README $pkgdir/usr/share/doc/$pkgname/README
}

# vim:set ts=2 sw=2 et:
