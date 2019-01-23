# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

# Contributor: Luigi Ranghetti <ggranga@gmail.com>

pkgbase=gdal-hdf4
_pkgbase=gdal
provides=('gdal')
conflicts=('gdal')
pkgname=('gdal-hdf4' 'python-gdal-hdf4' 'python2-gdal-hdf4')
pkgver=2.3.2
pkgrel=8.0
pkgdesc="A translator library for raster geospatial data formats, with support to HDF4 format (required to use MODIStsp tool: http://github.com/lbusett/MODIStsp)"
arch=('x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf' 'hdf4'
         'openjpeg2' 'poppler' 'cfitsio' 'sqlite' 'mariadb-libs' 'postgresql-libs' 'xerces-c' 'json-c')
makedepends=('perl' 'swig' 'chrpath' 'doxygen' 'python-numpy' 'python2-numpy')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl:  perl binding support')
options=('!emptydirs')
changelog=$pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        gdal-poppler-0.69.0.patch::https://github.com/OSGeo/gdal/commit/69e0701253.patch
        gdal-perl-vendor.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/gdal-perl-vendor.patch?h=packages/gdal)
sha256sums=('3f6d78fe8807d1d6afb7bed27394f19467840a82bc36d65e66316fa0aa9d32a4'
            'cc63ee56e2c62c994a65723d4124171ce9b4e3499c0958be710c04bf82fd4cf5'
            'a41a0129a878a0d09b8ecf24b8a0b473856d929d52f535afdf4dca95ddd347d3')

prepare() {
  cd "${srcdir}"/$_pkgbase-$pkgver

# Fix build with poppler >= 0.69.0
  patch -Np2 -i ../gdal-poppler-0.69.0.patch
# Fix build with poppler 0.72
  find frmts/pdf -type f | xargs sed -e 's|GBool|bool|g' -e 's|gFalse|false|g' -e 's|getCString|c_str|g' -i
# Fix build with poppler 0.73
  sed -e 's|#include <goo/gtypes.h>|typedef unsigned char Guchar;|' -i frmts/pdf/pdfsdk_headers.h

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure

# Fix Perl bindings installation path
  patch -Np1 -i ../gdal-perl-vendor.patch
}

build() {
  cd "${srcdir}"/$_pkgbase-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

# Ignore const-related errors (remove once fixed upstream)
  CXXFLAGS+=' -fpermissive'

# bug #23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed"

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
              --with-mysql --with-curl --with-hdf5 --with-hdf4=/opt/hdf4 --with-perl --with-geos \
              --with-png --with-poppler --with-spatialite --with-openjpeg

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  make
  make man

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python2 setup.py build
  python3 setup.py build
}

package_gdal-hdf4 () {
  cd "${srcdir}"/$_pkgbase-$pkgver

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

# install license
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/$_pkgbase/LICENSE

#FS15477 clean up junks - still present in 2.2.1
#   rm -f "${pkgdir}"/usr/share/man/man1/_build_gdal_src_gdal-${pkgver}_apps_.1

# Remove RPATH
  eval local $(perl -V:vendorarch)
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/OSR/OSR.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/OGR/OGR.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/GDAL/GDAL.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/GDAL/Const/Const.so
  chrpath --delete "${pkgdir}"${vendorarch}/auto/Geo/GNM/GNM.so
}

package_python-gdal-hdf4 () {
  pkgdesc="Python bindings for GDAL, with support to HDF4 format"
  provides=("python-gdal")
  conflicts=("python-gdal")
  depends=("gdal-hdf4=$pkgver" 'python-numpy')
  optdepends=()

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 -t "${pkgdir}"/usr/bin scripts/*.py

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$pkgname
}

package_python2-gdal-hdf4 () {
  pkgdesc="Python 2 bindings for GDAL, with support to HDF4 format"
  provides=("python2-gdal")
  conflicts=("python2-gdal")
  depends=("gdal-hdf4=$pkgver" 'python2-numpy')
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
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$pkgname
}
