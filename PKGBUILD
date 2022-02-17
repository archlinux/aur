# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("vapoursynth-plugin-${_plug}-git")
pkgver=vA.3h.1.g4a7a981
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
depends=('vapoursynth'
         'liblsmash.so'
         'libavcodec.so=58-64'
         'libavformat.so=58-64'
         'libavutil.so=56-64'
         'libswresample.so=3-64'
         'libswscale.so=5-64'
          )
makedepends=('git'
             'meson'
             'vapoursynth'
             'l-smash'
             'ffmpeg4.4'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/AmusementClub/L-SMASH-Works.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include"
}

build() {
  cd build
  export PKG_CONFIG_PATH='/usr/lib/ffmpeg4.4/pkgconfig'

  arch-meson "../${_plug}/VapourSynth" \
    --buildtype=release

  ninja

}

package_vapoursynth-plugin-lsmashsource-git() {
  DESTDIR="${pkgdir}" ninja -C build install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
