# Maintainer: Alireza S.N. <alireza6677@gmail.com>
# Maintainer: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Maintainer: Bruno Pagani <archange@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org
# Contributor: William Rea <sillywilly@gmail.com>

pkgbase=gdal-libkml
pkgname=(gdal-libkml python-gdal-libkml)
pkgver=3.8.4
pkgrel=1
provides=('gdal')
pkgdesc="A translator library for raster and vector geospatial data formats (with libkml support)"
arch=(x86_64)
url="https://gdal.org/"
license=(custom)
makedepends=(cmake opencl-headers python-setuptools python-numpy
             proj arrow blosc cfitsio curl crypto++ libdeflate expat libfreexl
             libgeotiff geos giflib libheif hdf5 libjpeg-turbo json-c libjxl xz
             libxml2 lz4 mariadb-libs netcdf unixodbc ocl-icd openexr openjpeg2
             openssl pcre2 libpng podofo poppler postgresql-libs qhull
             libspatialite sqlite swig libtiff libwebp xerces-c zlib zstd libaec libkml-git)
# armadillo brunsli lerc libkml qb3 rasterlite2 sfcgal tiledb
# ogdi
changelog=gdal.changelog
source=(https://download.osgeo.org/gdal/${pkgver}/gdal-${pkgver}.tar.xz)
b2sums=('53d553ac09bf6a007e38ad41d3033e6b4ab7992c9c2eb84ac4f56b7be14f68a2931bb7655807b10aff1836d47a98e04ec70bb9c6db19596c2b35aa260b3579dc')

build() {
  export PATH="$(pwd)/build/apps:$PATH"
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
    -DGDAL_USE_FILEGDB=OFF \
    -DOGR_ENABLE_DRIVER_FILEGDB=OFF
  make -C build -j $(nproc)
}

package_gdal-libkml () {
  provides+=('gdal-libkml')
  conflicts=('gdal')
  depends=(proj blosc crypto++ curl libdeflate expat libfreexl geos libgeotiff
           giflib libjpeg-turbo json-c xz libxml2 lz4 unixodbc ocl-icd openssl
           pcre2 libpng qhull libspatialite sqlite libtiff xerces-c zlib zstd libaec libkml-git)
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
              'libwebp: WebP support')

  make -C build DESTDIR="${pkgdir}" install
  install -Dm644 gdal-${pkgver}/LICENSE.TXT -t "${pkgdir}"/usr/share/licenses/gdal/
  # Move python stuff
  mkdir -p {bin,lib}
  mv "${pkgdir}"/usr/bin/*py bin
  mv "${pkgdir}"/usr/lib/python* lib
}

package_python-gdal-libkml () {
  pkgdesc="Python bindings for GDAL"
  depends=("gdal-libkml=$pkgver" 'python-numpy')
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
