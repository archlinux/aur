# Maintainer: Stefan Biereigel <stefan@biereigel.de>

_pkgname="csxcad"
pkgname="$_pkgname-git"
pkgver=0.6.3.r2.gc6a1587
pkgrel=1
pkgdesc="A C++ library to describe geometrical objects and their physical or non-physical properties."
url="https://github.com/thliebig/CSXCAD"
license=('LGPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'hdf5'
  'tinyxml'
  'vtk'

  # AUR
  'fparser'
)
makedepends=(
  'cgal'
  'cmake'
  'fast_float'
  'git'
  'ninja'
  'nlohmann-json'
)

provides=('csxcad')
conflicts=('csxcad')

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+https://github.com/thliebig/CSXCAD")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DENABLE_RPATH=OFF
    -DBUILD_TESTING=OFF
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

