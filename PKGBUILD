# Maintainer: Pavle <xpio at tut.by>
# also used PKGBUILD by rbrt as a reference

pkgname=klystrack-git
pkgver=1.7.2.r6.ga514cef
pkgrel=1
pkgdesc="Tracker for making chiptune-like music on a modern computer"
arch=('i686' 'x86_64')
url="http://kometbomb.github.io/klystrack/"
license=('MIT')
groups=()
depends=('sdl2_image')
makedepends=('git' 'gendesk')
provides=('klystrack')
conflicts=('klystrack')
source=('git://github.com/kometbomb/klystrack' 'git://github.com/kometbomb/klystron')
md5sums=('SKIP' 'SKIP')

_gitname='klystrack'
_categories='AudioVideo;Audio;X-Synthesis'

pkgver() {
  cd "$_gitname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  gendesk -f -n 
  touch "$srcdir/klystrack/src/version.h"
  touch "$srcdir/klystron/src/version.h"
  sed -i '/^CC =/ s/gcc/gcc -fPIC/' "$srcdir/klystron/Makefile"
}

build() {
  cd "$srcdir/$_gitname"
  make 
}

package() {
  mkdir "$pkgdir/usr"
  cd "$pkgdir/usr"
  mkdir -p bin share/klystrack share/applications share/pixmaps share/licenses/klystrack lib/klystrack
  cd "$srcdir/$_gitname"
  install bin.debug/klystrack "$pkgdir/usr/bin/"
  cp -r res/ key/ "$pkgdir/usr/lib/klystrack/"
  cp -r examples/ "$pkgdir/usr/share/klystrack/"
  install -Dm644 doc/LICENSE "$pkgdir/usr/share/licenses/klystrack/"
  install -Dm644 doc/Default.kt "$pkgdir/usr/share/klystrack/"
  # .desktop file
  install -Dm644 "../klystrack.desktop" "$pkgdir/usr/share/applications/klystrack.desktop"
  install -Dm644 "icon/256x256.png" "$pkgdir/usr/share/pixmaps/klystrack.png"
}

# vim:set ts=2 sw=2 et:
