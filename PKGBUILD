pkgname=mingw-w64-gdal
pkgver=3.4.3
pkgrel=1
pkgdesc="A translator library for raster geospatial data formats (mingw-w64)"
arch=('any')
url="http://www.gdal.org/"
license=('custom')
depends=('mingw-w64-curl' 'mingw-w64-hdf5' 'mingw-w64-netcdf' 'mingw-w64-libgeotiff' 'mingw-w64-libjpeg-turbo' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-sqlite' 'mingw-w64-postgresql' 'mingw-w64-geos' 'mingw-w64-giflib' 'mingw-w64-libfreexl' 'mingw-w64-libheif' 'mingw-w64-libwebp' 'mingw-w64-expat' 'mingw-w64-mariadb-connector-c')
makedepends=('perl' 'mingw-w64-configure' 'mingw-w64-wine' 'protobuf')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-${pkgver}.tar.gz")
sha256sums=('7244962628c82921b4a4903dbb721c7222b7d82ed5928fef55a52f87f68ad1fe')

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
    echo -e "#!/bin/sh\n${_arch}-wine /usr/${_arch}/bin/mariadb_config.exe \$@" > mariadb_config && chmod a+rx mariadb_config
    autoreconf -vfi
    ./autogen.sh 
    LDFLAGS="-lssp -lssl -lcrypt32" ${_arch}-configure --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
      --with-mysql=./mariadb_config --with-curl=/usr/${_arch}/bin/curl-config --with-hdf5 --with-perl --with-geos \
      --with-png --with-poppler --with-spatialite --with-openjpeg \
      --without-python --without-perl \
      --with-geos=/usr/${_arch}/bin/geos-config \
      --with-netcdf=/usr/${_arch} \
      --with-mysql=./mariadb_config \
      .
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm -rf "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
