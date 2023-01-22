# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>
_plug=lsmashsource
pkgname="avisynth-plugin-${_plug}-git"
pkgver=20221109.0.gbf66e55
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
depends=('avisynthplus'
         'liblsmash.so'
         'libavcodec.so'
         'libavformat.so'
         'libavutil.so'
         'libswresample.so'
         'libswscale.so'
          )
makedepends=('git'
             'meson'
             'avisynthplus'
             'l-smash'
             )
provides=("avisynth-plugin-${_plug}")
conflicts=("avisynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HomeOfAviSynthPlusEvolution/L-SMASH-Works.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include"
}

build() {
  cd build

  arch-meson "../${_plug}/AviSynth" \
    --buildtype=release
  ninja
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README"
}
