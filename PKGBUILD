# Maintainer:
# Contributor: éclairevoyant

_pkgname="pure-maps"
pkgname="$_pkgname"
pkgver=3.4.1
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
  'ninja'
  'qt5-tools'
)

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/releases/download/$pkgver/$_pkgsrc.$_pkgext")
sha256sums=('1f0f331cbea99ed91166ea88f86f76795dbe23e7457cfec22baa04e34285c283')

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
