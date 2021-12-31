# Maintainer of this PKGBUILD file: Martino Pilia <martino.pilia@gmail.com>
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=insight-toolkit4
pkgver=4.13.3
pkgrel=3
pkgdesc='Cross-platform system that provides developers with an extensive suite of software tools for image analysis (legacy version 4, installed under /opt)'
arch=('x86_64')
url='http://www.itk.org/'
license=('APACHE')
depends=('fftw' 'libjpeg-turbo' 'libpng' 'zlib' 'libtiff' 'gdcm' 'expat' 'hdf5' 'gtest')
makedepends=('cmake')
source=("https://github.com/InsightSoftwareConsortium/ITK/releases/download/v${pkgver}/InsightToolkit-${pkgver}.tar.gz")
sha256sums=('b8ea18a5c97c62972c00c4679ff5a224eb393a766c334bd20884b379ca2b34ce')

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
