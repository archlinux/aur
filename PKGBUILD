# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=libretro-dosbox-core-git
pkgver=r4948.4032f8b
pkgrel=1
pkgdesc="DOSBox core"
arch=(x86_64 aarch64)
url="https://github.com/realnc/dosbox-core"
license=(GPL2)
groups=(libretro)
depends=(gcc-libs libretro-core-info mpg123 flac opusfile opus libvorbis libogg alsa-lib libsndfile sdl sdl_net)
makedepends=(git cmake ninja meson)
source=(git+https://github.com/realnc/dosbox-core.git)
sha256sums=(SKIP)

pkgver() {
  cd dosbox-core
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd dosbox-core
  git submodule update --init
}

build() {
  cd dosbox-core/libretro
  export platform=unix
  export BUNDLED_AUDIO_CODECS=0
  export BUNDLED_LIBSNDFILE=0
  export BUNDLED_SDL=0
  export WITH_BASSMIDI=0
  export WITH_FLUIDSYNTH=0
  make deps
  make
}

package() {
  install -Dm644 "dosbox-core/libretro/dosbox_core_libretro.so" "${pkgdir}/usr/lib/libretro/dosbox_core_libretro.so"
}
