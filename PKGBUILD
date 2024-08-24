# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgbase=foosynth-plugin-${_plug}-git
pkgname=("vapoursynth-plugin-${_plug}-git")
pkgver=1194.0.0.0.5.gf41e8d5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
depends=('vapoursynth'
  'liblsmash.so'
  'libavcodec.so'
  'libavformat.so'
  'libavutil.so'
  'libswresample.so'
  'libswscale.so'
)
makedepends=('git'
  'meson'
  'vapoursynth'
  'l-smash'
  'ffmpeg'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
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
  arch-meson "../${_plug}/VapourSynth" \
    --buildtype=release

  ninja
}

package_vapoursynth-plugin-lsmashsource-git() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/VapourSynth/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
