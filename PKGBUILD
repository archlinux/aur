# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=OpenOrienteering
_pkgname=mapper
pkgname=${_orgname,,}-${_pkgname}
pkgver=0.9.3
pkgrel=1
pkgdesc='Map drawing program from OpenOrienteering'
arch=(x86_64)
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL3')
depends=('qt5-base>=5.5' 'polyclipping>=6.1.3a' 'proj>=4.9' 'gdal>=2')
makedepends=('cmake>=3.7' 'qt5-tools>=5.5' 'doxygen' 'libcups')
checkdepends=('qt5-imageformats')
optdepends=('qt5-imageformats: Support for TIFF etc.'
            'qt5-translations: for Qt5 dialog translations')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('d4c71df4970bc161e47a753b83c36c53c7b316aa318b778eac493fb2ce11a9c1')

build() {
  cd ${_pkgname}-${pkgver}

  rm -rf build
  mkdir -p build
  cd build

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
