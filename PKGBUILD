# Maintainer: Robin 'Ruadeil' Degen <mail at ruadeil dot lgbt>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Feufochmar <feufochmar dot gd at gmail dot com>
# Contributor: Joao Cordeiro <jlcordeiro at gmail dot com>
# Contributor: SirClueless
# Contributor: jiornojiovanni <gianni00palmieri at gmail dot com>

pkgname=libtcod
pkgver=2.2.1
pkgrel=1
pkgdesc="Roguelike graphics/utility library"
arch=('x86_64')
url="https://github.com/libtcod/libtcod"
license=('BSD')
depends=('sdl3' 'zlib')
makedepends=('cmake')
provides=("${pkgname}.so")
changelog=CHANGELOG.md
source=(
  "https://github.com/libtcod/libtcod/archive/refs/tags/${pkgver}.tar.gz"
  '001-fix-install-config-pt1.patch'
)
sha256sums=('5eb8e30d937840986c11c7baa22ffa93252aa4ac1824fe2c5fa1d760b3496a8e'
            'SKIP')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  patch -Np1 -i "${srcdir}/001-fix-install-config-pt1.patch"
}

build() {
  export CFLAGS+=" ${CPPFLAGS}"
  export CXXFLAGS+=" ${CPPFLAGS}"

  local cmake_options=(
    -B _build
    -S "${srcdir}/${pkgname}-${pkgver}"
    -D CMAKE_TOOLCHAIN_FILE="" # Hack to bypass libcod trying to use the vcpkg toolchain file
    -D CMAKE_PREFIX_PATH="${srcdir}"
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
