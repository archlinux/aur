# Maintainer: Dražen Odobašić <dodobasic at gmail>

pkgname=gdal-curl
_pkgname=gdal
pkgver=2.0.1
pkgrel=2
pkgdesc="A translator library for raster geospatial data formats with curl and podofo (PDF) support"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg' 'libpng' 'libtiff' 'netcdf'  'python2' 'python2-numpy' 'cfitsio' 'sqlite3' 'libmariadbclient' 'postgresql-libs' 'podofo')
makedepends=('perl' 'swig' 'chrpath')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb/mysql database support'
            'swig:  perl binding support'
	    'poppler: pdf conversion support'
	    'libspatialite: spatiallite support')
options=('!libtool' '!makeflags')
source=(http://download.osgeo.org/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.xz \
	gdal-1.5.1-python-install.patch
)

md5sums=('27022cc4a3e0819ab02a69c2d0867437'
         '81afc1c26d29cee84aadb6924fe33861')

provides=('gdal==2.0.0')
conflicts=('gdal')

build() {

  cd ${srcdir}/$_pkgname-$pkgver
  patch -Np0 -i ${srcdir}/gdal-1.5.1-python-install.patch

  # python2 fixes
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 \
              --with-geotiff --with-mysql --with-python=/usr/bin/python2 \
	      --without-libtool --with-curl --with-hdf5 --with-perl --with-geos \
              --with-png --with-podofo --with-spatialite

  make
}

package () {
  cd ${srcdir}/$_pkgname-$pkgver

  make DESTDIR=${pkgdir} install

  # install license
  install -D -m644 LICENSE.TXT ${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE

  #FS15477 clean up junks
  rm -f ${pkgdir}/usr/bin/*.dox

  # Remove RPATH
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"/usr/lib/perl5/${CARCH}-linux-thread-multi/auto/Geo/GDAL/Const/Const.so
}
