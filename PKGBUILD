# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mgba-highscore-git
pkgver=r9259.3b350f9
pkgrel=1
pkgdesc="Highscore port of mGBA"
arch=('x86_64')
url="https://github.com/highscore-emu/mgba"
license=('MPL-2.0')
depends=(
  'ffmpeg'
  'libepoxy'
  'libhighscore-git'
)
makedepends=(
  'cmake'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/mgba.git')
sha256sums=('SKIP')

pkgver() {
  cd mgba
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S mgba
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D ENABLE_DEBUGGERS='OFF'
    -D USE_EDITLINE='OFF'
    -D ENABLE_GDB_STUB='OFF'
    -D USE_ZLIB='OFF'
    -D USE_MINIZIP='OFF'
    -D USE_PNG='OFF'
    -D USE_LIBZIP='OFF'
    -D USE_SQLITE3='OFF'
    -D USE_ELF='OFF'
    -D USE_LUA='OFF'
    -D USE_JSON_C='OFF'
    -D USE_LZMA='OFF'
    -D USE_DISCORD_RPC='OFF'
    -D ENABLE_SCRIPTING='OFF'
    -D BUILD_QT='OFF'
    -D BUILD_SDL='OFF'
    -D BUILD_HIGHSCORE='ON'
    -D SKIP_LIBRARY='ON'
    -D M_CORE_GB='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  cmake -DCOMPONENT=mgba_highscore mgba \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
  cmake -DCOMPONENT="${pkgname%-git}" mgba \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -P build/cmake_install.cmake
}
