# Maintainer:

_pkgname="mapbox-gl-qml"
pkgname="$_pkgname"
pkgver=2.1.1
pkgrel=3
pkgdesc="Mapbox GL Native bindings for Qt QML"
url="https://github.com/rinigus/mapbox-gl-qml"
license=('LGPL-3.0-only')
arch=('x86_64' 'aarch64')

depends=(
  'maplibre-native'
  'qt5-location'
  'qt5-svg'
)
makedepends=(
  'cmake'
  'ninja'
)

# 2.1.1.r3 - fix build: QMapLibreGL -> QMapLibre
_commit=dc1eeacbcc932bda899da42127d05ce7fc766140

_pkgsrc="$_pkgname-$pkgver"
_pkgext="tar.gz"
source=(
  "$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/$pkgver.$_pkgext"
  "0001-fix-build.patch"::"https://github.com/rinigus/mapbox-gl-qml/compare/2.1.1...dc1eeacbcc932bda899da42127d05ce7fc766140.diff"
)
sha256sums=(
  '1a5e3369832e5d71b13db42d86cfd24ffe4573f8a8732fda6fea3e05a3417d43'
  'b5e9c226e3757250e70d32ee9779c89e0079eb6f87327c6a283e8f0cd6d46a04'
)

prepare() {
  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    src="${src%.zst}"
    [[ $src = *.patch ]] || continue
    echo
    echo "Applying patch $src..."
    patch -d "$_pkgsrc" -Np1 -F100 -i "../$src"
  done
}

build() {
  local _cmake_options=(
    -B build
    -S "$_pkgsrc"
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'

    -DUSE_CURL_SSL=OFF

    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
