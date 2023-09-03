# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=OpenOrienteering
_pkgname=mapper
pkgname=${_orgname,,}-${_pkgname}
pkgver=0.9.5
pkgrel=3
pkgdesc='Map drawing program from OpenOrienteering'
arch=(x86_64)
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL3')
depends=('qt5-base' 'polyclipping' 'proj' 'gdal' 'qt5-serialport')
makedepends=('cmake' 'qt5-tools' 'doxygen' 'libcups' 'qt5-sensors' 'qt5-location' 'qt5-serialport')
checkdepends=('qt5-imageformats')
optdepends=('qt5-imageformats: Support for TIFF etc.'
            'qt5-translations: for Qt5 dialog translations')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('619152ca01a370875c15e1930918ce961284ccbf5d2371c147d50caf5e5c2f00')

build() {
  cd ${_pkgname}-${pkgver}

  sed -e 's/LICENSE/LICENSE.TXT/' -i doc/licensing/arch-licensing.cmake

  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  cmake ..                      \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLICENSING_PROVIDER=arch   \
    -DMapper_PACKAGE_NAME=${pkgname} \
    -Wno-dev
  cmake --build .
}

check() {
  cd ${_pkgname}-${pkgver}/build

  cmake --build . --target test
}

package() {
  cd ${_pkgname}-${pkgver}/build

  DESTDIR=${pkgdir}/ cmake --build . --target install
}
