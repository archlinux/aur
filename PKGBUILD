# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1036.86f757d
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=167435'
license=('LGPL')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         'libswscale.so'
         'liblsmash.so'
         )
makedepends=('git'
             'meson'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/HolyWu/L-SMASH-Works.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include/"V*
}

build() {
  cd build

  arch-meson "../${_plug}/VapourSynth"
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
