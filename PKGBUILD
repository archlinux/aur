# Maintainer: SaultDon <sault.don gmail>
# Contributor: Dražen Odobašić <dodobasic at gmail>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gdal-filegdb
_pkgname=gdal
_pkgver=2.0
pkgver=2.0
pkgrel=3
pkgdesc="A translator library for vector and raster geospatial data formats (PDF, FileGDB, KMZ support)"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('geos' 'proj'
         'hdf5' 'netcdf'
         'libgeotiff' 'giflib' 'libjpeg' 'libpng' 'libtiff' 'openjpeg2'
         'python2' 'python2-numpy'
         'cfitsio' 'curl'
         'sqlite3' 'libmariadbclient' 'unixodbc' 'libspatialite' 'pcre' 'postgresql-libs'
         'poppler'
         'opencl-headers'
         'filegdb-api'
         'json-c'
         'jdk7-openjdk'
         'libwebp'
         'libkml')
makedepends=('perl'
             'swig'
             'chrpath'
             'svn'
             'doxygen')
changelog=$pkgname.changelog
source=("$_pkgname-$_pkgver::svn+https://svn.osgeo.org/gdal/branches/${_pkgver}/gdal"
        'gdal-1.5.1-python-install.patch')
md5sums=('SKIP'
         '81afc1c26d29cee84aadb6924fe33861')
provides=("$_pkgname=$_pkgver")
conflicts=("$_pkgname")

pkgver() {
  cd "$_pkgname-$_pkgver"
  local ver="$(svnversion)"
  printf "%s.r%s" "${_pkgver}" "${ver//[[:alpha:]]}"
}

prepare() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  patch -Np0 -i "${srcdir}"/gdal-1.5.1-python-install.patch

  # python2 fixes
  sed -i 's_python python1.5_python2 python python1.5_' configure
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
    sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  # Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure
}

build() {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  export CFLAGS+=" -fno-strict-aliasing"
  export CPPFLAGS+=" -Dlinux"
  # bug 23654
  export LDFLAGS+=" -Wl,--as-needed"
  
  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 \
              --with-geotiff --with-mysql=/usr/bin/mysql_config --with-python=/usr/bin/python2 --with-jpeg12 \
              --without-libtool --with-curl --with-hdf5 --with-perl --with-geos --with-openjpeg \
              --with-png --with-poppler --with-spatialite --with-pcre --without-grass --with-liblzma \
              --with-fgdb=/usr --with-odbc --with-libkml \
              --with-opencl --with-libjson-c --with-mdb=yes --with-webp \
              --with-java=/usr/lib/jvm/java-7-openjdk --with-jvm-lib=/usr/lib/jvm/java-7-openjdk/jre/lib/amd64/server --with-jvm-lib-add-rpath=yes \

  # workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  cd swig/perl
  make veryclean
  make generate
#  make build

  cd ../..
  make
  make man
}

package () {
  cd "${srcdir}/${_pkgname}-${_pkgver}"

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

  # install license
  install -D -m644 LICENSE.TXT "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"

  # FS15477 clean up junks
  rm -f "${pkgdir}"/usr/bin/*.dox
  rm -f "${pkgdir}"/usr/share/man/man1/_tmp_makepkg_${pkgname}_src_gdal-${pkgver}_apps_.1

  # Remove RPATH
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/Const/Const.so
}
