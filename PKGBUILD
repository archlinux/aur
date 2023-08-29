# Maintainer: Alireza S.N. <alireza6677@gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=gdal-libkml-filegdb
pkgname=(gdal-libkml-filegdb python-gdal-libkml-filegdb)
pkgver=3.7.1
pkgrel=0
provides=('gdal')
pkgdesc="A translator library for raster and vector geospatial data formats (with libkml and filegdb support)"
arch=(x86_64)
url="https://gdal.org/"
license=(custom)
makedepends=(cmake opencl-headers python-setuptools python-numpy
             proj arrow blosc cfitsio curl crypto++ libdeflate expat libfreexl
             libgeotiff geos giflib libheif hdf5 libjpeg-turbo json-c libjxl xz
             libxml2 lz4 mariadb-libs netcdf unixodbc ocl-icd openexr openjpeg2
             openssl pcre2 libpng podofo-0.9 poppler postgresql-libs qhull
             libspatialite sqlite swig libtiff libwebp xerces-c zlib zstd libkml-git)
# armadillo brunsli lerc libkml rasterlite2 sfcgal tiledb
# ogdi
changelog=gdal.changelog
source=(https://download.osgeo.org/gdal/${pkgver}/gdal-${pkgver}.tar.xz
        https://raw.githubusercontent.com/Esri/file-geodatabase-api/master/FileGDB_API_1.5.1/FileGDB_API_1_5_1-64gcc51.tar.gz) 
sha256sums=('9297948f0a8ba9e6369cd50e87c7e2442eda95336b94d2b92ef1829d260b9a06'
  '1a1b5c417224e8a4dfd3f7c1f4d1911febf1de38e9b6f93a1e4523a9fce92a91')

prepare() {
  # Fix build with podofo-0.9
  sed -e 's|podofo.h|podofo/podofo.h|' -i gdal-$pkgver/frmts/pdf/pdfsdk_headers.h
}

build() {
  tar xzvf FileGDB_API_1_5_1-64gcc51.tar.gz
  cp FileGDB_API-64gcc51/lib/libFileGDBAPI.so libFileGDBAPI_gdal.so
  cp FileGDB_API-64gcc51/lib/libfgdbunixrtl.so libfgdbunixrtl_gdal.so
  cmake -B build -S gdal-$pkgver \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CXX_STANDARD=17 \
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
    -DGDAL_USE_TIFF=ON \
    -DGDAL_USE_WEBP=ON \
    -DGDAL_USE_XERCESC=ON \
    -DGDAL_USE_ZLIB=ON \
    -DGDAL_USE_ZSTD=ON \
    -DGDAL_USE_LIBKML=ON \
    -DGDAL_USE_FileGDB=ON \
    -DPODOFO_INCLUDE_DIR=/usr/include/podofo-0.9 \
    -DPODOFO_LIBRARY=/usr/lib/podofo-0.9/libpodofo.so \
    -DFileGDB_INCLUDE_DIR=FileGDB_API-64gcc51/include \
    -DFileGDB_LIBRARY=libFileGDBAPI_gdal.so && \
  make -C build -j $(nproc)
}

package_gdal-libkml-filegdb () {
  provides+=('gdal-libkml-filegdb')
  conflicts=('gdal')
  depends=(proj blosc crypto++ curl libdeflate expat libfreexl geos libgeotiff
           giflib libjpeg-turbo json-c xz libxml2 lz4 unixodbc ocl-icd openssl
           pcre2 libpng qhull libspatialite sqlite libtiff xerces-c zlib zstd libkml-git)
  optdepends=('arrow: Arrow/Parquet support'
              'cfitsio: FITS support'
              'hdf5: HDF5 support'
              'libheif: HEIF support'
              'libjxl: JPEG XL support'
              'mariadb-libs: MySQL support'
              'netcdf: netCDF support'
              'openexr: EXR support'
              'openjpeg2: JP2 support'
              'podofo-0.9: PDF support'
              'poppler: PDF support'
              'postgresql-libs: PostgreSQL support'
              'libwebp: WebP support')

  make -C build DESTDIR="${pkgdir}" install
  patchelf --replace-needed libfgdbunixrtl.so libfgdbunixrtl_gdal.so libFileGDBAPI_gdal.so
  install -Dm755 libFileGDBAPI_gdal.so -t "${pkgdir}"/usr/lib/
  install -Dm755 libfgdbunixrtl_gdal.so -t "${pkgdir}"/usr/lib/

  patchelf --replace-needed "${srcdir}"/libFileGDBAPI_gdal.so libFileGDBAPI_gdal.so "${pkgdir}"/usr/lib/gdalplugins/ogr_FileGDB.so
  install -Dm644 gdal-${pkgver}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/gdal/
  # Move python stuff
  mkdir -p {bin,lib}
  mv "${pkgdir}"/usr/bin/*py bin
  mv "${pkgdir}"/usr/lib/python* lib
}

package_python-gdal-libkml-filegdb () {
  pkgdesc="Python bindings for GDAL"
  depends=("gdal-libkml-filegdb=$pkgver" 'python-numpy')
  provides=('python-gdal')
  conflicts=('python-gdal')

  install -d "${pkgdir}"/usr/{bin,lib}
  mv bin/* "${pkgdir}"/usr/bin
  mv lib/* "${pkgdir}"/usr/lib
  install -dm755 "${pkgdir}"/usr/share/licenses
  ln -s gdal "${pkgdir}"/usr/share/licenses/$pkgname
  # byte-compile python modules since the CMake build does not do it.
  local site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  python -m compileall -o 0 -o 1 -o 2 --hardlink-dupes -s "${pkgdir}" "${pkgdir}"${site_packages}
}
