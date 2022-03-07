# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Luigi Ranghetti <ggranga@gmail.com>
# Contributor: Oliver Kuster <olivervbk (at) gmail>
#
# Original can be found at:
# https://github.com/archlinux/svntogit-community/blob/packages/gdal/trunk/PKGBUILD

pkgbase=gdal-ecw
_pkgbase=gdal
provides=('gdal=3.4.0')
conflicts=('gdal')
pkgname=('gdal-ecw' 'python-gdal-ecw')
pkgver=3.4.0
pkgrel=2
pkgdesc="A translator library for raster geospatial data formats, with support to ECW format. Based on gdal-hdf4 AUR package."
arch=('x86_64')
url="https://gdal.org/"
license=('custom')
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf'
         'openjpeg2' 'poppler' 'cfitsio' 'sqlite' 'mariadb-libs' 'postgresql-libs' 'xerces-c' 'json-c'
# needed for ecw support:
'libecwj2' )

makedepends=('perl' 'swig' 'chrpath' 'doxygen' 'python-breathe' 'python-numpy' 'python-sphinx' 'boost')
optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl: perl binding support'
            'unixodbc: when present while building, will add odbc support'
)
options=('!emptydirs')
changelog=$pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        https://raw.githubusercontent.com/archlinux/svntogit-community/3a1ed1385f3ff65de7f463789e58c77afe1fb6fa/trunk/gdal-perl-vendor.patch
	https://raw.githubusercontent.com/archlinux/svntogit-community/b1f3eb2d48ab8ffdf6ce78b11eff4f9fdc2099dc/trunk/poppler-22.03.0.patch
)
sha256sums=('ac7bd2bb9436f3fc38bc7309704672980f82d64b4d57627d27849259b8f71d5c'
            '2103b98f2f15954f042d5620658b30d703125927bde2e5eb671c5facb6c2f5ed'
            'b60d94457199ab49ff11cbbb793cd6cd459c732265d342f1c04721f164383e73'
)

prepare() {
  cd "${srcdir}"/$_pkgbase-$pkgver

  echo "Fixing mandir..."
  sed -i "s|^mandir=.*|mandir='\${prefix}/share/man'|" configure

  echo "Fixing gdal-perl bindings..."
  patch -Np0 -i "${srcdir}"/gdal-perl-vendor.patch

  echo "Applying poppler 22.03.0..."
  patch -Np1 -i "${srcdir}"/poppler-22.03.0.patch
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
  #install -Dm755 -t "${pkgdir}"/usr/bin scripts/*.py

  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$pkgname
}
