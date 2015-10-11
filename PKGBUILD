# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcmod
pkgname=vapoursynth-plugin-${_plug}
pkgver=201506xx
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=171412'
license=('GPL')
depends=('vapoursynth')
source=("http://www.avisynth.nl/users/vcmohan/vcmod/vcmod_src.7z")
sha1sums=('8349cf7163e5270687a279f839ebaee660a8ec63')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|"vapoursynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
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
