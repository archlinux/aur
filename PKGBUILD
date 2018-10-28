# Maintainer: Pavle <xpio at tut.by>
# Contributor: rbrt

pkgname=klystrack-git
pkgver=1.7.5.r3.gf24c982
pkgrel=1
pkgdesc="Tracker for making chiptune-like music on a modern computer"
arch=('i686' 'x86_64')
url="http://kometbomb.github.io/klystrack/"
license=('MIT')
groups=()
depends=('sdl2_image' 'sdl2_mixer')
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
  # prevent treating warnings as errors
  sed -i 's/-Werror//' "$srcdir/klystron/Makefile"
  sed -i 's/-Werror//' "$srcdir/klystrack/Makefile"
  # klystron is submodule of klystrack
  cd "$srcdir/$_gitname" #i.e. klystrack
  git submodule init
  git config submodule.klystron.url "$srcdir/klystron"
  git submodule update
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
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/klystrack/"
  install -Dm644 doc/Default.kt "$pkgdir/usr/share/klystrack/"
  # man page
  mkdir -p "$pkgdir/usr/share/man/man1"
  gzip -ck doc/klystrack.1 > "$pkgdir/usr/share/man/man1/klystrack.1.gz"
  # .desktop file
  install -Dm644 "../klystrack.desktop" "$pkgdir/usr/share/applications/klystrack.desktop"
  install -Dm644 "icon/256x256.png" "$pkgdir/usr/share/pixmaps/klystrack.png"
}

# vim:set ts=2 sw=2 et:
