# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=melonds-highscore-git
pkgver=r2662.f0015c1
pkgrel=1
pkgdesc="Highscore port of MelonDS"
arch=('x86_64')
url="https://github.com/highscore-emu/melonDS"
license=('GPL-3.0-or-later')
depends=('libhighscore-git')
makedepends=(
  'cmake'
  'git'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://github.com/highscore-emu/melonDS.git')
sha256sums=('SKIP')

pkgver() {
  cd melonDS
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cmake -B build -S melonDS \
    -DCMAKE_BUILD_TYPE='RelWithDebInfo' \
    -DCMAKE_INSTALL_PREFIX='/usr' \
    -DBUILD_QT_SDL='OFF' \
    -DENABLE_GDBSTUB='OFF' \
    -DBUILD_HIGHSCORE='ON' \
    -Wno-dev
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
