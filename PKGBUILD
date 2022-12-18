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
pkgver=3.6.0
pkgrel=4
pkgdesc="A translator library for raster and vector geospatial data formats"
arch=(x86_64)
url="https://gdal.org/"
license=(custom)
makedepends=(cmake opencl-headers python-setuptools python-numpy
             proj arrow blosc cfitsio curl crypto++ libdeflate expat libfreexl
             libgeotiff geos giflib libheif hdf5 libjpeg-turbo json-c xz
             libxml2 lz4 mariadb-libs netcdf unixodbc ocl-icd openexr openjpeg2
             openssl pcre2 libpng podofo poppler postgresql-libs qhull
             libspatialite sqlite swig libtiff libwebp xerces-c zlib zstd hdf4)
# armadillo brunsli lerc libkml rasterlite2 sfcgal tiledb
# ogdi
changelog=$pkgbase.changelog
source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz)
b2sums=('f57b57bb460bf4cb3d601f981e3315b164bcf2f6da1f1b7e72f9ce771e58e4c88619833ca366b6a7c70ed1032bcf3c959f81d60254e136b40fb715937a7e5a59')

build() {
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
    -DGDAL_USE_ZSTD=ON
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
