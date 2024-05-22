# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: David Dent <thewinch@gmail.com>
# Contributor: orbisvicis <orbisvicis@gmail.com>
# Maintainer: Fritz Engelbrecht <fritz.engl+arch@gmail.com>
# Maintainer: David Hummel <david dot hummel at gmail point com>

pkgname=mapnik-git
pkgver=4.0.0.rc1.r45.gd7a490f
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
        'mapnik-use-system-sparsehash.patch'
        'mapnik-gcc14.patch'
        'git+https://github.com/mapnik/test-data.git')
sha256sums=('SKIP'
            'dabb1b99540a6df86b34511d0d94ef505f706419b7e6d1d69314797ebcdce72f'
            '9916d5c2958bca6e2789b18cd8c738bc10363289d96b436f7a9e6a0d9048e17b'
            'SKIP')

pkgver() {
  cd mapnik || exit
  git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd mapnik || exit
  patch -Np1 < ../mapnik-use-system-sparsehash.patch
  patch -Np1 < ../mapnik-gcc14.patch
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
