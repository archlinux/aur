# Maintainer: Maciej Sieczka <msieczka at sieczka dot org>
# Contributor: Patryk Kowalczyk <patryk AT kowalczyk DOT WS>
# Contributor: Michael <mbostwick89@gmail.com>

pkgname='liblas'
pkgver='1.8.1'
pkgrel='1'
pkgdesc='A C/C++ library for reading and writing the very common LAS LiDAR format.'
arch=('i686' 'x86_64')
url='http://www.liblas.org/'
license=('custom')
source=("http://download.osgeo.org/liblas/libLAS-${pkgver}.tar.bz2")
depends=('boost-libs>=1.38.0' 'gdal>=1.7.0' 'libgeotiff>=1.3.0' 'laszip')
makedepends=('boost>=1.38.0' 'cmake')
optdepends=('oci: Oracle Instant Client, see http://www.liblas.org/compilation.html')
md5sums=('2e6a975dafdf57f59a385ccb87eb5919')

prepare() {
  # A workaround for https://github.com/libLAS/libLAS/issues/103. The complete fix
  # is in https://github.com/libLAS/libLAS/commit/4e1d693e22f0dda43b73dbfb11b3be4ce30a44da.
  cd "${srcdir}/libLAS-${pkgver}"
  sed -i 's/target_link_libraries(\${LAS2COL} \${LIBLAS_C_LIB_NAME})$/target_link_libraries(\${LAS2COL} \${LIBLAS_C_LIB_NAME} "\${CMAKE_THREAD_LIBS_INIT}")/' ./apps/CMakeLists.txt
}

build() {
  cd "${srcdir}/libLAS-${pkgver}"

  cmake -DWITH_GEOTIFF:BOOL=TRUE \
  -DWITH_GDAL:BOOL=TRUE \
  -DWITH_LASZIP:BOOL=TRUE \
  -DWITH_UTILITIES:BOOL=TRUE \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
  -G "Unix Makefiles" .

  make
}

package() {
  cd "${srcdir}/libLAS-${pkgver}"
  make DESTDIR="$pkgdir" install
}
