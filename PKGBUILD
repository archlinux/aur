# $Id$
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

# Contributor: Luigi Ranghetti <ggranga@gmail.com>

pkgbase=gdal-hdf4
pkgname=(gdal-hdf4 python-gdal-hdf4 python2-gdal-hdf4)
_pkgbase=gdal
_pkgname=(gdal python-gdal python2-gdal)
pkgver=2.2.4
pkgrel=4
pkgdesc="A translator library for raster geospatial data formats, with support to HDF4 format (required to use MODIStsp tool: http://github.com/lbusett/MODIStsp)"
arch=('x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf' 'hdf4-nonetcdf'
         'openjpeg2' 'poppler' 'cfitsio' 'sqlite' 'libmariadbclient' 'postgresql-libs' 'xerces-c' 'json-c')
makedepends=('perl' 'swig' 'chrpath' 'doxygen' 'python-numpy' 'python2-numpy')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl:  perl binding support')
options=('!emptydirs')
changelog=$_pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        gdal-perl-vendor.patch gdal-poppler-0.64.patch)
sha256sums=('441eb1d1acb35238ca43a1a0a649493fc91fdcbab231d0747e9d462eea192278'
            '20989e5fa499206b42c92280ce084fdf7b2f661a4233fc349611cc57102fe114'
            '34d7909e1375aa407936374d65a561a6803b59b1280be7f878fb45049f629b40')

prepare() {
  cd "${srcdir}"/$_pkgbase-$pkgver

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure

# Fix Perl bindings installation path
  patch -Np1 -i ../gdal-perl-vendor.patch
# Fix build with poppler 0.64
  patch -p2 -i ../gdal-poppler-0.64.patch
}

build() {
  cd "${srcdir}"/$_pkgbase-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

# bug #23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed"

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
              --with-mysql --with-curl --with-hdf5 --with-hdf4 --with-perl --with-geos \
              --with-png --with-poppler --with-spatialite --with-openjpeg

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

# bug: http://osgeo-org.1560.x6.nabble.com/gdal-dev-jpeg2000-jasper-error-compiling-gdal-2-1-from-git-release-branch-td5299100.html
  sed -i -e 's@uchar@unsigned char@' frmts/jpeg2000/jpeg2000_vsil_io.cpp

  make
  make man

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python2 setup.py build
  python3 setup.py build
}

package_gdal-hdf4 () {
  provides=(gdal)
  conflicts=(gdal)

  cd "${srcdir}"/$_pkgbase-$pkgver

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

# install license
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/$_pkgbase/LICENSE

#FS15477 clean up junks - still present in 2.2.1
  rm -f "${pkgdir}"/usr/share/man/man1/_build_gdal_src_gdal-${pkgver}_apps_.1

# Remove RPATH
  eval local $(perl -V:vendorarch)
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/GDAL/Const/Const.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/GNM/GNM.so
}

package_python-gdal-hdf4 () {
  provides=(python-gdal)
  conflicts=(python-gdal)
  pkgdesc="Python bindings for GDAL, with support to HDF4 format"
  depends=("gdal=$pkgver" 'python-numpy')
  optdepends=()

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 -t "${pkgdir}"/usr/bin scripts/*.py

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$_pkgname
}

package_python2-gdal-hdf4 () {
  provides=(python2-gdal)
  conflicts=(python2-gdal)
  pkgdesc="Python 2 bindings for GDAL, with support to HDF4 format"
  depends=("gdal=$pkgver" 'python2-numpy')
  optdepends=()

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python

# python2 fixes
  for file in {,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

  python2 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 -t "${pkgdir}"/usr/bin scripts/*.py
  for file in "${pkgdir}"/usr/bin/*; do mv "${file}" "${file%.py}2.py"; done

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$_pkgname
}
