# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcm
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=2021.09.11.10.g9d31a83
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
provides=("vapoursynth-plugin-${_plug}"
          'vapoursynth-plugin-vcmod'
          'vapoursynth-plugin-vcfreq'
          'vapoursynth-plugin-vcmove'
           )
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-vcmod'
           'vapoursynth-plugin-vcfreq'
           'vapoursynth-plugin-vcmove'
           )
replaces=('vapoursynth-plugin-vcmod'
           'vapoursynth-plugin-vcfreq'
           'vapoursynth-plugin-vcmove'
           )
source=("${_plug}::git+https://github.com/AmusementClub/vcm.git"
        'vcm_doc-20210914.7z::http://www.avisynth.nl/users/vcmohan/vcm/vcm.7z'
        )
sha256sums=('SKIP'
            '09b6f8109fbd9f78d6988642273fbdbf69a9007dc9da2a26879533fe166d67dd'
            )

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

      sed '87itypedef int errno_t;' -i FQCorrelation.cpp

  sed 's|#||g' -i meson.build
}

build() {
  cd build
  arch-meson "../${_plug}" \
    --buildtype=release

  ninja
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  for i in *.html; do install -Dm644 "${i}" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/${i}"; done
}
