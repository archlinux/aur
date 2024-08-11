# Maintainer: Konrad Beckmann <konrad.beckmann@gmail.com>

_pkgname="appcsxcad"
pkgname="$_pkgname-git"
pkgver=0.2.3.r0.g047ca6d
pkgrel=1
pkgdesc="Minimal GUI Application using the QCSXCAD library"
url="https://github.com/thliebig/AppCSXCAD"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'csxcad-git'
  'glew'
  'hdf5-openmpi'
  'libxcursor'
  'openems-git'
  'qcsxcad'
  'qt5-base'
  'qt5-x11extras'
  'vtk'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'nlohmann-json'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgname"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
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
