# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=insight-toolkit4
pkgver=4.13.2
pkgrel=1
pkgdesc='Cross-platform system that provides developers with an extensive suite of software tools for image analysis'
arch=('i686' 'x86_64')
url='http://www.itk.org/'
license=('APACHE')
depends=('fftw' 'libjpeg-turbo' 'libpng' 'zlib' 'libtiff' 'gdcm' 'expat' 'hdf5-cpp-fortran' 'gtest')
makedepends=('cmake')
source=("http://downloads.sourceforge.net/project/itk/itk/${pkgver:0:4}/InsightToolkit-${pkgver}.tar.xz")
sha256sums=('dabe05234d24635c96fd9b1a5f5e3afc34e11f49a31e5107db19bf61da758fa5')

build() {
  cd "$srcdir"
  rm -rf build
  mkdir build
  cd build

  # Do not fail on more recent versions of gcc
  sed -i 's,#  error "Dunno about this gcc",#   define VCL_GCC_80,' \
    "${srcdir}/InsightToolkit-${pkgver}/Modules/ThirdParty/VNL/src/vxl/vcl/vcl_compiler.h"

  cmake \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH="/opt/${pkgname}" \
    -DModule_ITKReview:BOOL=ON \
    -DITK_USE_SYSTEM_JPEG:BOOL=ON \
    -DITK_USE_SYSTEM_PNG:BOOL=ON \
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON \
    -DITK_USE_SYSTEM_TIFF:BOOL=ON \
    -DITK_USE_SYSTEM_GDCM:BOOL=ON \
    -DITK_LEGACY_SILENT:BOOL=ON \
    -DCMAKE_CXX_FLAGS:STRING="-std=c++11" \
    -DITK_USE_SYSTEM_LIBRARIES:BOOL=ON \
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON \
    -DITK_USE_SYSTEM_FFTW:BOOL=ON \
    -DITK_USE_SYSTEM_HDF5:BOOL=ON \
    -DModule_ITKIOMINC:BOOL=ON \
    -DModule_ITKIOTransformMINC:BOOL=ON \
    ../InsightToolkit-${pkgver}

  make
}

package() {
  cd "$srcdir"/build

  make DESTDIR="${pkgdir}" install

  mkdir -p "$pkgdir/etc/ld.so.conf.d/"
  printf "%s\n" "/opt/${pkgname}/lib" > "$pkgdir/etc/ld.so.conf.d/$pkgname.conf"
}
