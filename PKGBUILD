# Maintainer: Merlin Glander <merlin@merlin-glander.de>

_orgname=OpenOrienteering
_pkgname=mapper
pkgname=${_orgname,,}-${_pkgname}

pkgver=0.9.6
pkgrel=1
pkgdesc='Map drawing program from OpenOrienteering'
arch=(x86_64)
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL-3.0-only')

depends=(
  'qt5-base'
  'qt5-serialport'
  'qt5-location'
  'qt5-sensors'
  'polyclipping'
  'proj'
  'gdal'
  'hicolor-icon-theme'
)

makedepends=(
  'cmake'
  'qt5-tools'
  'doxygen'
  'libcups'
)

checkdepends=('qt5-imageformats')

optdepends=(
  'qt5-imageformats: Support for TIFF etc.'
  'qt5-translations: for Qt5 dialog translations'
)

provides=("${pkgname}=${pkgver}")
conflicts=("${pkgname}-git")

source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
)

sha256sums=('8fd306029b89c3dddfe816723e346bb61069354e506657ce66f5fcfc87a6daff')

build() {
  cd "${_pkgname}-${pkgver}"

  sed -e 's/LICENSE/LICENSE.TXT/' -i doc/licensing/arch-licensing.cmake

  rm -rf build
  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLICENSING_PROVIDER=arch \
    -DMapper_PACKAGE_NAME="${pkgname}" \
    -Wno-dev

  cmake --build build
}

check() {
  cd "${_pkgname}-${pkgver}"
  cmake --build build --target test
}

package() {
  cd "${_pkgname}-${pkgver}"
  DESTDIR="${pkgdir}" cmake --build build --target install
}
