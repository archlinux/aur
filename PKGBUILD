# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcm
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2022.02.10.AC.4.gc770bbc
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GITversion)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172594'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-vcmod'
           'vapoursynth-plugin-vcfreq'
           'vapoursynth-plugin-vcmove'
           )
source=("${_plug}::git+https://github.com/AmusementClub/vcm.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare(){
  mkdir -p build

  cd "${_plug}"

  rm -fr VSHelper.h VapourSynth.h

  sed -e '/VapourSynth.h/c#include <VapourSynth.h>' \
      -e '/VsHeper.h/c#include <VSHelper.h>' \
      -e '/VSHelper/c#include <VSHelper.h>' \
      -i *.cpp \
      -i *.h

  sed 's|^  #|  |g' -i meson.build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --buildtype=release

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  (cd "${_plug}/docs"; for i in *.html vcmisc0.png ; do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done)
}
