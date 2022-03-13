# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bm3d
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=9.0.gfe1a433
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172172'
license=('MIT')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfVapourSynthEvolution/VapourSynth-BM3D.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  sed '27a#include <limits>' -i bm3d/include/VBM3D_Final.h
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib/vapoursynth

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
