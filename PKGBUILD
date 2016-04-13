# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmod
pkgname=vapoursynth-plugin-${_plug}
pkgver=20160221
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171412'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z")
sha1sums=('0c7f7e2669451b15a660bb1a8ef4aa7f48b7339f')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *

  echo "all:
	  g++ -c -std=gnu++11 -I. -fPIC ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o vcmod.o vcmod.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vcmod.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
