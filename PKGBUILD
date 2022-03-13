# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fixtelecinedfades
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=5.30.ge70d7fb
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=174151'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git'
             'meson'
             'yasm'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Fix-Telecined-Fades.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/VapourSynth.h" "${_plug}/VSHelper.h"

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i "${_plug}/Shared.hpp"
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --libdir /usr/lib

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install
}
