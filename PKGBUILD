# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=r1057.5873965
pkgrel=1
pkgdesc="Plugin for Avisynth/Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
makedepends=('git'
             'meson'
             'avisynthplus'
             'vapoursynth'
             'l-smash'
             'ffmpeg'
             )
source=("${_plug}::git+https://github.com/HolyWu/L-SMASH-Works.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build-{avisynth,vapoursynth}

  rm -fr "${_plug}/include"
}

build() {
  (cd build-vapoursynth
  arch-meson "../${_plug}/VapourSynth"
  ninja
  )
  (cd build-avisynth
  arch-meson "../${_plug}/AviSynth"
  ninja
  )
}

package_avisynth-plugin-lsmashsource-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus'
           'libavutil.so'
           'libavformat.so'
           'libavcodec.so'
           'libswscale.so'
           'liblsmash.so'
          )
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  DESTDIR="${pkgdir}" ninja -C build-avisynth install
  install -Dm644 "${_plug}/VapourSynth/README" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README"
}

package_vapoursynth-plugin-lsmashsource-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth'
           'libavutil.so'
           'libavformat.so'
           'libavcodec.so'
           'libswscale.so'
           'liblsmash.so'
          )
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  DESTDIR="${pkgdir}" ninja -C build-vapoursynth install
  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
