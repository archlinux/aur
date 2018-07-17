# Maintainer: Helder Bertoldo <helder.bertoldo@gmail.com>

gitname=cmake-modules-elementary
pkgname=("${gitname}-git")
pkgver=latest
pkgrel=1
pkgdesc='elementary CMake Modules'
arch=('i686' 'x86_64')
url='https://github.com/elementary/junk/tree/cmake-modules'
license=('GPL3')
depends=('cmake')
makedepends=('git')
provides=("${gitname}")
conflicts=("${gitname}")
source=('cmake-modules-elementary::git+https://github.com/elementary/junk.git#branch=cmake-modules')
sha256sums=('SKIP')

pkgver() {
    cd "${gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
  cd cmake-modules-elementary

  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
}

build() {
  cd "${gitname}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${gitname}/build"
  make DESTDIR="${pkgdir}" install
}
