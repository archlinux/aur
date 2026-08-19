# Maintainer:  Andrew O'Neill <andrew at haunted dot sh>
# Contributor: Kevin Slagle <kjslag at gmail dot com>

pkgname=regina-normal
pkgver=7.4.1
pkgrel=3
pkgdesc='Software for low-dimensional topology'
arch=('x86_64')
url='https://regina-normal.github.io'
license=('GPL-2.0-or-later')
depends=('gmp' 'graphviz' 'jansson' 'libxml2' 'lmdb' 'popt' 'python3' 'qt6-base' 'qt6-svg' 'zlib')
makedepends=('cmake')
optdepends=('doxygen: Generate C++/Python API docs'
            'cppunit: Build full test suite'
            'libxslt: Generate the user handbook')
source=("https://github.com/${pkgname}/regina/archive/regina-${pkgver}.tar.gz")
sha256sums=('fc5db92a1c92f19dbbc9ca58ba37881b5cfbe9bc38736dad05ee767d98957803')

prepare() {
  sed -i '31i\#include <cstdint>' "regina-regina-${pkgver}/engine/link/knotplot.cpp"
}

build() {
  local cmake_options=(
    -B build
    -S "regina-regina-${pkgver}"
    -W no-dev
    -D CMAKE_BUILD_TYPE=Release
    -D CMAKE_INSTALL_PREFIX=/usr
    -D REGINA_KVSTORE=lmdb
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
