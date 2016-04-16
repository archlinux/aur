# Maintainer: Michael Yang <ohmyarchlinux@gmail.com>
pkgname=mingw-w64-kdreports-git
pkgver=1.7.50.r132.049ff54
pkgrel=1
pkgdesc="A Qt library for creating printable reports (mingw-w64)"
arch=('any')
url="http://www.kdab.com/kd-reports/"
license=('GPL' 'LGPL' 'custom')
depends=('mingw-w64-qt5-base')
makedepends=('git' 'mingw-w64-cmake')
conflicts=('mingw-w64-kdreports')
provides=('mingw-w64-kdreports')
options=('!strip' '!buildflags')
source=("git://github.com/KDAB/KDReports.git")
sha512sums=('SKIP')

_architectures="i686-w64-mingw32 x86_64-w64-mingw32"

pkgver() {
  cd KDReports
  _ver="$(cat CMakeLists.txt | grep -m3 -e ${PROJECT_NAME}_VERSION_MAJOR -e ${PROJECT_NAME}_VERSION_MINOR -e ${PROJECT_NAME}_VERSION_PATCH | grep -o "[[:digit:]]*" | paste -sd'.')"
  echo "$_ver.r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  unset LDFLAGS
  cd "$srcdir/KDReports/"
  for _arch in ${_architectures}; do
    mkdir -p build-${_arch} && pushd build-${_arch}
    ${_arch}-cmake \
      -DKDReports_TESTS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ..
    make
    popd
  done
}

package() {
  for _arch in ${_architectures}; do
    cd "${srcdir}/KDReports/build-${_arch}"
    make DESTDIR="${pkgdir}" install
    rm -r "${pkgdir}/usr/${_arch}/share"
  done
}
