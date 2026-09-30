# Maintainer: Robin 'Ruadeil' Degen <mail at ruadeil dot lgbt>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless
# Contributor: jiornojiovanni <gianni00palmieri at gmail dot com>

pkgname=libtcod
pkgver=2.2.2
pkgrel=2
pkgdesc="Roguelike graphics/utility library"
arch=('x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'sdl3' 'zlib')
makedepends=('cmake')
provides=("${pkgname}.so")
changelog=CHANGELOG.md
source=(
  "https://github.com/libtcod/libtcod/archive/refs/tags/${pkgver}.tar.gz"
  '001-config-include-dir.patch'
)
sha256sums=('69f30fe65df1c84049a8f4f4b1ea0894191221da3a671be61832e33e75df898e'
            'ec893e291545269fee8da5920d97a5e05946d9291c774b052cfc948791e04240')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/001-config-include-dir.patch"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_options=(
    -B _build
    -S "${srcdir}/${pkgname}-${pkgver}"
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=Release
    -D BUILD_SHARED_LIBS=ON
    -D LIBTCOD_SAMPLES=OFF
    -D LIBTCOD_TESTS=OFF
    -D LIBTCOD_SDL3="find_package"
    -D LIBTCOD_ZLIB="find_package"
    -D LIBTCOD_LODEPNG="vendored"
    -D LIBTCOD_UTF8PROC="vendored"
    -D LIBTCOD_STB="vendored"
    -D LIBTCOD_INSTALL=ON
  )

  cmake "${cmake_options[@]}"
  cmake --build _build
}

package() {
  DESTDIR="${pkgdir}" cmake --install _build
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
