# Maintainer: qubeck <qubeck [AT] disroot [DOT] org>

pkgname=qsp-legacy-git
_name=${pkgname%-git}
pkgver=5.7.0.r136.gd29d5eb
pkgrel=1
pkgdesc='QSP Legacy game engine library'
arch=('x86_64')
url='https://github.com/QSPFoundation/qsp-legacy'
license=(
  'GPL-2.0-or-later'
  'LGPL-2.1-or-later'
)
depends=(
  'glibc'
  'oniguruma'
)
makedepends=(
  'gcc>=8.1.0'
  'git'
  'cmake>=3.21.0'
)
provides=(
  "${pkgname%-git}=${pkgver}"
  'libqsp-legacy.so'
)
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"

  local base
  base=$(sed -n "s/^project(${pkgname%-git} VERSION \([0-9.]\+\)).*/\1/p" CMakeLists.txt)
  printf '%s.r%s.g%s' "${base:-0}" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${pkgname%-git}"

  # GCC 14+ treats -Wincompatible-pointer-types as a hard error; this legacy
  # codebase passes QSP_CHAR** where void** is declared (ABI-identical).
  local CFLAGS="${CFLAGS} -Wno-error=incompatible-pointer-types"

  local cmake_options=(
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
    -D CMAKE_INSTALL_LIBDIR=lib
    -D BUILD_JVM=OFF
    -D USE_INSTALLED_ONIGURUMA=ON
    -W no-author
  )

  cmake -B build "${cmake_options[@]}"
  cmake --build build
}

package() {
  cd "${pkgname%-git}"

  DESTDIR="${pkgdir}" cmake --install build
}
