# Maintainer: Stefan Biereigel <stefan@biereigel.de>

_pkgname="openems"
pkgname="$_pkgname-git"
pkgver=0.0.36.r15.g1ccf094
pkgrel=1
pkgdesc="A free and open source EC-FDTD solver"
url="https://github.com/thliebig/openEMS"
license=('GPL-3.0-or-later')
arch=('i686' 'x86_64')

depends=(
  'boost-libs'
  'fmt'
  'hdf5'
  'libpng'
  'tinyxml'
  'verdict'
  'vtk'

  # AUR
  'csxcad'
  'fparser'
)
makedepends=(
  'boost'
  'cmake'
  'fast_float'
  'git'
  'ninja'
  'nlohmann-json'
  'openmpi'
)

provides=('openems')
conflicts=('openems')

_pkgsrc="$pkgname"
source=("$_pkgsrc"::"git+https://github.com/thliebig/openEMS")
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
    -DCMAKE_INSTALL_PREFIX='/usr'
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}

