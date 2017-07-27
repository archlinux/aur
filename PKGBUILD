# $Id$
# Maintainer: Jose Riha <jose1711 gmail com>
# Contributor: Ray Rashif <schiv@archlinux.org>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

# ALARM: Kevin Mihelich <kevin@archlinuxarm.org>
#  - drop poppler, currently breaks build
#  - use uname in path in removing rpath in packaging

pkgname=gdal1
_pkgname=gdal
pkgver=1.11.5
pkgrel=3
pkgdesc="A translator library for raster geospatial data formats"
arch=('i686' 'x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg' 'libpng' 'libspatialite' 'libtiff' 'netcdf' 'python2' 'python2-numpy' 'cfitsio' 'sqlite' 'libmariadbclient' 'postgresql-libs')
makedepends=('perl' 'swig' 'chrpath' 'doxygen')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl:  perl binding support')
changelog=$pkgname.changelog
source=(http://download.osgeo.org/${_pkgname}/${pkgver}/${_pkgname}-${pkgver}.tar.gz
        gdal-1.5.1-python-install.patch
        poppler-0.31.patch
	glibc.patch
	jpeg2000.patch
	ptr_int_cmp.patch)
sha256sums=('49f99971182864abed9ac42de10545a92392d88f7dbcfdb11afe449a7eb754fe'
            '55a0a961b2d1caddf80f18b6763a96690b0b6443fbd5a0c89e29503ded3bcea6'
            '4fc42bdb729cec92920236ef9f3302fab497069dbb7d41d81222e7e48a36e7a6'
            'f0096bfbd9219a000d173a97ee10e30d8939c3fff40ef44e2dfb1a494b617a9f'
            'fbc8c12a2e7b368e827b6bd60fbc0192ffd9231feb938d2a798c4a2f064f9e12'
            '0146e06294a2ad32b78cd434af04ddac1c461a62900cec1265f71b53387451b0')

prepare() {
  cd "${srcdir}"/$_pkgname-$pkgver
  patch -Np0 -i "${srcdir}"/gdal-1.5.1-python-install.patch
  patch -Np0 -i "${srcdir}"/jpeg2000.patch frmts/jpeg2000/jpeg2000_vsil_io.cpp
  patch -Np1 -i "${srcdir}"/ptr_int_cmp.patch
  # patch -Np1 -i "${srcdir}"/poppler-0.31.patch
  # patch -Np3 -i "${srcdir}"/glibc.patch

# python2 fixes
  sed -i 's_python python1.5_python2 python python1.5_' configure
  for file in swig/python/{,osgeo/,samples/,scripts/}*.py; do
      sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' $file
  done

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure
}

build() {
  cd "${srcdir}"/$_pkgname-$pkgver
  export CFLAGS="$CFLAGS -fno-strict-aliasing"

# bug #23654
  export LDFLAGS="$LDFLAGS -Wl,--as-needed"

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 \
              --with-geotiff --with-mysql --with-python --with-curl \
              --with-hdf5 --with-perl --with-geos --with-png --with-spatialite \
              --includedir=/usr/include/gdal1 --libdir=/usr/lib/gdal1 \
              --datadir=/usr/share/gdal1

# workaround for bug #13646
  sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
  sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  make
  #make man
}

package () {
  cd "${srcdir}"/$_pkgname-$pkgver
  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

# install license
  install -D -m644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/gdal1/LICENSE

#FS15477 clean up junks
  rm -f "${pkgdir}"/usr/bin/*.dox
  rm -f "${pkgdir}"/usr/share/man/man1/_build_gdal_src_gdal-${pkgver}_apps_.1

  rm -f "${pkgdir}"/usr/bin/*
  rm -rf "${pkgdir}"/usr/share/man
  rm -rf "${pkgdir}"/usr/lib/perl5
  rm -rf "${pkgdir}"/usr/lib/python3.5

# Remove RPATH
  #chrpath --delete "${pkgdir}"/usr/lib/perl5/$(uname -m)-linux-thread-multi/auto/Geo/OSR/OSR.so
  #chrpath --delete "${pkgdir}"/usr/lib/perl5/$(uname -m)-linux-thread-multi/auto/Geo/OGR/OGR.so
  #chrpath --delete "${pkgdir}"/usr/lib/perl5/$(uname -m)-linux-thread-multi/auto/Geo/GDAL/GDAL.so
  #chrpath --delete "${pkgdir}"/usr/lib/perl5/$(uname -m)-linux-thread-multi/auto/Geo/GDAL/Const/Const.so
}
