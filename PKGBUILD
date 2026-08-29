# Maintainer:
# Contributor: Daniel Landau <aur@landau.fi>

_pkgname=appcsxcad
pkgname="$_pkgname"
pkgver=0.2.3
pkgrel=1
pkgdesc="Minimal GUI Application using the QCSXCAD library"
url="https://github.com/thliebig/AppCSXCAD"
license=('GPL-3.0-or-later')
arch=("x86_64")

depends=(
  'qt6-base'
  'vtk'

  # AUR
  'csxcad'
  'openems'
  'qcsxcad'
)
makedepends=(
  'cmake'
  'ninja'

  'fast_float'
  'nlohmann-json'
  'openmpi' # vtk
)

_pkgsrc="AppCSXCAD-$pkgver"
_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/archive/v$pkgver.$_pkgext")
sha256sums=('b15d0a1a221725dc2ac8d6c26828a0761183b7ef36021732c3063f76544d3ea9')

prepare() {
  sed -E -e '/cmake_policy/d' -i "$_pkgsrc/CMakeLists.txt"
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
    -Wno-author
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
