# Maintainer:
# Contributor: dreieck
# Contributor: éclairevoyant

## links
# https://rinigus.github.io/pure-maps
# https://github.com/rinigus/pure-maps

## basic info
_pkgname="pure-maps"
pkgname="$_pkgname-git"
pkgver=3.4.0.r0.gb594d2f
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

_source_main() {
  provides=("$_pkgname=${pkgver%%.r*}")
  conflicts=("$_pkgname")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
}

_source_pure_maps() {
  source+=(
    'rinigus.geomag'::'git+https://github.com/rinigus/geomag.git'
    'tkrajina.gpxpy'::'git+https://github.com/tkrajina/gpxpy.git'
    'heremaps.flexible-polyline'::'git+https://github.com/heremaps/flexible-polyline.git'
  )
  sha256sums+=(
    'SKIP'
    'SKIP'
    'SKIP'
  )

  _prepare_pure_maps() (
    cd "$_pkgsrc"
    local _submodules=(
      'rinigus.geomag'::'thirdparty/geomag'
      'tkrajina.gpxpy'::'thirdparty/gpxpy'
      'heremaps.flexible-polyline'::'thirdparty/flexible-polyline'
    )
    _submodule_update
  )
}

_source_main
_source_pure_maps

prepare() {
  _submodule_update() {
    local _module
    for _module in "${_submodules[@]}"; do
      git submodule init "${_module##*::}"
      git submodule set-url "${_module##*::}" "$srcdir/${_module%::*}"
      git -c protocol.file.allow=always submodule update "${_module##*::}"
    done
  }

  _prepare_pure_maps
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
