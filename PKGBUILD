# Maintainer: Guillermo Duran <gds506 at gmail dot com>
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
pkgver=3.8.0
pkgrel=2
pkgdesc="A translator library for raster and vector geospatial data formats"
arch=(x86_64)
url="https://gdal.org/"
license=(custom)
_commit="d2c98838e03c0a9f857926621bc9874f3bb254a5"
makedepends=(cmake opencl-headers python-setuptools python-numpy
             proj arrow blosc cfitsio curl crypto++ libdeflate expat libfreexl
             libgeotiff geos giflib libheif hdf5 libjpeg-turbo json-c xz
             libxml2 lz4 mariadb-libs netcdf unixodbc ocl-icd openexr openjpeg2
             openssl pcre2 libpng podofo poppler postgresql-libs qhull
             libspatialite sqlite swig libtiff libwebp xerces-c zlib zstd hdf4
             libaec libkml-git
             ) 

optdepends=('postgresql: postgresql database support'
            'mariadb: mariadb database support'
            'perl: perl binding support'
            'unixodbc: when present while building, will add odbc support'
            'libkml: when present while building, adds kml support'
)
options=('!emptydirs')
changelog=$pkgbase.changelog

source=(https://download.osgeo.org/${_pkgbase}/${pkgver}/${_pkgbase}-${pkgver}.tar.xz
        https://github.com/OSGeo/gdal/commit/cbed9fc9.patch
        https://github.com/OSGeo/gdal/commit/ec33f6d6.patch)
b2sums=('646aa91283e7228a054221d120bddb456c8b898f9155edd289f2b2e0bf8706fa3045a98d26e4cf5ba5dba6d8c1c7f0a7f4aaaded9457481a65910c2d313c8f9d'
        'e75eb8edb5507450ded3bca618a03a283ba49791df416b0a7732f859d93124704e8508fcd11271bbbeef299d05d3ad2df9e03bd805580445407cb6b8c003a98e'
        '5c0abcfcfbb0ca2a96156abb4c7daaf4860fa30d553228172eb8def8b2f95e93bae9217974fba9621dcf9921e906a5ada9b710b1c0b29e7e580191a0a56a76e2')

# source=("git+https://github.com/OSGeo/gdal.git")
# sha256sums=('SKIP')
# source=(https://github.com/OSGeo/${_pkgbase}/releases/download/v${pkgver}/${_pkgbase}-${pkgver}.tar.gz)
# md5sums=('62191565949f1dd5985a04dcac831322') 

prepare() {
# Fix build with libxml2 2.12
  patch -d $_pkgbase-$pkgver -p1 < cbed9fc9.patch
  patch -d $_pkgbase-$pkgver -p1 < ec33f6d6.patch

# Fix build with podofo-0.9
  # sed -e 's|podofo.h|podofo/podofo.h|' -i $_pkgbase-$pkgver/frmts/pdf/pdfsdk_headers.h
}

build() {
  export PATH="$(pwd)/build/apps:$PATH"
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
    -DGDAL_USE_LIBKML=ON \
    -DGDAL_USE_FileGDB=ON \
    -DFileGDB_INCLUDE_DIR=/usr/include/filegdb-api/ \
    -DFileGDB_LIBRARY=/usr/lib/libFileGDBAPI.so && \
  make -C build -j $(nproc)
}

package_gdal-hdf4 () {
  provides+=('gdal-hdf4')
  conflicts=('gdal')
  depends=(proj blosc crypto++ curl libdeflate expat libfreexl geos libgeotiff
           giflib libjpeg-turbo json-c xz libxml2 lz4 unixodbc ocl-icd openssl
           pcre2 libpng qhull libspatialite sqlite libtiff xerces-c zlib zstd
           hdf4 
           libaec libkml-git filegdb-api)
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
  mkdir -p {bin,lib}
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
