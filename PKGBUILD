# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=insight-toolkit
pkgver=5.3.0
pkgrel=2
pkgdesc="Cross-platform system that provides developers with an extensive suite of software tools for image analysis"
arch=(x86_64)
url="https://itk.org/"
license=(Apache)
depends=(glibc gcc-libs libjpeg-turbo libpng zlib libtiff gdcm expat hdf5)
makedepends=(cmake git eigen gtest)
options=(!lto)
source=("https://github.com/InsightSoftwareConsortium/ITK/releases/download/v${pkgver}/InsightToolkit-${pkgver}.tar.gz"
        "InsightToolkit-gcc13-fix.patch::https://github.com/InsightSoftwareConsortium/ITK/pull/4066/commits/93bd9fe07e250bdac948ae6f2c2cc749f165f0e9.patch")
sha512sums=('29359839c0fb13acd430410e6adadbecb4d9d8cb4871a0aba0ac67b539c235354a591655dd654f43daa5f035a33721671d665eee8a4a129a9d0d3419e2356e97'
            '1435e87705a4bd53ae70c221b2541a8912b08f21e62de87c25520d3cc7e9784ae8deb8bcbd37ccd28b17e57d0069919ad103e93030b99417131e708abc9a0a38')

prepare() {
  cd "InsightToolkit-${pkgver}"
  patch -Np1 -i ../InsightToolkit-gcc13-fix.patch
}

build() {
  cmake -B build -S "InsightToolkit-$pkgver" -Wno-dev \
    -DCMAKE_BUILD_TYPE:STRING=Release \
    -DBUILD_TESTING:BOOL=OFF \
    -DBUILD_EXAMPLES:BOOL=OFF \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DCMAKE_INSTALL_PREFIX:FILEPATH=/usr \
    -DModule_ITKReview:BOOL=ON \
    -DITK_USE_SYSTEM_JPEG:BOOL=ON \
    -DITK_USE_SYSTEM_PNG:BOOL=ON \
    -DITK_USE_SYSTEM_ZLIB:BOOL=ON \
    -DITK_USE_SYSTEM_TIFF:BOOL=ON \
    -DITK_USE_SYSTEM_GDCM:BOOL=ON \
    -DITK_LEGACY_SILENT:BOOL=ON \
    -DCMAKE_CXX_FLAGS:STRING="-std=c++98" \
    -DITK_USE_SYSTEM_LIBRARIES:BOOL=ON \
    -DITK_USE_SYSTEM_EXPAT:BOOL=ON \
    -DITK_USE_SYSTEM_FFTW:BOOL=ON \
    -DITK_USE_SYSTEM_HDF5:BOOL=ON \
    -DModule_ITKIOMINC:BOOL=ON \
    -DModule_ITKIOTransformMINC:BOOL=ON \
    -DModule_SimpleITKFilters:BOOL=ON

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
