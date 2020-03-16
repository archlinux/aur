# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=OpenOrienteering
_pkgname=mapper
pkgname=${_orgname,,}-${_pkgname}
pkgver=0.9.2
pkgrel=1
pkgdesc='Map drawing program from OpenOrienteering'
arch=(x86_64)
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL3')
depends=('qt5-base>=5.5' 'polyclipping>=6.1.3a' 'proj>=4.9' 'gdal>=2')
makedepends=('cmake>=3.1' 'qt5-tools>=5.5' 'doxygen' 'libcups')
checkdepends=('qt5-imageformats')
optdepends=('qt5-imageformats: Support for TIFF etc.'
            'qt5-translations: for Qt5 dialog translations')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('1a797c3db4ee795585cd324b50b0a37fc9e545233f02cc28660e6f9790e49a51')

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
