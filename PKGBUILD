# $Id: PKGBUILD 169825 2016-04-09 13:23:33Z foutrelis $
# Maintainer: Luigi Ranghetti <ggranga@gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgname=gdal-hdf4
pkgname_gdal=gdal
pkgver=2.0.2
pkgrel=4
pkgdesc="A translator library for raster geospatial data formats, with support to HDF4 format (requested to use MODIStsp tool: http://github.com/lbusett/MODIStsp)"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf'
         'openjpeg2' 'poppler' 'python2' 'python2-numpy' 'cfitsio' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'hdf4-nonetcdf')
makedepends=('perl' 'swig' 'chrpath' 'doxygen')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl:  perl binding support')
provides=('gdal')
conflicts=('gdal')
options=('!emptydirs')
changelog=$pkgname_gdal.changelog
source=(http://download.osgeo.org/${pkgname_gdal}/${pkgver}/${pkgname_gdal}-${pkgver}.tar.gz
        gdal-python-install.patch)
sha256sums=('db7722caf8d9dd798ec18012b9cacf40a518918466126a88b9fd277bd7d40cc4'
            '823199fdedf5953d9b6bffb0e58a810490e958054f5a9da9d5cd1818f89cd51a')

prepare() {
  cd "${srcdir}"/$pkgname_gdal-$pkgver
  patch -Np0 -i "${srcdir}"/gdal-python-install.patch

# python2 fixes
  sed -i 's_python python1.5_python2 python python1.5_' configure
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure
}

build() {
  cd "${srcdir}"/$pkgname_gdal-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

# bug #23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed" 

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
              --with-mysql --with-python --with-curl --with-hdf4 --with-hdf5 --with-perl --with-geos \
              --with-png --with-poppler --with-spatialite --with-openjpeg

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  make
  make man
}

package () {
  cd "${srcdir}"/$pkgname_gdal-$pkgver
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

# install license
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/$pkgname_gdal/LICENSE

#FS15477 clean up junks
  rm -f "${pkgdir}"/usr/bin/*.dox
  rm -f "${pkgdir}"/usr/share/man/man1/_build_gdal_src_gdal-${pkgver}_apps_.1
#FS#46581 no better way found yet
  mv "${pkgdir}"/usr/man/man3 "${pkgdir}"/usr/share/man
  rm -rf "${pkgdir}"/usr/man

# Remove RPATH
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/Const/Const.so
}
