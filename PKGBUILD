# Maintainer: Robin 'Ruadeil' Degen <mail at ruadeil dot lgbt>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless
# Contributor: jiornojiovanni <gianni00palmieri at gmail dot com>

pkgname=libtcod
pkgver=2.3.1
pkgrel=1
pkgdesc="Roguelike graphics/utility library"
arch=('x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD-3-Clause')
depends=('glibc' 'libgcc' 'libstdc++' 'libutf8proc' 'sdl3' 'zlib')
makedepends=('cmake')
provides=("${pkgname}.so")
changelog=CHANGELOG.md
# 001: find libutf8proc through pkg-config; it ships no CMake config
source=(
  "https://github.com/libtcod/libtcod/archive/refs/tags/${pkgver}.tar.gz"
  '001-system-utf8proc.patch'
)
sha256sums=('dbde843dfdc117bc77a35f6f7321b2aca95196702f468c40286b27996e900ac7'
            '119ed5d079a66f3990651ae118f46c2807cff9cee15e0b226f8274c8411aa37a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/001-system-utf8proc.patch"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  # Keep the build directory out of __FILE__ in log messages
  local prefix_map="-fmacro-prefix-map=${srcdir}/${pkgname}-${pkgver}/="
  export CFLAGS+=" ${prefix_map}"
  export CXXFLAGS+=" ${prefix_map}"

  local cmake_options=(
    -B _build
    -S "${srcdir}/${pkgname}-${pkgver}"
    -D FETCHCONTENT_FULLY_DISCONNECTED=ON
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_BUILD_TYPE=Release
    -D BUILD_SHARED_LIBS=ON
    -D LIBTCOD_SAMPLES=OFF
    -D LIBTCOD_TESTS=OFF
    -D LIBTCOD_SDL3="ON"
    -D LIBTCOD_ZLIB="ON"
    -D LIBTCOD_LODEPNG="vendored"
    -D LIBTCOD_UTF8PROC="ON"
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
