# Maintainer: Bink
pkgname=ktx-software
pkgver=4.4.2
pkgrel=1
pkgdesc="KTX (Khronos Texture) Library and Tools"
arch=("x86_64")
url="https://github.com/KhronosGroup/KTX-Software"
license=("Apache-2.0")
depends=("zlib" "libpng" "libjpeg-turbo" "openexr")
makedepends=("cmake" "zstd")
provides=("ktx-software")
conflicts=("ktx-software" "ktx_software")
source=("https://github.com/KhronosGroup/KTX-Software/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('9412cb45045a503005acd47d98f9e8b47154634a50b4df21e17a1dfa8971d323')

build() {
  cd "${srcdir}/KTX-Software-${pkgver}" || exit
  mkdir -p build
  cd build || exit

  # By default, uses system compiler.
  # Note: When built with GCC, zlib compression output may differ between x86_64 and arm64.
  # See https://github.com/KhronosGroup/KTX-Software/releases/tag/v4.4.0 for details.


  cmake .. -DCMAKE_BUILD_TYPE=Release \
           -DBUILD_SHARED_LIBS=ON \
           -DCMAKE_INSTALL_PREFIX=/usr \
           -DCMAKE_CXX_FLAGS="-msse4.1" \
           -DKTX_GIT_VERSION_FULL="v${pkgver}"
  cmake --build . --config Release
}

package() {
  cd "${srcdir}/KTX-Software-${pkgver}/build" || exit
  DESTDIR="${pkgdir}" cmake --install .
}
