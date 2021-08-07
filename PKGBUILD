pkgname=mingw-w64-qgis
pkgver=3.20.1
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats (mingw-w64)'
url='https://qgis.org/'
license=('GPL')
arch=('any')
depends=('mingw-w64-protobuf' 'mingw-w64-qt5-3d' 'mingw-w64-qt5-imageformats' 'mingw-w64-qt5-serialport' 'mingw-w64-gdal' 'mingw-w64-libzip' 'mingw-w64-qca-qt5' 'mingw-w64-gsl' 'mingw-w64-exiv2' 'mingw-w64-hdf5' 'mingw-w64-libxml2' 'mingw-w64-netcdf' 'mingw-w64-fcgi' 'mingw-w64-qwt' 'mingw-w64-pdal' 'mingw-w64-qscintilla-qt5')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://qgis.org/downloads/qgis-$pkgver.tar.bz2")
sha256sums=('a4209df4d5b1a2ffb1c8c3e0d2f0b17ccea118197b43fbb1185e5dcdf0bc520d')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd qgis-$pkgver
  # Fix infinite loop
  curl -L https://github.com/qgis/QGIS/commit/19823b76.patch | patch -p1

  curl -L https://github.com/qgis/QGIS/commit/6f9cbde7c782274ebe5875da7dbac98d68e9827b.patch | patch -p1
  curl -L https://github.com/qgis/QGIS/commit/581cb40603dd3daca2916b564a4cd2630d005556.patch | patch -p1
  curl -L https://github.com/qgis/QGIS/pull/44460.patch | patch -p1

  sed -i "s|QWT_POLAR_VERSION|0x20000|g" src/app/gps/qgsgpsinformationwidget.cpp
  sed -i "s|QT_SHARED|QT_STATIC|g" src/customwidgets/CMakeLists.txt
}

build() {
  cd qgis-$pkgver
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    LDFLAGS="-fno-lto" ${_arch}-cmake \
    -DQGIS_BIN_SUBDIR=bin -DQGIS_DATA_SUBDIR=share \
    -DQGIS_LIBEXEC_SUBDIR=bin \
    -DQGIS_CGIBIN_SUBDIR=bin \
    -DQGIS_PLUGIN_SUBDIR=lib/qgis/plugins \
    -DQGIS_SERVER_MODULE_SUBDIR=bin \
    -DWITH_QTWEBKIT=OFF \
    -DWITH_BINDINGS=OFF \
    -DWITH_SERVER_PLUGINS=OFF \
    -DENABLE_TESTS=OFF \
    -DUSE_OPENCL=OFF \
    -DWITH_3D=TRUE \
    -DWITH_SERVER=TRUE \
    -DWITH_CUSTOM_WIDGETS=TRUE \
    -DBINDINGS_GLOBAL_INSTALL=TRUE \
    -DQGIS_MANUAL_SUBDIR=share/man \
    -DWITH_QWTPOLAR=TRUE \
    -DQWTPOLAR_LIBRARY=/usr/${_arch}/lib/libqwt.dll.a \
    -DWITH_INTERNAL_QWTPOLAR=FALSE \
    -DWITH_PDAL=OFF ..
   make
   popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "$srcdir"/qgis-$pkgver/build-${_arch}
    make install DESTDIR="$pkgdir"
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
