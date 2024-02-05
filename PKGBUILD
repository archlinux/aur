# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Dent <thewinch@gmail.com>
# Contributor: orbisvicis <orbisvicis@gmail.com>
# Maintainer: Fritz Engelbrecht <fritz.engl+arch@gmail.com>
# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=mapnik-git
pkgver=4.0.0.r13809.g4f6ab6a
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
         'libjpeg-turbo'
         'libpng'
         'libtiff'
         'libwebp'
         'libxml2'
         'postgresql-libs'
         'proj'
         'python'
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
provides=('mapnik')
source=('git+https://github.com/mapnik/mapnik.git'
        'mapnik-datasource-ogr-test.patch'
        'mapnik-use-system-sparsehash.patch'
        'git+https://github.com/mapnik/test-data.git')
sha256sums=('SKIP'
            '3fcf178e646df526e9a5c278f56ad16e4f75d2f27108e7b33419649a46b92f52'
            'dabb1b99540a6df86b34511d0d94ef505f706419b7e6d1d69314797ebcdce72f'
            'SKIP')

pkgver() {
  cd mapnik || exit
  printf "4.0.0.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd mapnik || exit
  patch -Np1 < ../mapnik-datasource-ogr-test.patch
  patch -Np1 < ../mapnik-use-system-sparsehash.patch
  git submodule init \
    test/data
  git config submodule.test/data.url "$srcdir"/test-data
  git -c protocol.file.allow=always submodule update \
    test/data

  # Remove bundled sparsehash directory in favor of 'sparsehash' package
  rm -rf deps/mapnik/sparsehash
}

build() {
  cmake -B mapnik_build -S mapnik \
    -DBUILD_BENCHMARK:BOOL=OFF \
    -DBUILD_DEMO_CPP:BOOL=OFF \
    -DBUILD_DEMO_VIEWER:BOOL=OFF \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DCMAKE_CXX_STANDARD:STRING=17 \
    -DCMAKE_INSTALL_PREFIX:PATH=/usr \
    -DFONTS_INSTALL_DIR:PATH=share/fonts/TTF \
    -DUSE_EXTERNAL_MAPBOX_GEOMETRY:BOOL=ON \
    -DUSE_EXTERNAL_MAPBOX_POLYLABEL:BOOL=ON \
    -DUSE_EXTERNAL_MAPBOX_PROTOZERO:BOOL=ON \
    -DUSE_EXTERNAL_MAPBOX_VARIANT:BOOL=ON
  cmake --build mapnik_build
}

check() {
  ctest --output-on-failure --test-dir mapnik_build
}

package(){
  # Remove bundled dejavu fonts from cmake_install.cmake in favor of 'ttf-dejavu' package
  sed -i '/dejavu-fonts-ttf/d' "$srcdir"/mapnik_build/cmake_install.cmake

  # Install to $DESTDIR
  DESTDIR="$pkgdir" cmake --install mapnik_build --strip

  # License
  install -Dm644 "$srcdir"/mapnik/COPYING "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE

  # Remove usr/share/fonts directory
  pushd "$pkgdir"
  rm -rf usr/share/fonts
}
