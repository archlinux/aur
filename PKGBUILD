# Maintainer: Samuel Fernando Mesa Giraldo <samuelmesa dot linuxmail.org>
# Initial Maintainer: gaelic

pkgname=liblas-git
_pkgname=liblas
pkgver=1.8.1.r59.ga847cf2b
pkgrel=1
pkgdesc="A C/C++ library for reading and writing the very common LAS LiDAR format. Development master"
url="http://www.liblas.org/"
license=("custom")
arch=("i686" "x86_64")
depends=('boost-libs>=1.38.0' 'gdal>=1.7.0' 'libgeotiff>=1.3.0' 'laszip')
makedepends=('git' 'cmake' 'txt2tags')
optdepends=('oci: Oracle Instant Client, see http://www.liblas.org/compilation.html')
source=("${_pkgname}::git://github.com/libLAS/libLAS.git")
md5sums=('SKIP')
provides=('liblas')
conflicts=('liblas')

pkgver(){
  cd "$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # A workaround for https://github.com/libLAS/libLAS/issues/103. The complete fix
  # is in https://github.com/libLAS/libLAS/commit/4e1d693e22f0dda43b73dbfb11b3be4ce30a44da.
  cd $srcdir/$_pkgname 
  sed -i 's/target_link_libraries(\${LAS2COL} \${LIBLAS_C_LIB_NAME})$/target_link_libraries(\${LAS2COL} \${LIBLAS_C_LIB_NAME} "\${CMAKE_THREAD_LIBS_INIT}")/' ./apps/CMakeLists.txt
}

build() {
  cd $srcdir/$_pkgname 
  [[ -d build ]] || mkdir build

  cd build  
  
  cmake -G "Unix Makefiles" ../ \
  -DCMAKE_INSTALL_PREFIX:PATH=/usr \
  -DWITH_PKGCONFIG:BOOL=FALSE \
  -DWITH_GEOTIFF:BOOL=TRUE \
  -DWITH_GDAL:BOOL=TRUE \
  -DWITH_LASZIP:BOOL=TRUE \
  -DWITH_STATIC_LASZIP=TRUE \
  -DWITH_UTILITIES:BOOL=TRUE \

  make
}

package() {
  cd $srcdir/$_pkgname/build   
  
  make DESTDIR="$pkgdir" install
}
