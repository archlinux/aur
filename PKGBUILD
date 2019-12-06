# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

# Contributor: Luigi Ranghetti <ggranga@gmail.com>

pkgbase=gdal-hdf4
_pkgbase=gdal
provides=('gdal')
conflicts=('gdal')
pkgname=('gdal-hdf4' 'python-gdal-hdf4')
pkgver=3.0.2
pkgrel=1.0
pkgdesc="A translator library for raster geospatial data formats, with support to HDF4 format (required to use MODIStsp tool: http://github.com/lbusett/MODIStsp)"
arch=('x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf' 'hdf4'
         'openjpeg2' 'poppler' 'cfitsio' 'sqlite' 'mariadb-libs' 'postgresql-libs' 'xerces-c' 'json-c')
makedepends=('perl' 'swig' 'chrpath' 'doxygen' 'python-numpy' 'boost')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl: perl binding support')
options=('!emptydirs')
changelog=$pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        gdal-perl-vendor.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/gdal-perl-vendor.patch?h=packages/gdal)
sha256sums=('c3765371ce391715c8f28bd6defbc70b57aa43341f6e94605f04fe3c92468983'
            '2103b98f2f15954f042d5620658b30d703125927bde2e5eb671c5facb6c2f5ed')

prepare() {
  cd "${srcdir}"/$_pkgbase-$pkgver

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure

# Fix Perl bindings installation path
  patch -Np0 -i "${srcdir}"/gdal-perl-vendor.patch
}

build() {
  cd "${srcdir}"/$_pkgbase-$pkgver

  ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
              --with-mysql --with-curl --with-hdf5 --with-hdf4=/opt/hdf4 --with-perl --with-geos \
              --with-png --with-poppler --with-spatialite --with-openjpeg

# workaround for bug #13646
#   sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
#   sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  make
  make man

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python3 setup.py build
}

package_gdal-hdf4 () {
  cd "${srcdir}"/$_pkgbase-$pkgver

  make DESTDIR="${pkgdir}" install
  make DESTDIR="${pkgdir}" install-man

# install license
  install -Dm644 LICENSE.TXT "${pkgdir}"/usr/share/licenses/$_pkgbase/LICENSE

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
