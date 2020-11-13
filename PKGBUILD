# Maintainer: spider-mario <spidermario@free.fr>
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: Lukas Jirkovsky <l.jirkovsky@gmail.com>
# Contributor: Dmitry N. Shilov <stormblast@land.ru>

pkgname=luminancehdr-git
pkgver=2.5.1.r245.g7dc448a6
pkgrel=1
pkgdesc='Open source graphical user interface application that aims to provide a workflow for HDR imaging'
arch=('x86_64')
url='http://qtpfsgui.sourceforge.net/'
license=('GPL')
depends=('exiv2' 'fftw' 'gsl' 'lcms2' 'libraw' 'openexr' 'qt5-webengine' 'qt5-svg'
         'qt5-webkit' 'ccfits' 'desktop-file-utils' 'hicolor-icon-theme' 'boost-libs')
makedepends=('git' 'cmake' 'boost' 'eigen' 'gtest' 'qt5-tools' 'patch')
optdepends=('hugin: align image stack functionality')
provides=('luminancehdr')
conflicts=('luminancehdr')
options=('!emptydirs')
source=('git+https://github.com/LuminanceHDR/LuminanceHDR.git'
        'cmake-build-type.patch')
b2sums=('SKIP'
        'd4b4002428819601978c3ed9e765594a4cf0e08d7ddb1d3b4193bc7af72dceb5fb6a2af2bd19a2bd94ce6d44cdc37a0b31397fb36d679d85283ba616a8ffb799')

pkgver() {
  cd "${srcdir}"/LuminanceHDR
  git describe --long | sed 's/^v\.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}"/LuminanceHDR
  git apply -3 ../cmake-build-type.patch
}

build() {
  mkdir -p build
  cd build

  CFLAGS+=" -DNDEBUG"
  CXXFLAGS+=" -DNDEBUG"
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None \
     "${srcdir}"/LuminanceHDR
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install
}
