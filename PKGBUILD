# Maintainer:
# Contributor: Matyas Mehn <matyas.mehn at tum dot de>

_pkgname="qcsxcad"
pkgname="$_pkgname-git"
pkgver=0.6.3.r2.ga6a9c0e
pkgrel=1
pkgdesc="Qt-GUI for CSXCAD"
url="https://github.com/thliebig/QCSXCAD"
license=("LGPL-3.0-or-later")
arch=("x86_64")

depends=(
  'csxcad' # AUR
  'qt5-base'
  'tinyxml'
  'vtk'
)
makedepends=(
  'cmake'
  'fmt'
  'glew'
  'ninja'
  'nlohmann-json'
  'openmpi'
  'verdict'
)

provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
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
