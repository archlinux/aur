# Maintainer: bill <beakless dot bill AT gmail DOT com>

pkgname=freeimagere-git
pkgver=4.2
pkgrel=3
provides=('libFreeImage.so')
conflicts=('freeimage')
pkgdesc="Fork of freeimage (library project for developers who would like to support popular graphics image formats)"
arch=('x86_64')
license=('GPL-2.0-only' 'GPL-3.0-only' 'LicenseRef-FreeImage')
url="https://github.com/agruzdev/FreeImageRe"
depends=('libheif' 'openexr' 'libpng' 'libwebp' 'libraw')
makedepends=('git' 'cmake' 'nasm')
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
    -D USE_SYSTEM_ZLIB=OFF     # there is no find_package for zlib
    -D USE_SYSTEM_YATO=OFF     # this is not packaged, and causes no conflicts
    -D USE_SYSTEM_LIBJPEG=OFF   # arch package does not provide transupp.h (jpegxl fails)
    -D USE_SYSTEM_LIBOPENEXR=ON
    -D USE_SYSTEM_LIBPNG=ON
    -D USE_SYSTEM_LIBTIFF=OFF   # arch package does not provide tiffiop.h (jpegxl fails)
    -D USE_SYSTEM_LIBWEBP=ON
    -D USE_SYSTEM_LIBRAW=ON
    -D USE_SYSTEM_LIBHEIF=ON
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  ln -s "${INSTALL_PREFIX}/lib/libFreeImage.so" "${pkgdir}${INSTALL_PREFIX}/lib/libFreeImage.so.${pkgver/\.[0-9]/}"
  ln -s "${INSTALL_PREFIX}/lib/libFreeImage.so" "${pkgdir}${INSTALL_PREFIX}/lib/libFreeImage.so.${pkgver}"
  install -D -m644 "${srcdir}"/${pkgname}/license-fi.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

