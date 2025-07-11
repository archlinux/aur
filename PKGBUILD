# # Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mgba-highscore-git
pkgver=r8921.2e05962
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
  cmake -B build -S mgba \
    -DCMAKE_BUILD_TYPE='None' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DENABLE_DEBUGGERS='OFF' \
    -DUSE_EDITLINE='OFF' \
    -DENABLE_GDB_STUB='OFF' \
    -DUSE_ZLIB='OFF' \
    -DUSE_MINIZIP='OFF' \
    -DUSE_PNG='OFF' \
    -DUSE_LIBZIP='OFF' \
    -DUSE_SQLITE3='OFF' \
    -DUSE_ELF='OFF' \
    -DUSE_LUA='OFF' \
    -DUSE_JSON_C='OFF' \
    -DUSE_LZMA='OFF' \
    -DUSE_DISCORD_RPC='OFF' \
    -DENABLE_SCRIPTING='OFF' \
    -DBUILD_QT='OFF' \
    -DBUILD_SDL='OFF' \
    -DBUILD_HIGHSCORE='ON' \
    -DSKIP_LIBRARY='ON' \
    -Wno-dev
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
