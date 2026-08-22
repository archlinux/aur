# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>
# Contributor: Lubosz Sarnecki < lubosz at gmail dot com >

pkgname=compressonator-git
pkgdesc="Tool suite for Texture and 3D Model Compression, Optimization and Analysis. Lubosz's Linux GUI port branch."
pkgver=3.2.4691.r50.g557248de
pkgrel=1
url='https://github.com/GPUOpen-Tools/Compressonator'
arch=(x86_64)
license=('MIT')
makedepends=(
  'boost'
  'cmake'
  'git'
)
depends=(
  'boost-libs'
  'draco-git'
  'opencv'
  'qt5-webengine'
)
provides=('compressonator')
conflicts=('compressonator')
source=('git+https://github.com/lubosz/Compressonator.git#branch=gui-cmake-qt5-linux')
b2sums=('SKIP')

pkgver() {
  cd Compressonator
  # shellcheck disable=SC2312 # will render pkgver invalid on fail
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local cmake_options=(
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D CMAKE_INSTALL_SBINDIR=bin
    -D CMAKE_INSTALL_SYSCONFDIR=/etc
    -D CMAKE_BUILD_TYPE=RelWithDebInfo
    -D BUILD_SHARED_LIBS=ON
  )

  cmake -B build -S Compressonator/Compressonator "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  ln -v -sr "${pkgdir}/usr/bin/CompressonatorCLI-bin" \
    -T "${pkgdir}/usr/bin/compressonator-cli"

  install -vD -m644 Compressonator/Compressonator/License/GUILicense.txt \
    -T "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}
