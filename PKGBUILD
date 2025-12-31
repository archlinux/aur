# Maintainer: Robin 'Ruadeil' Degen <mail at ruadeil dot lgbt>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless
# Contributor: jiornojiovanni <gianni00palmieri at gmail dot com>

pkgname=cimgui
pkgver=1.92.5
pkgrel=1
pkgdesc="C wrapper for Dear ImGui"
arch=('x86_64')
url="https://github.com/cimgui/cimgui"
license=('MIT')
depends=('freetype2')
makedepends=('cmake')
provides=("${pkgname}.so")
source=(
  "git+https://github.com/cimgui/cimgui.git#tag=${pkgver}"
  '001-freetype-fix.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${pkgname}"
  git submodule update --init

  patch -Np1 -i "${srcdir}/001-freetype-fix.patch"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_options=(
    -B _build
    -S "${srcdir}/${pkgname}"
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=Release
    -D BUILD_SHARED_LIBS=ON
    -D IMGUI_STATIC=OFF
    -D IMGUI_FREETYPE=ON
    -D CIMGUI_TESTS=OFF
  )

  cmake "${cmake_options[@]}"
  cmake --build _build
}

package() {
  DESTDIR="${pkgdir}" cmake --install _build
  install -Dm644 "${srcdir}/${pkgname}/cimconfig.h" "${pkgdir}/usr/include/cimgui/cimconfig.h"
  install -Dm644 "${srcdir}/${pkgname}/cimgui.h" "${pkgdir}/usr/include/cimgui/cimgui.h"
  install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
