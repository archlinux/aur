# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=vctrans
pkgname=vapoursynth-plugin-${_plug}
pkgver=20210717
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172594'
license=('GPL')
depends=('vapoursynth')
source=("${_plug}-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}_src.7z"
        "${_plug}_doc-${pkgver}.7z::http://www.avisynth.nl/users/vcmohan/${_plug}/${_plug}.7z"
        )
sha256sums=('631ebb3a2071b48f53d10ce8f3f5a1a830fe141d265eb559699cc7116de20e50'
            'e152fc1f272e5da936d9639f0b486de1f28ebb5a7018ac42822fe93015a0046b'
            )
options=('debug')

prepare(){
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *.{cpp,h}

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o vctrans.o vctrans.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so vctrans.o" > Makefile
}

build() {
  make
}

package() {
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  for i in *.html; do
    install -Dm644 "$i" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/$i"
  done
}
