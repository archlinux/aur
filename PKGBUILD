# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=OpenOrienteering
_pkgname=mapper
pkgname=${_orgname,,}-${_pkgname}
pkgver=0.8.3
pkgrel=3
pkgdesc='Map drawing program from OpenOrienteering'
arch=('i686' 'x86_64')
url='https://www.openorienteering.org/apps/mapper/'
license=('GPL3')
depends=('qt5-base>=5.3' 'polyclipping>=6.1.3a' 'proj>=4.9.2' 'gdal')
makedepends=('cmake>=3.1' 'qt5-tools>=5.3' 'doxygen' 'libcups')
optdepends=('qt5-imageformats: Support for TIFF etc.')
provides=("${pkgname}=${pkgver}")
conflicts=(${pkgname}-git)
install=${pkgname}.install
source=("https://github.com/${_orgname}/${_pkgname}/archive/v${pkgver}.tar.gz"
        'qt512.diff')
sha256sums=('ff4aefd11318857b65254ac360d1100a75792210600d44333cbd23d3eec6d5d4'
            '7a8242a2e8d2da72bbb5603375efc22394ce24f3933770e825a1eecb338e6161')

prepare() {
  cd ${_pkgname}-${pkgver}

  # Fix build with Qt 5.12
  # https://github.com/OpenOrienteering/mapper/commit/9665e2315bf7cfc7cf5dbc7cf7caf3d13743656d
  patch -Np1 < ../qt512.diff
}

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
  make
}

package() {
  cd ${_pkgname}-${pkgver}/build

  make DESTDIR=${pkgdir}/ install
}
