# Maintainer: Antonio Rojas <arojas@archlinux.org>

_gitname=plasma-workspace
pkgname=gmenu-dbusmenu-proxy-git
pkgver=r6528.e37156b4
pkgrel=1
pkgdesc='Proxy that allows to display GTK applications menus in Plasma global menu'
arch=(x86_64)
url='https://www.kde.org/plasma-desktop'
license=(GPL)
depends=(plasma-workspace)
makedepends=(extra-cmake-modules git python kdesignerplugin kdoctools)
source=("git://git.kde.org/$_gitname.git")
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build
 
  cd $_gitname
  git revert -n e37156b404bffd4dc6fd0d1b2dbb5dc1ae0ddfa4 # Don't depend on plasma-framework git
}

build() { 
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib
  make -C gmenu-dbusmenu-proxy
}

package() {
  cd build
  make DESTDIR="$pkgdir" -C gmenu-dbusmenu-proxy install
}
