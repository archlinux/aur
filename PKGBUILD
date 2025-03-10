# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Chris <christopher.r.mullins g-mail>
# Contributor: geosam <samuelmesa@linuxmail.org>
# Contributor: Andrzej Giniewicz <gginiu@gmail.com>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: joel schaerer <joel.schaerer@laposte.net>

pkgname=itk-lite
pkgver=5.4.2
pkgrel=2
pkgdesc="Cross-platform system that provides developers with an extensive suite of software tools for image analysis"
arch=(x86_64)
url="https://itk.org/"
license=(Apache-2.0)
depends=(glibc gcc-libs libjpeg-turbo libpng zlib libtiff gdcm expat hdf5)
makedepends=(cmake git eigen gtest)
#options=(!lto)
provides=(itk insight-toolkit)
conflicts=(itk insight-toolkit)
source=("https://github.com/InsightSoftwareConsortium/ITK/releases/download/v${pkgver}/InsightToolkit-${pkgver}.tar.gz"
        #"${pkgname}-${pkgver}.tar.gz::https://github.com/InsightSoftwareConsortium/ITK/archive/refs/tags/v${pkgver}.tar.gz"
        )
sha512sums=('440d5962336ae7ba68e1efcabd78db8f10437db27da077a65731024d2fd94c588468678d0af8d8be1bfdb45dc90a88ace85ae9e1fabf77fb4172f3cb7cc27a3c')

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

  cmake -B build -S "InsightToolkit-${pkgver}" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
