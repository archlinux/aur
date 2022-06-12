pkgname=mingw-w64-qgis
pkgver=3.24.3
pkgrel=1
pkgdesc='Geographic Information System (GIS) that supports vector, raster & database formats (mingw-w64)'
url='https://qgis.org/'
license=('GPL')
arch=('any')
depends=('mingw-w64-protobuf' 'mingw-w64-qt5-3d' 'mingw-w64-qt5-imageformats' 'mingw-w64-qt5-serialport' 'mingw-w64-gdal' 'mingw-w64-libzip' 'mingw-w64-qca-qt5' 'mingw-w64-gsl' 'mingw-w64-exiv2' 'mingw-w64-hdf5' 'mingw-w64-libxml2' 'mingw-w64-netcdf' 'mingw-w64-fcgi' 'mingw-w64-qwt' 'mingw-w64-pdal' 'mingw-w64-qscintilla-qt5' 'mingw-w64-spatialindex' 'mingw-w64-qtkeychain-qt5' 'mingw-w64-libspatialite')
makedepends=('mingw-w64-cmake')
options=('!buildflags' '!strip' 'staticlibs')
source=("https://qgis.org/downloads/qgis-$pkgver.tar.bz2")
sha256sums=('fc9fa28e10c32773f49f1de0c52a35a393060acd6f799d6926f08e96fbaf2b4e')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd qgis-$pkgver
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
    -DHDF5_ROOT=/usr/${_arch} \
    ..
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
