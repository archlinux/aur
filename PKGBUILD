# Maintainer: João Figueiredo <jf dot mundox at gmail dot com>
# Contributor: Antonio Rojas <arojas@archlinux.org>

_gitname=plasma-browser-integration
pkgname=$_gitname-git
pkgver=r1114.365e08e6
pkgrel=1
pkgdesc='Components necessary to integrate browsers into the Plasma Desktop'
arch=(i686 x86_64)
url='https://www.kde.org/plasma-desktop'
license=(GPL)
depends=(krunner)
makedepends=(extra-cmake-modules git python)
conflicts=(plasma-browser-integration)
provides=(plasma-browser-integration)
source=('git+https://github.com/KDE/plasma-browser-integration.git')
sha256sums=('SKIP')

pkgver() {
  cd $_gitname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  sed -e 's|${MOZILLA_PREFIX}|${CMAKE_INSTALL_PREFIX}|g' -i $_gitname/CMakeLists.txt
}

build() { 
  cd build
  cmake ../$_gitname \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DINSTALL_CHROME_MANIFEST=ON
  make
}

package() {
  cd build
  make DESTDIR="$pkgdir" install
}
