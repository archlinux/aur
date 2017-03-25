# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname=orbment-wall-git
_gitname=orbment-wall
pkgver=r37.b998b46
pkgrel=1
pkgdesc="Orbment plugins for Wayland Wall protocols"
arch=('i686' 'x86_64')
url="https://github.com/wayland-wall/orbment-wall"
license=('MIT')
depends=('wayland-wall' 'wayland-protocols' 'orbment')
makedepends=('git')
provides=('orbment-wall' 'orbment-wall-git' 'wlc-wall-injector')
conflicts=('orbment-wall')
source=("git+https://github.com/wayland-wall/orbment-wall.git#branch=wip/injector")
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
      --prefix=/usr
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/orbment-wall-git/COPYING"
}
