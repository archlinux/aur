# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmove
pkgname=vapoursynth-plugin-${_plug}
pkgver=20160410
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=171414'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/vcmove/vcmove_src.7z")
sha256sums=('18d99e51d0d2ebf12274a23c92977ee11e1427dded1875390709e8203c7af0ec')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|reformHelper.cpp|ReformHelper.cpp|g' \
      -i *

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o vcmove.o vcmove.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vcmove.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
