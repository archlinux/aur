# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openorienteering
_pkgname=mapper
pkgname=${_orgname}-${_pkgname}-git
pkgver=0.7.0.r3762.f22be1e2
pkgrel=1
pkgdesc="Orienteering mapmaking program"
arch=('i686' 'x86_64')
url="http://www.openorienteering.org/apps/mapper/"
license=('GPL3')
depends=('qt5-base>=5.3' 'polyclipping>=6.1.3a' 'proj>=4.9.2' 'gdal')
makedepends=('cmake>=3.1' 'qt5-tools>=5.3' 'doxygen' 'libcups')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
install=${pkgname//-git}.install
source=("${_pkgname}::git://github.com/${_orgname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  RELEASE="$(git describe --tags $(git rev-list --tags --max-count=1) | tr '-' '.')"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s.r%s" "${RELEASE#?}" "${REVISION}"
}

prepare() {
  cd ${srcdir}/${_pkgname}/translations
  for lang in `ls OpenOrienteering_*.ts | sed 's/OpenOrienteering_\(.*\)\.ts/\1/;/template/d;s/zh_CN/zh_Hans/'`; do
    curl -so OpenOrienteering_$lang.ts https://hosted.weblate.org/download/${_orgname}/${_pkgname}/$lang/
  done
  rename Hans.ts CN.ts OpenOrienteering_zh_Hans.ts
  for lang in `ls map_symbols_*.ts | sed 's/map_symbols_\(.*\)\.ts/\1/;/template/d'`; do
    curl -so map_symbols_$lang.ts https://hosted.weblate.org/download/${_orgname}/map-symbols/$lang/
  done
  for lang in `ls qt_*.ts | sed 's/qt_\(.*\)\.ts/\1/;/template/d'`; do
    curl -so qt_$lang.ts https://hosted.weblate.org/download/${_orgname}/qt/$lang/
  done
}

build() {
  cd ${srcdir}/${_pkgname}

  rm -rf build
  mkdir -p build
  cd build

  cmake ..                      \
    -DCMAKE_BUILD_TYPE=Release  \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DLICENSING_PROVIDER=arch   \
    -DMapper_PACKAGE_NAME=${pkgname} \
    -Wno-dev
  make -j$(nproc)
}

package() {
  cd ${srcdir}/${_pkgname}/build

  make DESTDIR=${pkgdir}/ install
  rm -fr ${pkgdir}/DEBIAN
}
