# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vcfreq
pkgname=vapoursynth-plugin-${_plug}
pkgver=20160216
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=172594'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
#source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z")
source=("${_plug}-${pkgver}.7z::https://dl.dropboxusercontent.com/u/73468194/vcfreq_src_x64.7z")
sha1sums=('68ad40a5c3775b6bd848f75094524d248b736514')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|"vapoursynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|vshelper|VSHelper|g' \
      -e 's|FQSharpHelper|FQSharphelper|g' \
      -i *

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o vcfreq.o vcfreq.cpp
	  g++ -shared -fPIC ${LDFLAGS} -L $(pkg-config --libs fftw3) -o lib${_plug}.so vcfreq.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
