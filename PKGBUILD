# Maintainer:
# Contributor: dreieck
# Contributor: éclairevoyant

_pkgname="pure-maps"
pkgname="$_pkgname-git"
pkgver=3.4.1.r1.g63020fa
pkgrel=1
pkgdesc="Display vector and raster maps, places, routes, etc."
url="https://github.com/rinigus/pure-maps"
license=('GPL-3.0-or-later')
arch=('x86_64')

depends=(
  'kirigami2'
  'python-lxml'
  'python-pyotherside'
  'qt5-declarative'
  'qt5-location'
  'qt5-multimedia'
  'qt5-quickcontrols2'
  'qt5-sensors'

  ## AUR
  # maplibre-native
  'mapbox-gl-qml'
  's2geometry'
)
makedepends=(
  'cmake'
  'git'
  'ninja'
  'qt5-tools'
)

provides=("$_pkgname=${pkgver%%.g*}")
conflicts=("$_pkgname")

_pkgsrc="$_pkgname"
source=("$_pkgsrc"::"git+$url.git")
sha256sums=('SKIP')

prepare() {
  cd "$_pkgsrc"
  git submodule update --init --recursive --depth=1
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DCMAKE_CXX_STANDARD=17
    -DUSE_BUNDLED_GEOCLUE2=ON
    -DUSE_BUNDLED_GEOMAG=ON
    -DUSE_BUNDLED_GPXPY=ON
    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  depends+=(
    hicolor-icon-theme
  )

  DESTDIR="$pkgdir" cmake --install build
}
