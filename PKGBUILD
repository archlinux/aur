# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Dent <thewinch@gmail.com>
# Contributor: orbisvicis <orbisvicis@gmail.com>
# Maintainer: Fritz Engelbrecht <fritz.engl+arch@gmail.com>
# Maintainer: David Hummel <hummeltech@sherpaguru.com>

pkgname=mapnik-git
pkgver=4.1.3.r2.ge4e80db
pkgrel=1
pkgdesc='Free Toolkit for developing mapping applications. Above all Mapnik is about rendering beautiful maps (git version)'
arch=('i686' 'x86_64')
url='https://github.com/mapnik/mapnik'
license=('LGPL-2.1-or-later')
depends=('boost-libs'
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
         'ttf-dejavu')
makedepends=('boost'
             'cmake'
             'git'
             'mapbox-geometry.hpp'
             'mapbox-polylabel'
             'mapbox-variant'
             'protozero'
             'sparsehash')
conflicts=('mapnik')
options=(staticlibs)
provides=('mapnik')
source=('git+https://github.com/mapnik/mapnik.git'
        'git+https://github.com/mapnik/mapnik-vector-tile.git'
        'mapnik-use-system-sparsehash.patch'
        'git+https://github.com/mapnik/test-data.git')
sha256sums=('SKIP'
            'SKIP'
            'dabb1b99540a6df86b34511d0d94ef505f706419b7e6d1d69314797ebcdce72f'
            'SKIP')

pkgver() {
  git -C mapnik describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  patch -d mapnik -Np1 < mapnik-use-system-sparsehash.patch

  git -C mapnik submodule init test/data
  git -C mapnik config submodule.test/data.url "${srcdir}"/test-data
  git -C mapnik -c protocol.file.allow=always submodule update test/data

  git -C mapnik submodule init deps/mapbox/mapnik-vector-tile
  git -C mapnik config submodule.deps/mapbox/mapnik-vector-tile.url "${srcdir}"/mapnik-vector-tile
  git -C mapnik -c protocol.file.allow=always submodule update deps/mapbox/mapnik-vector-tile

  # Remove bundled sparsehash directory in favor of 'sparsehash' package
  rm -rf deps/mapnik/sparsehash

  export CXXFLAGS CFLAGS LDFLAGS
  cmake -B build -S mapnik \
    -D BUILD_BENCHMARK:BOOL=OFF \
    -D BUILD_DEMO_CPP:BOOL=OFF \
    -D BUILD_DEMO_VIEWER:BOOL=OFF \
    -D CMAKE_INSTALL_PREFIX:PATH=/usr \
    -D FONTS_INSTALL_DIR:PATH=share/fonts/TTF \
    -D USE_EXTERNAL_MAPBOX_GEOMETRY:BOOL=ON \
    -D USE_EXTERNAL_MAPBOX_POLYLABEL:BOOL=ON \
    -D USE_EXTERNAL_MAPBOX_PROTOZERO:BOOL=ON \
    -D USE_EXTERNAL_MAPBOX_VARIANT:BOOL=ON \
    -W no-dev
}

build() {
  export MAKEFLAGS
  cmake --build build
}

check() {
  ctest \
    --output-on-failure \
    --parallel \
    --test-dir build
}

package(){
  # Remove bundled dejavu fonts from cmake_install.cmake in favor of 'ttf-dejavu' package
  sed -i '/dejavu-fonts-ttf/d' "${srcdir}"/build/cmake_install.cmake

  # Install to pkgdir
  DESTDIR="${pkgdir}" cmake --install build

  # License
  install -Dm644 "${srcdir}"/mapnik/COPYING "${pkgdir}"/usr/share/licenses/"${pkgname}"/LICENSE

  # Remove usr/share/fonts directory
  pushd "${pkgdir}" || return
  rm -rf usr/share/fonts
}
