# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openorienteering
_pkgname=mapper
pkgname=${_orgname}-${_pkgname}-git
pkgver=0.7.93.r4292.55145fc4
pkgrel=1
pkgdesc="Map drawing program from OpenOrienteering"
arch=('i686' 'x86_64')
url="http://www.openorienteering.org/apps/mapper/"
license=('GPL3')
depends=('qt5-base>=5.3' 'polyclipping>=6.1.3a' 'proj>=4.9.2' 'gdal')
makedepends=('cmake>=3.1' 'qt5-tools>=5.3' 'doxygen' 'libcups')
optdepends=('qt5-imageformats: Support for TIFF etc.')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
install=${pkgname//-git}.install
source=("${_pkgname}-master::git://github.com/${_orgname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}-master

  RELEASE="$(git describe --tags $(git rev-list --tags --max-count=1) | tr '-' '.')"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s.r%s" "${RELEASE#?}" "${REVISION}"
}

prepare() {
  cd ${_pkgname}-master/translations
  weblate_url="https://hosted.weblate.org/download/${_orgname}"
  for lang in `ls OpenOrienteering_*.ts | sed 's/OpenOrienteering_\(.*\)\.ts/\1/;/template/d;s/zh_CN/zh_Hans/'`; do
    curl -so OpenOrienteering_$lang.ts $weblate_url/${_pkgname}/$lang/
  done
  rename Hans.ts CN.ts OpenOrienteering_zh_Hans.ts
  for lang in `ls map_symbols_*.ts | sed 's/map_symbols_\(.*\)\.ts/\1/;/template/d'`; do
    curl -so map_symbols_$lang.ts $weblate_url/map-symbols/$lang/
  done
  for lang in `ls qt_*.ts | sed 's/qt_\(.*\)\.ts/\1/;/template/d'`; do
    curl -so qt_$lang.ts $weblate_url/qt/$lang/
  done
}

build() {
  cd ${_pkgname}-master

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
  cd ${_pkgname}-master/build

  make DESTDIR=${pkgdir}/ install
}
