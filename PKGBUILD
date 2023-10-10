# Maintainer: Martin Morlot <martinmorlot at gmail dot com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: # Contributor: Luigi Ranghetti <ggranga@gmail.com>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>


pkgbase=gdal-hdf4
_pkgbase=gdal
provides=('gdal')
conflicts=('gdal')
pkgname=(gdal-hdf4 python-gdal-hdf4)
pkgver=3.7.2
pkgrel=4
pkgdesc="A translator library for raster and vector geospatial data formats"
arch=(x86_64)
url="https://gdal.org/"
license=(custom)
makedepends=(cmake opencl-headers python-setuptools python-numpy
             proj arrow blosc cfitsio curl crypto++ libdeflate expat libfreexl
             libgeotiff geos giflib libheif hdf5 libjpeg-turbo json-c xz
             libxml2 lz4 mariadb-libs netcdf unixodbc ocl-icd openexr openjpeg2
             openssl pcre2 libpng podofo-0.9 poppler postgresql-libs qhull
             libspatialite sqlite swig libtiff libwebp xerces-c zlib zstd hdf4)

optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl: perl binding support'
            'unixodbc: when present while building, will add odbc support'
            'libkml: when present while building, adds kml support'
)
options=('!emptydirs')
# armadillo brunsli lerc libkml rasterlite2 sfcgal tiledb
# ogdi
changelog=$pkgbase.changelog
source=(https://github.com/OSGeo/${_pkgbase}/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz)
md5sums=('d6ffb51d21a619d0f242957a6078ffb3')

prepare() {
# Fix build with podofo-0.9
  sed -e 's|podofo.h|podofo/podofo.h|' -i $_pkgbase-$pkgver/frmts/pdf/pdfsdk_headers.h
}

build() {
  opt_libs=""
  [[ "$(ldconfig -p | grep libkml.so)" ]] && { echo "Found libkml.so"; opt_libs+=" -DGDAL_USE_LIBKML=ON"; }

  cmake -B build -S $_pkgbase-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
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
    -DGDAL_USE_HDF4=ON \
    -DHDF4_INCLUDE_DIR=/opt/hdf4/include \
    -DHDF4_df_LIBRARY_RELEASE=/opt/hdf4/lib/libdf.so \
    -DHDF4_mfhdf_LIBRARY_RELEASE=/opt/hdf4/lib/libmfhdf.so \
    -DGDAL_USE_ICONV=ON \
    -DGDAL_USE_JPEG=ON \
    -DGDAL_USE_JSONC=ON \
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
    -DGDAL_USE_TIFF=ON \
    -DGDAL_USE_WEBP=ON \
    -DGDAL_USE_XERCESC=ON \
    -DGDAL_USE_ZLIB=ON \
    -DGDAL_USE_ZSTD=ON \
    -DPODOFO_INCLUDE_DIR=/usr/include/podofo-0.9 \
    -DPODOFO_LIBRARY=/usr/lib/podofo-0.9/libpodofo.so \
    $opt_libs
  make -C build
}

package_gdal-hdf4 () {
  depends=(proj blosc crypto++ curl libdeflate expat libfreexl geos libgeotiff
           giflib libjpeg-turbo json-c xz libxml2 lz4 unixodbc ocl-icd openssl
           pcre2 libpng qhull libspatialite sqlite libtiff xerces-c zlib zstd
           hdf4)
  optdepends=('arrow: Arrow/Parquet support'
             'cfitsio: FITS support'
             'hdf5: HDF5 support'
             'libheif: HEIF support'
             'mariadb-libs: MySQL support'
             'netcdf: netCDF support'
             'openexr: EXR support'
             'openjpeg2: JP2 support'
             'podofo: PDF support'
             'poppler: PDF support'
             'postgresql-libs: PostgreSQL support'
             'libwebp: WebP support')

  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 ${_pkgbase}-${pkgver}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/$_pkgbase/
  # Move python stuff
  mkdir {bin,lib}
  mv "${pkgdir}"/usr/bin/*py bin
  mv "${pkgdir}"/usr/lib/python* lib
}

package_python-gdal-hdf4 () {
  pkgdesc="Python bindings for GDAL"
  depends=("gdal-hdf4=$pkgver" 'python-numpy')
  provides=("python-gdal")
  conflicts=("python-gdal")
  
  install -d "${pkgdir}"/usr/{bin,lib}
  mv bin/* "${pkgdir}"/usr/bin
  mv lib/* "${pkgdir}"/usr/lib
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s $pkgbase "${pkgdir}"/usr/share/licenses/$pkgname
  # byte-compile python modules since the CMake build does not do it.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m compileall -o 0 -o 1 -o 2 --hardlink-dupes -s "${pkgdir}" "${pkgdir}"${site_packages}
}
