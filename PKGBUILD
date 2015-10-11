# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmove
pkgname=vapoursynth-plugin-${_plug}
pkgver=20141110
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171414'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::https://dl.dropboxusercontent.com/u/36232595/vapoursynth/vapoursynth-vcmove-${pkgver}.7z")
sha1sums=('c7a648e92e7c442d87da1620276c4024c57ed76e')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|reformHelper.cpp|ReformHelper.cpp|g' \
      -i *

  echo "all:
	  gcc -c -Os -g0 -std=gnu++11 -I. -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o vcmove.o vcmove.cpp
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vcmove.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
