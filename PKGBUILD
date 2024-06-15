# Maintainer: Sylvain POULAIN <sylvain dot poulain at giscan dot com>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Luigi Ranghetti <ggranga@gmail.com>
# Contributor: Oliver Kuster <olivervbk (at) gmail>
#
# Original can be found at:
# https://github.com/archlinux/svntogit-community/blob/packages/gdal/trunk/PKGBUILD

pkgbase=gdal-ecw
_pkgbase=gdal
provides=('gdal=3.8.5')
conflicts=('gdal')
pkgname=('gdal-ecw' 'python-gdal-ecw')
pkgver=3.8.5
pkgrel=2
pkgdesc="A translator library for raster and vector geospatial data formats, with support to ECW format. Based on gdal-hdf4 AUR package."
arch=(x86_64)
url="https://gdal.org/"
license=(custom)
depends=('curl' 'geos' 'giflib' 'hdf5' 'libgeotiff' 'libjpeg-turbo' 'libpng' 'libspatialite' 'libtiff' 'netcdf'
         'openjpeg2' 'poppler' 'cfitsio' 'sqlite' 'mariadb-libs' 'postgresql-libs' 'xerces-c' 'json-c' 'arrow' 'pcre2'
         # needed for ecw support:
         'libecwj2')

makedepends=(cmake opencl-headers python-setuptools python-numpy
             proj arrow blosc cfitsio curl crypto++ libdeflate expat libfreexl
             libgeotiff geos giflib libheif hdf5 libjpeg-turbo json-c libjxl xz
             libxml2 lz4 mariadb-libs netcdf unixodbc ocl-icd openexr openjpeg2
             openssl pcre2 libpng podofo poppler postgresql-libs qhull
             libspatialite sqlite swig libtiff libwebp xerces-c zlib zstd libaec)
# armadillo basisu brunsli lerc libkml qb3 rasterlite2 sfcgal tiledb
# ogdi
changelog=$_pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        https://github.com/OSGeo/gdal/commit/7b526b12.patch)
b2sums=('2c5f9b3fa1c3d5d7879c2aa1c95f82c6360b35a259443a8ad68ff8f471f4efa8d2fd7935c57317ee5e94789244067706967f9c5df413bccd2556b5790d51d349'
        '801eb649c20ef81d7590888589d4049eab4505fac6efbe1718d8bc9e01a35390b9d8cad090c3421ff90d769fe3f5aec4d1641409ecc5a434ba68c4c5d30eec85')

prepare() {
  patch -d $_pkgbase-$pkgver -p1 < 7b526b12.patch # Fix build with C++20
}

build() {
  opt_libs=""
  [[ "$(ldconfig -p | grep libkml.so)" ]] && { echo "Found libkml.so"; opt_libs+=" -DGDAL_USE_LIBKML=ON"; }

  cmake -B build -S $_pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=20 \
    -DENABLE_IPO=ON \
    -DBUILD_PYTHON_BINDINGS=ON \
    -DGDAL_ENABLE_PLUGINS=ON \
    -DGDAL_USE_ARROW=ON \
    -DGDAL_USE_BLOSC=ON \
    -DGDAL_USE_CFITSIO=ON \
    -DGDAL_USE_CURL=ON \
    -DGDAL_USE_CRYPTOPP=ON \
    -DGDAL_USE_DEFLATE=ON \
    -DGDAL_USE_EXPAT=ON \
    -DGDAL_USE_FREEXL=ON \
    -DGDAL_USE_GEOTIFF=ON \
    -DGDAL_USE_GEOS=ON \
    -DGDAL_USE_GIF=ON \
    -DGDAL_USE_HEIF=ON \
    -DGDAL_USE_HDF5=ON \
    -DGDAL_USE_ICONV=ON \
    -DGDAL_USE_JPEG=ON \
    -DGDAL_USE_JSONC=ON \
    -DGDAL_USE_JXL=ON \
    -DGDAL_USE_LIBLZMA=ON \
    -DGDAL_USE_LIBXML2=ON \
    -DGDAL_USE_LZ4=ON \
    -DGDAL_USE_MYSQL=ON \
    -DGDAL_USE_NETCDF=ON \
    -DGDAL_USE_ODBC=ON \
    -DGDAL_USE_OPENCL=ON \
    -DGDAL_USE_OPENEXR=ON \
    -DGDAL_USE_OPENJPEG=ON \
    -DGDAL_USE_OPENSSL=ON \
    -DGDAL_USE_PARQUET=ON \
    -DGDAL_USE_PCRE2=ON \
    -DGDAL_USE_PNG=ON \
    -DGDAL_USE_POPPLER=ON \
    -DGDAL_USE_POSTGRESQL=ON \
    -DGDAL_USE_QHULL=ON \
    -DGDAL_USE_SPATIALITE=ON \
    -DGDAL_USE_SQLITE3=ON \
    -DGDAL_USE_TIFF_INTERNAL=ON \
    -DGDAL_USE_GEOTIFF_INTERNAL=ON \
    -DGDAL_USE_TIFF=ON \
    -DGDAL_USE_WEBP=ON \
    -DGDAL_USE_XERCESC=ON \
    -DGDAL_USE_ZLIB=ON \
    -DGDAL_USE_ZSTD=ON
    $opt_libs
  make -C build
}

package_gdal-ecw () {
  depends=(proj blosc crypto++ curl libdeflate expat libfreexl geos libgeotiff
           giflib libjpeg-turbo json-c xz libxml2 lz4 unixodbc ocl-icd openssl
           pcre2 libpng qhull libspatialite sqlite libtiff xerces-c zlib zstd libaec
           arrow cfitsio hdf5 libheif mariadb-libs netcdf openexr openjpeg2
           podofo poppler postgresql-libs libwebp libecwj2)
  optdepends=('arrow: Arrow/Parquet support'
              'cfitsio: FITS support'
              'hdf5: HDF5 support'
              'libheif: HEIF support'
              'libjxl: JPEG XL support'
              'mariadb-libs: MySQL support'
              'netcdf: netCDF support'
              'openexr: EXR support'
              'openjpeg2: JP2 support'
              'podofo: PDF support'
              'poppler: PDF support'
              'postgresql-libs: PostgreSQL support'
              'perl: perl binding support'
              'unixodbc: when present while building, will add odbc support'
              'libkml: when present while building, adds kml support'
              'libwebp: WebP support')

  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkgbase}-${pkgver}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/$_pkgbase/
  # Move python stuff
  mkdir -p {bin,lib}
  mv "${pkgdir}"/usr/bin/*py bin
  mv "${pkgdir}"/usr/lib/python* lib
}

package_python-gdal-ecw () {
  pkgdesc="Python bindings for GDAL, with support to ECW format"
  provides=("python-gdal")
  conflicts=("python-gdal")
  depends=("gdal-ecw=$pkgver" 'python-numpy')

  install -d "${pkgdir}"/usr/{bin,lib}
  mv bin/* "${pkgdir}"/usr/bin
  mv lib/* "${pkgdir}"/usr/lib
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $_pkgbase "${pkgdir}"/usr/share/licenses/$pkgname
  # byte-compile python modules since the CMake build does not do it.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m compileall -o 0 -o 1 -o 2 --hardlink-dupes -s "${pkgdir}" "${pkgdir}"${site_packages}
}
