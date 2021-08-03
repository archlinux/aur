pkgname=mingw-w64-gdal
pkgver=3.3.1
pkgrel=1
pkgdesc="A translator library for raster geospatial data formats (mingw-w64)"
arch=('any')
url="http://www.gdal.org/"
license=('custom')
depends=('mingw-w64-curl' 'mingw-w64-hdf5' 'mingw-w64-netcdf' 'mingw-w64-libgeotiff' 'mingw-w64-libjpeg' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-sqlite' 'mingw-w64-postgresql' 'mingw-w64-geos' 'mingw-w64-giflib' 'mingw-w64-libfreexl' 'mingw-w64-libheif')
makedepends=('perl' 'mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-${pkgver}.tar.gz")
sha256sums=('6c3c2422d129a9fef030d6aaa5bd3dd45ee798808953099313ffd36ab2945055')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/gdal-$pkgver
  touch config.rpath
}

build() {
  cd "${srcdir}"
  for _arch in ${_architectures}; do
    rm -rf build-${_arch} && cp -r gdal-$pkgver build-${_arch} && pushd build-${_arch}
    sed -i "s|/usr/local|/usr/${_arch}|g" configure.ac
    sed -i "s|/usr|/usr/${_arch}|g" configure.ac m4/*.m4
    autoreconf -vfi
    ./autogen.sh 
    ${_arch}-configure --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
      --with-mysql --with-curl --with-hdf5 --with-perl --with-geos \
      --with-png --with-poppler --with-spatialite --with-openjpeg \
      --without-python --without-perl \
      --with-geos=/usr/${_arch}/bin/geos-config \
      --with-netcdf=/usr/${_arch} \
      .
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gdal-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -rf "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
