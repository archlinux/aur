# Maintainer: bill <beakless dot bill AT gmail DOT com>

pkgname=freeimagere-git
pkgver=0.6
pkgrel=2
provides=('libFreeImageRE.so')
conflicts=('freeimage')
pkgdesc="Fork of freeimage (library project for developers who would like to support popular graphics image formats)"
arch=('x86_64')
license=('GPL-2.0-only' 'GPL-3.0-only' 'LicenseRef-FreeImage')
url="https://github.com/agruzdev/FreeImageRe"
depends=('python')
makedepends=('git' 'cmake' 'meson' 'nasm' 'ninja')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

INSTALL_PREFIX="/usr"
pkgver_maj=
pkgver_min=
pkgver() {
  cd "${pkgname}"
  pkgver_maj=$(grep 'set(FREEIMAGERE_MAJOR_VERSION ".*")' "CMakeLists.txt" | sed -e 's%")%%;s%^.*"%%')
  pkgver_min=$(grep 'set(FREEIMAGERE_MINOR_VERSION ".*")' "CMakeLists.txt" | sed -e 's%")%%;s%^.*"%%')
  echo "${pkgver_maj}.${pkgver_min}"
}
build() {
  local cmake_options=(
    -B build
    -S "${pkgname}"
    -Wno-dev
    -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX}
   )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  INSTALL_PREFIX="/usr"
  ln -s "${pkgdir}${INSTALL_PREFIX}/lib/libFreeImageRE.so" "${pkgdir}${INSTALL_PREFIX}/lib/libFreeImageRE.so.${pkgver_maj}"
  ln -s "${pkgdir}${INSTALL_PREFIX}/lib/libFreeImageRE.so" "${pkgdir}${INSTALL_PREFIX}/lib/libFreeImageRE.so.${pkgver_maj}.${pkgver_min}"
  install -D -m644 "${srcdir}"/${pkgname}/license-fi.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

