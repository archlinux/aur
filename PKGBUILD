
pkgname=mingw-w64-gdal
pkgver=1.11.2
pkgrel=1
pkgdesc="A translator library for raster geospatial data formats (mingw-w64)"
arch=('any')
url="http://www.gdal.org/"
license=('custom')
depends=('mingw-w64-curl' 'mingw-w64-jasper' 'mingw-w64-giflib' 'mingw-w64-hdf5' 'mingw-w64-netcdf' 'mingw-w64-libgeotiff' 'mingw-w64-libfreexl' 'mingw-w64-libjpeg' 'mingw-w64-libpng' 'mingw-w64-libtiff' 'mingw-w64-sqlite' 'mingw-w64-postgresql-libs')
makedepends=('perl' 'mingw-w64-configure')
options=('!buildflags' '!strip' 'staticlibs')
source=("http://download.osgeo.org/gdal/${pkgver}/gdal-${pkgver}.tar.gz"
        gdal-sqlite-3.8.7.patch gdal-1-fixes.patch)
sha256sums=('66bc8192d24e314a66ed69285186d46e6999beb44fc97eeb9c76d82a117c0845'
            '2c1546f3303c27b5b9476192fd1f75fad0824380e711699ab09c2dd2f42d53c0' SKIP)

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

prepare() {
  cd "${srcdir}"/gdal-$pkgver
  patch -Np2 -i "${srcdir}"/gdal-sqlite-3.8.7.patch
  patch -Np1 -i "${srcdir}"/gdal-1-fixes.patch
  autoreconf -vi
}

build() {
  cd "${srcdir}"
  cd gdal-${pkgver}
  for _arch in ${_architectures}; do
    rm -rf build-${_arch}
    mkdir -p build-${_arch}
#     && pushd build-${_arch}
    cp aclocal.m4 autogen.sh COMMITERS config.guess config.sub configure configure.in Doxyfile GDALmake.opt.in build-${_arch}
    cp gdalnightlysvn.sh gdal.pc.in GNUmakefile HOWTO-RELEASE install-sh LICENSE.TXT ltmain.sh makefile.vc makegdal_gen.bat build-${_arch}
    cp MIGRATION_GUIDE.TXT mkbindist.sh mkgdaldist.sh mktestdist.sh NEWS nmake.opt nmake-wince.opt PROVENANCE.TXT build-${_arch}
    cp submake.bat svnkeywords.sh update_copyright.py Vagrantfile VERSION    build-${_arch} 
    cp -r    alg apps bridge data doc frmts gcore    html m4  man   ogr port scripts swig vb6 wince build-${_arch}
    pushd build-${_arch}
    export LIBXML2_CONFIG=/usr/${_arch}/bin/xml2-config
    export CURL_CONFIG=/usr/${_arch}/bin/curl-config
    export PG_CONFIG=no
    ${_arch}-configure  \
      --with-bsb \
      --with-grib \
      --with-ogr \
      --with-pam \
      --without-threads \
      --with-static-proj4 \
      --with-libz=/usr/${_arch} \
      --with-png=/usr/${_arch} \
      --with-geotiff=/usr/${_arch} \
      --with-libtiff=/usr/${_arch} \
      --with-jpeg=/usr/${_arch} \
      --with-jasper=/usr/${_arch} \
      --with-gif=/usr/${_arch} \
      --with-expat=/usr/${_arch} \
      --with-sqlite3=/usr/${_arch} \
      --with-hdf5=/usr/${_arch} \
      --with-libjson-c=/usr/${_arch} \
      --with-netcdf=/usr/${_arch} \
      --without-pg \
      --with-geos=/usr/${_arch} \
      --with-xml2=/usr/${_arch} \
      --with-curl=/usr/${_arch} \
      --without-odbc \
      --without-xerces \
      --without-grass \
      --without-libgrass \
      --without-spatialite \
      --without-cfitsio \
      --without-pcraster \
      --without-pcidsk \
      --without-ogdi \
      --without-fme \
      --without-ecw \
      --without-kakadu \
      --without-mrsid \
      --without-jp2mrsid \
      --without-msg \
      --without-oci \
      --without-mysql \
      --without-ingres \
      --without-dods-root \
      --without-dwgdirect \
      --without-idb \
      --without-sde \
      --without-epsilon \
      --without-perl \
      --without-php \
      --without-ruby \
      --without-python
    make
    popd
  done
}

package () {
  for _arch in ${_architectures}; do
    cd "${srcdir}/gdal-${pkgver}/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm "$pkgdir"/usr/${_arch}/bin/*.exe
    rm "$pkgdir"/usr/${_arch}/share
    ${_arch}-strip --strip-unneeded "$pkgdir"/usr/${_arch}/bin/*.dll
    ${_arch}-strip -g "$pkgdir"/usr/${_arch}/lib/*.a
  done
}
