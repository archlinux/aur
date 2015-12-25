# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=inpaint
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.dafa5b5
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='https://github.com/invisiblearts/VapourSynth-Inpaint'
license=('GPL')
depends=('vapoursynth'
         'opencv'
         )
source=("${_plug}::git+https://github.com/invisiblearts/VapourSynth-Inpaint.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_plug}"
  rm -fr VSHelper.h VapourSynth.h

  sed -e 's|vapoursynth.h|VapourSynth.h|g' \
      -e 's|vshelper.h|VSHelper.h|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -i *

  echo "all:
	  g++ -c -std=gnu++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o Inpaint.o Inpaint.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so Inpaint.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
