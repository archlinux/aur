# Maintainer: Ruben De Smet <me at rubdos dot be>
# Contributor: btschaegg

pkgname=wayland-wall-git
_gitname=wayland-wall
pkgver=r49.39400ea
pkgrel=2
pkgdesc="A collection of protocols, called bricks, to create a complete desktop experience for Wayland."
arch=('i686' 'x86_64')
url="https://github.com/wayland-wall/wayland-wall"
license=('MIT')
depends=('gdk-pixbuf2' 'pango' 'wayland-protocols')
makedepends=('git' 'meson' 'ninja')
optdepends=('wlc-wall-injector: inject wall into wlc based compositors')
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

  mkdir -p build
  meson build \
    --buildtype=release \
    --prefix=/usr \
    -Denable-clients=true \
    -Denable-images=true \
    -Denable-text=true
}

build() {
  cd "$srcdir/$_gitname"
  ninja -C build
}

package() {
  cd "$srcdir/$_gitname"
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/wayland-wall-git/COPYING"
}
