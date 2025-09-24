# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=itk-lite-git
pkgver=6.0a03.r508.g7ca2f0e73e
pkgrel=1
pkgdesc="Cross-platform system that provides developers with an extensive suite of software tools for image analysis"
arch=(x86_64)
url="https://itk.org/"
license=(Apache-2.0)
depends=(glibc gcc-libs libjpeg-turbo libpng zlib libtiff gdcm expat hdf5)
makedepends=(cmake git eigen3 gtest)
provides=(itk insight-toolkit insight-toolkit-git)
conflicts=(itk insight-toolkit)
source=("git+https://github.com/InsightSoftwareConsortium/ITK.git")
sha512sums=('SKIP')

pkgver() {
  cd ITK
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local _flags=(
    -DBUILD_TESTING:BOOL=OFF
    -DBUILD_EXAMPLES:BOOL=OFF
    -DBUILD_SHARED_LIBS:BOOL=ON
    -DModule_ITKReview:BOOL=ON
    -DITK_USE_SYSTEM_JPEG:BOOL=ON
    -DITK_USE_SYSTEM_PNG:BOOL=ON
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON
    -DITK_USE_SYSTEM_TIFF:BOOL=ON
    -DITK_USE_SYSTEM_GDCM:BOOL=ON
    -DITK_LEGACY_SILENT:BOOL=ON
    -DCMAKE_CXX_FLAGS:STRING="-std=c++98"
    -DITK_USE_SYSTEM_LIBRARIES:BOOL=ON
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON
    -DITK_USE_SYSTEM_FFTW:BOOL=ON
    -DITK_USE_SYSTEM_HDF5:BOOL=ON
    -DITK_USE_SYSTEM_GOOGLETEST=OFF
    -DModule_ITKIOMINC:BOOL=ON
    -DModule_ITKIOTransformMINC:BOOL=ON
    -DModule_SimpleITKFilters:BOOL=ON
  )

  cmake -B build -S "ITK" -Wno-dev \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
