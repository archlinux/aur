# Maintainer: Tilla <carlosfritz@posteo.net>

pkgname=libretro-dosbox-core
pkgver=4784.f5e1796c
pkgrel=1
pkgdesc="A DOSBox core for use in RetroArch and other libretro frontends"
arch=(x86_64 aarch64)
url="https://github.com/realnc/dosbox-core"
license=('GPL2')
groups=('libretro')
depends=('libretro-core-info' 'alsa-lib' 'libsndfile' 'sdl' 'sdl_net')
makedepends=('git' 'cmake' 'ninja' 'meson')
_libname=dosbox_core_libretro
_gitname=dosbox-core
source=("git+https://github.com/realnc/${_gitname}.git")
sha256sums=('SKIP')
options=(!buildflags)

pkgver() {
  cd ${_gitname}
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd ${_gitname}
  git submodule update --init
}

build() {
  cd ${_gitname}/libretro
  make platform=unix BUNDLED_AUDIO_CODECS=1 BUNDLED_LIBSNDFILE=0 BUNDLED_SDL=0 deps
  make platform=unix BUNDLED_AUDIO_CODECS=1 BUNDLED_LIBSNDFILE=0 BUNDLED_SDL=0 -j`nproc`
}

package() {
  install -Dm644 "${_gitname}/libretro/${_libname}.so" "${pkgdir}/usr/lib/libretro/${_libname}.so"
}
