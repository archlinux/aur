# Maintainer: Ruben De Smet <me at rubdos dot be>

pkgname=wlc-wall-injector-git
_gitname=orbment-wall
pkgver=r42.389c741
pkgrel=1
pkgdesc="A hack that injects wayland-wall into wlc based compositors."
arch=('i686' 'x86_64')
url="https://github.com/wayland-wall/orbment-wall"
license=('MIT')
depends=('wayland-wall' 'wayland-protocols' 'wlc')
makedepends=('git')
provides=('orbment-wall-git' 'wlc-wall-injector')
conflicts=('orbment-wall')
source=("git+https://github.com/wayland-wall/orbment-wall.git")
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
      --disable-orbment-plugins
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make install install-man DESTDIR="$pkgdir"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/wlc-wall-injector-git/COPYING"
}
