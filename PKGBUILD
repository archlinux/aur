# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Dent <thewinch@gmail.com>
# Contributor: orbisvicis <orbisvicis@gmail.com>
# Maintainer: Fritz Engelbrecht <fritz.engl+arch@gmail.com>
# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=mapnik-git
pkgver=4.4.0.r2.g7a1a076
pkgrel=1
pkgdesc='Free Toolkit for developing mapping applications. Above all Mapnik is about rendering beautiful maps'
arch=('aarch64' 'i686' 'x86_64')
url='https://github.com/mapnik/mapnik'
license=(
  'BSD-3-Clause'
  'ISC'
  'LGPL-2.1-or-later'
  'LicenseRef-AGG'
)
depends=(
  'boost-libs'
  'cairo'
  'freetype2'
  'gdal'
  'harfbuzz'
  'icu'
  'libavif'
  'libjpeg-turbo'
  'libpng'
  'libtiff'
  'libwebp'
  'libxml2'
  'postgresql-libs'
  'proj'
  'sqlite'
  'ttf-dejavu'
)
makedepends=(
  'boost'
  'cmake'
  'git'
  'protozero'
  'sparsehash'
)
provides=('mapnik')
conflicts=('mapnik')
options=('staticlibs')
source=(
  "${pkgname}::git+${url}.git"
  'git+https://github.com/mapbox/geometry.hpp.git'
  'git+https://github.com/mapbox/variant.git'
  'git+https://github.com/mapnik/mapnik-vector-tile.git'
  'git+https://github.com/mapnik/polylabel.git'
  'git+https://github.com/mapnik/test-data.git'
  'mapnik-use-system-sparsehash.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'dabb1b99540a6df86b34511d0d94ef505f706419b7e6d1d69314797ebcdce72f'
)

pkgver() {
  git -C "${pkgname}" describe --long --tags --abbrev=7 | sed --regexp-extended 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  git -C "${pkgname}" submodule init \
    deps/mapbox/geometry \
    deps/mapbox/mapnik-vector-tile \
    deps/mapbox/polylabel \
    deps/mapbox/variant \
    test/data

  git -C "${pkgname}" \
    -c protocol.file.allow=always \
    -c submodule.deps/mapbox/geometry.url="${srcdir}/geometry.hpp" \
    -c submodule.deps/mapbox/mapnik-vector-tile.url="${srcdir}/mapnik-vector-tile" \
    -c submodule.deps/mapbox/polylabel.url="${srcdir}/polylabel" \
    -c submodule.deps/mapbox/variant.url="${srcdir}/variant" \
    -c submodule.test/data.url="${srcdir}/test-data" \
    submodule update

  # Use system 'sparsehash' package instead of bundled copy
  patch --directory="${pkgname}" --strip=1 --input="${srcdir}/mapnik-use-system-sparsehash.patch"
  rm --recursive --force "${pkgname}/deps/mapnik/sparsehash"
}

build() {
  cmake -B build -S "${pkgname}" \
    -D BUILD_BENCHMARK:BOOL=OFF \
    -D BUILD_DEMO_CPP:BOOL=OFF \
    -D BUILD_DEMO_VIEWER:BOOL=OFF \
    -D CMAKE_BUILD_TYPE:STRING=None \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D FONTS_INSTALL_DIR:PATH=share/fonts/TTF \
    -D USE_EXTERNAL_MAPBOX_PROTOZERO:BOOL=ON

  cmake --build build
}

check() {
  ctest \
    --output-on-failure \
    --parallel \
    --test-dir build
}

package() {
  # Remove bundled dejavu fonts from cmake_install.cmake in favor of 'ttf-dejavu' package
  sed --in-place '/dejavu-fonts-ttf/d' "${srcdir}/build/cmake_install.cmake"

  # Install to pkgdir
  DESTDIR="${pkgdir}" cmake --install build

  # Licenses (LGPL-2.1-or-later is provided by the 'licenses' package)
  install -D --mode=644 "${srcdir}/${pkgname}/deps/agg/copying" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.agg"
  install -D --mode=644 "${srcdir}/${pkgname}/deps/mapbox/geometry/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.geometry"
  install -D --mode=644 "${srcdir}/${pkgname}/deps/mapbox/mapnik-vector-tile/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.mapnik-vector-tile"
  install -D --mode=644 "${srcdir}/${pkgname}/deps/mapbox/polylabel/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.polylabel"
  install -D --mode=644 "${srcdir}/${pkgname}/deps/mapbox/variant/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.variant"

  # Remove usr/share/fonts directory
  rm --recursive --force "${pkgdir}/usr/share/fonts"

  # Rename generic 'svg2png' binary to avoid conflicts
  mv --verbose "${pkgdir}/usr/bin/svg2png" "${pkgdir}/usr/bin/mapnik-svg2png"
}
