# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmove
pkgname=vapoursynth-plugin-${_plug}
pkgver=20160409
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171414'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/vcmove/vcmove_src.7z")
sha1sums=('6a9dd0a2bb72780d11c61c29f43c3bf2de2711f6')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|reformHelper.cpp|ReformHelper.cpp|g' \
      -i *

  echo "all:
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o vcmove.o vcmove.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vcmove.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
