# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcfreq
pkgname=vapoursynth-plugin-${_plug}
pkgver=20160817
pkgrel=3
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172594'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
source=("${_plug}-${pkgver}_rev2.7z::https://www.dropbox.com/s/eyhceb84txhw90z/${_plug}_src_x64.7z?dl=1")
sha256sums=('cea86df06ab660fb1795c76e89290d48a7ad6df5df0c976d070505caab466869')

prepare(){
  rm -fr VSHelper.h VapourSynth.h *fftw3*

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o vcfreq.o vcfreq.cpp
	  g++ -shared $(pkg-config --libs fftw3) -fPIC ${LDFLAGS} -o lib${_plug}.so vcfreq.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
