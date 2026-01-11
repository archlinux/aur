# Maintainer: Lubosz Sarnecki <lubosz@gmail.com>
# Contributor: Evan Purkhiser <evanpurkhiser@gmail.com>

pkgname=libkeyfinder-git
pkgdesc="Musical key detection for digital audio."
url="https://github.com/mixxxdj/libkeyfinder"
license=('GPL3')
pkgver=2.2.8.r10.g941e517
pkgrel=1

provides=(libkeyfinder)
conflicts=(libkeyfinder)

source=("$pkgname::git+$url.git")
sha256sums=('SKIP')
depends=('fftw')
makedepends=('ninja' 'git' 'cmake')
arch=('i686' 'x86_64')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
  local cmake_options=(
    -B build
    -G Ninja
    -S $pkgname
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX='/usr'
    # Disable building unit tests so we do not need the catch2 dep
    -D BUILD_TESTING=OFF
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
