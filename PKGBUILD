# Maintainer: Andrew Sun <adsun701@gmail.com>
pkgname=ctl
pkgver=1.5.2
pkgrel=1
pkgdesc="The Color Transformation Language"
arch=('x86_64')
url="https://github.com/ampas/CTL"
license=('custom')
depends=('gcc-libs' 'ilmbase' 'openexr' 'libtiff' 'aces-container')
makedepends=('cmake')
source=("https://github.com/ampas/CTL/archive/${pkgname}-${pkgver}.tar.gz")
sha256sums=('d7fac1439332c4d84abc3c285b365630acf20ea041033b154aa302befd25e0bd')

prepare() {
	cd "${srcdir}/CTL-${pkgname}-${pkgver}"
  mkdir "${srcdir}/build"
}

build() {
  cd "${srcdir}/build"
  cmake "../CTL-${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  
  # License file
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 "${srcdir}/CTL-${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}"
  
  # Move documentation
  mv "${pkgdir}/usr/doc" "${pkgdir}/usr/share"
  
  # Correct to lowercase for the lib/cmake/CTL
  mv "${pkgdir}/usr/lib/CMake" "${pkgdir}/usr/lib/cmake"
  
  # Remove srcdir reference
  cd "${srcdir}/build/lib"
  _libprefix=${PWD}
  cd "${pkgdir}/usr/lib/cmake/CTL"
  sed -i "s|${_libprefix}/\bIlmCtl\b|/usr|g" CTLLibraryDepends.cmake
  sed -i "s|${_libprefix}/\bIlmCtlMath\b|/usr|g" CTLLibraryDepends.cmake
  sed -i "s|${_libprefix}/\bIlmCtlSimd\b|/usr|g" CTLLibraryDepends.cmake
}
