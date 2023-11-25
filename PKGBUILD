# Maintainer: dreieck
# Contributor: éclairevoyant

_pkgname=pure-maps
pkgname="${_pkgname}-git"
pkgdesc="Display vector and raster maps, places, routes, etc."
pkgver=3.2.1+13.r2795.20230312.d801dfc1
pkgrel=2
arch=(
  'x86_64'
  'i686'
  'armv6'
  'armv7'
  'aarch64'
)
url="https://rinigus.github.io/${_pkgname}"
license=(
  'GPL3'
)
depends=(
  abseil-cpp
  gettext
  hicolor-icon-theme
  kirigami2
  mapbox-gl-qml
  nemo-qml-plugin-dbus
  # python-geomag
  python-gpxpy
  python-pyotherside
  qt5-location
  qt5-quickcontrols2
  qt5-sensors
  s2geometry
)
optdepends=(
  'geoclue'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
makedepends=(
  'cmake'
  'geoclue'
  'git'
  'qt5-tools'
)
source=("${_pkgname}::git+https://github.com/rinigus/${_pkgname}.git")
b2sums=(SKIP)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(grep -E '^[[:space:]]*Version:' rpm/harbour-pure-maps.spec | head -n1 | awk '{print $2}' | tr -d \'\")"
  _additionalcommits="$(git describe --tags | awk -F- '{print $2}' | sed -E 's|g[0-9a-f]*||g')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  fi

  if [ -n "${_additionalcommits}" ]; then
    _ver+="+${_additionalcommits}"
  fi

  printf '%s' "${_ver}.r${_rev}.${_date}.${_hash}"
}

build() {
  cd "${srcdir}"

  cmake -B build -S "${_pkgname}" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DDEFAULT_BASEMAP=MapTiler \
    -DDEFAULT_FONTPROVIDER=openmaptiles \
    -DDEFAULT_GEOCODER=photon \
    -DDEFAULT_GUIDE=foursquare \
    -DDEFAULT_PROFILE=online \
    -DDEFAULT_ROUTER=stadiamaps \
    -DFLAVOR=kirigami \
    -DUSE_BUNDLED_GEOCLUE2=OFF \
    -DUSE_BUNDLED_GEOMAG=OFF \
    -DUSE_BUNDLED_GPXPY=OFF \
    -DCMAKE_CXX_STANDARD=17 # use the same C++ standard as abseil-cpp
    # -DFLAVOR allows for "kirigami", "silica", "qtcontrols" and "uuitk".
  make -C build
}

package() {
  make -C build DESTDIR="${pkgdir}" install
}
