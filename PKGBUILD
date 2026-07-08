# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=melonds-highscore-git
pkgver=r2894.b0f7cb1
pkgrel=1
pkgdesc="Highscore port of MelonDS"
arch=('x86_64')
url="https://github.com/highscore-emu/melonDS"
license=('GPL-3.0-or-later')
depends=(
  'enet'
  'glib2'
  'libhighscore-git'
)
makedepends=(
  'cmake'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/highscore-emu/melonDS.git')
sha256sums=('SKIP')

pkgver() {
  cd melonDS
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  local cmake_options=(
    -B build
    -S melonDS
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_INSTALL_LIBDIR='/usr/lib'
    -D BUILD_QT_SDL='OFF'
    -D ENABLE_GDBSTUB='OFF'
    -D BUILD_HIGHSCORE='ON'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
