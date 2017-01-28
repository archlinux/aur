# Maintainer: Nikolay Korotkiy <sikmir@gmail.com>
_orgname=openorienteering
_pkgname=mapper
pkgname=${_orgname}-${_pkgname}-git
pkgver=0.6.7.r3204.d77941c9
pkgrel=1
pkgdesc="Orienteering mapmaking program"
arch=('i686' 'x86_64')
url="http://openorienteering.github.io/apps/mapper/"
license=('GPL3')
depends=('qt5-base>=5.5.1' 'polyclipping>=6.1.3a' 'proj>=4.9.2' 'gdal1>=1.11')
makedepends=('cmake>=2.8.12' 'qt5-tools>=5.5.1' 'doxygen' 'libcups')
provides=("${pkgname//-git}=${pkgver}")
conflicts=(${pkgname//-git})
install=${pkgname//-git}.install
source=("${_pkgname}::git://github.com/${_orgname}/${_pkgname}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  RELEASE="$(git describe --tags $(git rev-list --tags --max-count=1))"
  REVISION="$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
  printf "%s.r%s" "${RELEASE#?}" "${REVISION}"
}

prepare() {
  cd ${srcdir}/${_pkgname}/translations
  for lang in `ls OpenOrienteering_*.ts | sed 's/OpenOrienteering_\(.*\)\.ts/\1/' | grep -v template`; do
    curl -so OpenOrienteering_$lang.ts https://hosted.weblate.org/download/${_orgname}/${_pkgname}/$lang/
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
    -DMapper_BUILD_QT=0         \
    -DMapper_BUILD_CLIPPER=0    \
    -DMapper_BUILD_PROJ=0       \
    -DMapper_BUILD_GDAL=0       \
    -DMapper_USE_GDAL=1         \
    -DMapper_BUILD_DOXYGEN=0    \
    -DMapper_PACKAGE_NAME=${pkgname} \
    -Wno-dev
  make -j$(nproc)
}

package() {
  cd ${srcdir}/${_pkgname}/build

  make DESTDIR=${pkgdir}/ install
  rm -fr ${pkgdir}/DEBIAN
}
