# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vctrans
pkgname=vapoursynth-plugin-${_plug}
pkgver=20150910
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=172594'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z")
sha1sums=('1601689fe7aff24dbddac7da5599c7f40f32607d')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *.cpp

  echo "all:
	  gcc -c -Os -g0 -std=gnu++11 -I. -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} $(pkg-config --cflags vapoursynth) -o vctrans.o vctrans.cpp
	  gcc -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vctrans.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 vctrans.html "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/vctrans.html"
}
