# Maintainer:
# Contributor: dreieck
# Contributor: éclairevoyant

# options
: ${_pkgtype:=git}

# basic info
_pkgname=pure-maps
pkgname="$_pkgname${_pkgtype:+-$_pkgtype}"
pkgver=3.2.1.r13.gd801dfc1
pkgrel=1
pkgdesc="Display vector and raster maps, places, routes, etc."
url="https://github.com/rinigus/pure-maps"
license=('GPL3')
arch=(
  'x86_64'
  'i686'
  'armv6'
  'armv7'
  'aarch64'
)

# main package
_main_package() {
  depends=(
    abseil-cpp
    gettext
    hicolor-icon-theme
    kirigami2
    python-pyotherside
    qt5-location
    qt5-quickcontrols2
    qt5-sensors

    # AUR
    mapbox-gl-qml
      # maplibre-native
    nemo-qml-plugin-dbus
    s2geometry
  )
  makedepends=(
    'cmake'
    'git'
    'qt5-tools'
  )

  provides=("${_pkgname}=${pkgver%%.r*}")
  conflicts=("${_pkgname}")

  _pkgsrc="$_pkgname"
  source=("$_pkgsrc"::"git+$url.git")
  sha256sums=('SKIP')

  _source_pure_maps
}

# submodules
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
    cd "${srcdir:?}/$_pkgsrc"
    local -A _submodules=(
      ['rinigus.geomag']='thirdparty/geomag'
      ['tkrajina.gpxpy']='thirdparty/gpxpy'
      ['heremaps.flexible-polyline']='thirdparty/flexible-polyline'
    )
    _submodule_update
  )
}

# common functions
prepare() {
  _submodule_update() {
    local key;
    for key in ${!_submodules[@]} ; do
      git submodule init "${_submodules[${key}]}"
      git submodule set-url "${_submodules[${key}]}" "${srcdir}/${key}"
      git -c protocol.file.allow=always submodule update "${_submodules[${key}]}"
    done
  }

  _prepare_pure_maps
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'

    -Wno-dev

    -DUSE_BUNDLED_GEOCLUE2=ON
    -DUSE_BUNDLED_GEOMAG=ON
    -DUSE_BUNDLED_GPXPY=ON

    -DCMAKE_CXX_STANDARD=17
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir:?}" cmake --install build
}

# execute
_main_package
