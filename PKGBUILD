# Maintainer: Andrew Sun <adsun701@gmail.com>

pkgname=ctl
pkgver=1.5.2
pkgrel=2
pkgdesc="The Color Transformation Language"
arch=('x86_64')
url="https://github.com/ampas/CTL"
license=('custom')
depends=('openexr' 'libtiff' 'aces-container')
makedepends=('cmake')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ampas/CTL/archive/${pkgname}-${pkgver}.tar.gz"
        "ctl-1.5.2-Use-GNUInstallDirs-and-fix-PkgConfig-files-1.patch"
        "ilmbase-2.3.0-compatibility.patch")
sha256sums=('d7fac1439332c4d84abc3c285b365630acf20ea041033b154aa302befd25e0bd'
            '7f3b713d8a9e61f72f5b063d9cdb8f365ed8c62e12953b2d85bd7e670e7cced3'
            '0f19668f16796044f65f2b0ddad4ed9b563eef62c6ec2d5a185168b847c364a3')

prepare() {
  cd "${srcdir}/CTL-${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/ctl-1.5.2-Use-GNUInstallDirs-and-fix-PkgConfig-files-1.patch"
  patch -Np1 -i "${srcdir}/ilmbase-2.3.0-compatibility.patch"
}

build() {
  mkdir -p "${srcdir}/build" && cd "${srcdir}/build"
  cmake "../CTL-${pkgname}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "${srcdir}/build"
  make DESTDIR="${pkgdir}" install
  
  # License file
  install -Dm644 "${srcdir}/CTL-${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  # Remove docs
  rm -rf "${pkgdir}/usr/doc"

  # Remove srcdir reference
  cd "${srcdir}/build/lib"
  _libprefix=${PWD}
  cd "${pkgdir}/usr/lib/cmake/CTL"
  sed -i "s|${_libprefix}/\bIlmCtl\b|/usr|g" CTLLibraryDepends.cmake
  sed -i "s|${_libprefix}/\bIlmCtlMath\b|/usr|g" CTLLibraryDepends.cmake
  sed -i "s|${_libprefix}/\bIlmCtlSimd\b|/usr|g" CTLLibraryDepends.cmake
}
