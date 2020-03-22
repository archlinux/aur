# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=lsmashsource
pkgname=avisynth-plugin-${_plug}-git
pkgver=r1036.86f757d
pkgrel=1
pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
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
source=("${_plug}::git+https://github.com/HolyWu/L-SMASH-Works.git"
        'avisynth.patch'
        )
sha256sums=('SKIP'
            '4f4535e0743b078b2ac0cf2034aa0f00599cde6504485576afc1c84e5a887f2c'
            )

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p build

  rm -fr "${_plug}/include/"avs*

  patch -d "${_plug}" -p1 -i "${srcdir}/avisynth.patch"
}

build() {
  cd build

  arch-meson "../${_plug}/AviSynth" \
    --libdir /usr/lib/AviSynth
}

package(){
  DESTDIR="${pkgdir}" ninja -C build install

  install -Dm644 "${_plug}/AviSynth/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}
