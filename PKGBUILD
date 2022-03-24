# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=d2vsource
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=1.2.16.g700523c
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=166399'
license=('LGPL2.1')
depends=('vapoursynth'
         'libavutil.so'
         'libavformat.so'
         'libavcodec.so'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/dwbuiten/${_plug}.git"
        'https://patch-diff.githubusercontent.com/raw/dwbuiten/d2vsource/pull/52.diff')
sha256sums=('SKIP'
            'ef7130f38fbc3a7a036d2fdf9ced4746b35cd794955c3c52c0d9c323f8498f3c'
            )
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d v)"
}

prepare() {
  mkdir -p build

  patch -d d2vsource -p1 -i "${srcdir}/52.diff"
}

build() {
  cd "${_plug}"
  ./autogen.sh

  cd "${srcdir}/build"
  "../${_plug}/configure" \
    --prefix=/usr \
    --libdir=/usr/lib/vapoursynth

  make
}

package(){
  make -C build DESTDIR="${pkgdir}" install

  install -Dm644 "${_plug}/README" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
}

