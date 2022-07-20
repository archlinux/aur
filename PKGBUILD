# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=libretro-dosbox-core-git
pkgver=r4941.8f59f153
pkgrel=1
pkgdesc="MS-DOS core"
arch=(x86_64 aarch64)
url="https://github.com/realnc/dosbox-core"
license=(GPL2)
groups=(libretro)
depends=(gcc-libs libretro-core-info mpg123 flac opusfile opus libvorbis libogg alsa-lib libsndfile sdl sdl_net)
makedepends=(git cmake ninja meson)
_gitname=dosbox-core
source=("git+https://github.com/realnc/${_gitname}.git")
sha256sums=(SKIP)

pkgver() {
  cd ${_gitname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${_gitname}
  git submodule update --init
}

build() {
  cd ${_gitname}/libretro
  make platform=unix BUNDLED_AUDIO_CODECS=0 BUNDLED_LIBSNDFILE=0 BUNDLED_SDL=0 deps
  make platform=unix BUNDLED_AUDIO_CODECS=0 BUNDLED_LIBSNDFILE=0 BUNDLED_SDL=0
}

package() {
  install -Dm644 "${_gitname}/libretro/dosbox_core_libretro.so" "${pkgdir}/usr/lib/libretro/dosbox_core_libretro.so"
}
