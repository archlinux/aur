# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=mupen64plus-highscore-git
pkgver=r25.b9b6bb3
pkgrel=1
pkgdesc="Highscore port of Mupen64Plus"
arch=('x86_64')
url="https://github.com/alice-mkh/mupen64plus-highscore"
license=('GPL-2.0-only')
depends=(
  'freetype2'
  'glu'
  'libgl'
  'libhighscore-git'
  'libpng'
  'sdl2'
  'zlib'
)
makedepends=(
  'git'
  'meson'
  'nasm'
  'yasm'
)
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
options=('!lto')
source=('git+https://github.com/alice-mkh/mupen64plus-highscore.git'
        'git+https://github.com/mupen64plus/mupen64plus-core.git'
        'git+https://github.com/gonetz/GLideN64.git'
        'git+https://github.com/mupen64plus/mupen64plus-rsp-hle.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${pkgname%-git}"
  git submodule init
  git config submodule.libs/mupen64plus-core.url "$srcdir/mupen64plus-core"
  git config submodule.libs/GLideN64.url "$srcdir/GLideN64"
  git config submodule.libs/mupen64plus-rsp-hle.url "$srcdir/mupen64plus-rsp-hle"
  git -c protocol.file.allow=always submodule update
}

build() {
#  CFLAGS+=" -ffat-lto-objects"
#  CXXFLAGS+=" -ffat-lto-objects"
  arch-meson "${pkgname%-git}" build
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
