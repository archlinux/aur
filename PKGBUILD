# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vctrans
pkgname=vapoursynth-plugin-${_plug}
pkgver=20150910
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172594'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z")
sha256sums=('35b55c4962b9f2b48ba18ac1333dcc36064eea61ab05479a3c268f5aa66c99e7')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o vctrans.o vctrans.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vctrans.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 vctrans.html "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/vctrans.html"
}
