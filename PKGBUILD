# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname=wayland-wall-git
_gitname=wayland-wall
pkgver=r47.68eab6f
pkgrel=1
pkgdesc="A collection of protocols, called bricks, to create a complete desktop experience for Wayland."
arch=('i686' 'x86_64')
url="https://github.com/wayland-wall/wayland-wall"
license=('MIT')
depends=('gdk-pixbuf2' 'pango' 'wayland-protocols')
makedepends=('git')
provides=('wayland-wall' 'wayland-wall-git')
conflicts=('wayland-wall')
source=("git+https://github.com/wayland-wall/wayland-wall.git")
md5sums=('SKIP')

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_gitname"
  git submodule update --init
  autoreconf --install

  ./configure \
      --prefix=/usr \
      --enable-clients \
      --enable-images \
      --enable-text
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/wayland-wall-git/COPYING"
}
