# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmod
pkgname=vapoursynth-plugin-${_plug}
pkgver=20151011
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171412'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z")
sha1sums=('94869e6821c7b8cdc0d4533000df1f9ed08a491d')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *.cpp -i *.cc

  echo "all:
	  gcc -c -Os -g0 -std=gnu++11 -I. -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o vcmod.o vcmod.cpp
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vcmod.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
