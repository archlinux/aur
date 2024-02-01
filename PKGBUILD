# Maintainer:
# Contributor: dreieck
# Contributor: éclairevoyant

## useful links
# https://rinigus.github.io/pure-maps
# https://github.com/rinigus/pure-maps

## options
: ${_build_git:=true}

[[ "${_build_git::1}" == "t" ]] && _pkgtype+="-git"

## basic info
_pkgname=pure-maps
pkgname="$_pkgname${_pkgtype:-}"
pkgver=3.2.1.r16.g4b96fae3
pkgrel=1
pkgdesc="Display vector and raster maps, places, routes, etc."
url="https://github.com/rinigus/pure-maps"
license=('GPL-3.0-or-later')
arch=('x86_64')

# main package
_main_package() {
  depends=(
    python-lxml
    python-pyotherside
    qt5-location
    qt5-quickcontrols2

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

  if [ "${_build_git::1}" != "t" ] ; then
    _main_stable
  else
    _main_git
  fi

  _source_pure_maps
}

# stable package
_main_stable() {
  : ${_pkgver:=${pkgver%%.r*}}

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=$_pkgver")
  sha256sums+=('SKIP')

  pkgver() {
    echo "${_pkgver:?}"
  }
}

# git package
_main_git() {
  provides+=("$_pkgname=${pkgver%%.r*}")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --abbrev=8 --exclude='*[a-zA-Z][a-zA-Z]*' \
      | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
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
    cd "$_pkgsrc"
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
  depends+=(
    hicolor-icon-theme
  )

  DESTDIR="$pkgdir" cmake --install build
}

# execute
_main_package
