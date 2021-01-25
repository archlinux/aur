# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Luigi Ranghetti <ggranga@gmail.com>
# Contributor: Oliver Kuster <olivervbk@gmail.com>

pkgbase=gdal-ecw
_pkgbase=gdal
provides=('gdal=3.0.4')
conflicts=('gdal')
pkgname=('gdal-ecw' 'python-gdal-ecw')
pkgver=3.0.4
pkgrel=4
pkgdesc="A translator library for raster geospatial data formats, with support to ECW format. Based on gdal-hdf4 AUR package."
arch=('x86_64')
url="http://www.gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf'
         'openjpeg2' 'poppler' 'cfitsio' 'sqlite' 'mariadb-libs' 'postgresql-libs' 'xerces-c' 'json-c'
# needed for ecw support:
'libecwj2' )

makedepends=('perl' 'swig' 'chrpath' 'doxygen' 'python-numpy' 'boost')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl: perl binding support'
            'unixodbc: when present while building, will add odbc support'
)
options=('!emptydirs')
changelog=$pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        poppler-20.08.0.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/poppler-20.08.0.patch?h=packages/gdal
        gdal-perl-vendor.patch::https://git.archlinux.org/svntogit/community.git/plain/trunk/gdal-perl-vendor.patch?h=packages/gdal
        jpeg2000-issue-vendor.patch)
sha256sums=('5569a4daa1abcbba47a9d535172fc335194d9214fdb96cd0f139bb57329ae277'
            'dc8ccbc9a672a8489a1660fa66804d74c3015c47b44e2d41e17f8609249279df'
            '2103b98f2f15954f042d5620658b30d703125927bde2e5eb671c5facb6c2f5ed'
            'e0e07aecffea83fd8b926d7e2c460b31c028826766f68947f96bf2d2ecb3bb7b'
)

prepare() {
  cd "${srcdir}"/$_pkgbase-$pkgver

# Fix mandir
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure

# Fix build with poppler 20.08.0
  patch -Np2 -i "${srcdir}"/poppler-20.08.0.patch
  
# Fix Perl bindings installation path
  patch -Np0 -i "${srcdir}"/gdal-perl-vendor.patch
  
# Fix compilation issues related to jpeg2000:
# https://github.com/OSGeo/gdal/issues/2844
  patch -Np2 -i "${srcdir}"/jpeg2000-issue-vendor.patch
}

build() {
  cd "${srcdir}"/$_pkgbase-$pkgver

    ./configure --prefix=/usr --with-netcdf --with-libtiff --with-sqlite3 --with-geotiff \
              --with-mysql --with-curl --with-hdf5 --with-perl --with-geos \
              --with-png --with-poppler --with-spatialite --with-openjpeg \
              --with-ecw

# workaround for bug #13646
#   sed -i 's/PY_HAVE_SETUPTOOLS=1/PY_HAVE_SETUPTOOLS=/g' ./GDALmake.opt
#   sed -i 's/EXE_DEP_LIBS/KILL_EXE_DEP_LIBS/' apps/GNUmakefile

  echo "Compiling..."
  make -j$(nproc)

  echo "Compiling man pages..."
  make man

  echo "Building python3 bindings..."
  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python3 setup.py build
}

package_gdal-ecw () {
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

package_python-gdal-ecw () {
  pkgdesc="Python bindings for GDAL, with support to ECW format"
  provides=("python-gdal")
  conflicts=("python-gdal")
  depends=("gdal-ecw=$pkgver" 'python-numpy')
  optdepends=()

  cd "${srcdir}"/$_pkgbase-$pkgver/swig/python
  python3 setup.py install --root="$pkgdir" --optimize=1
  install -Dm755 -t "${pkgdir}"/usr/bin scripts/*.py

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$pkgname
}
