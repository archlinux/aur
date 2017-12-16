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
makedepends=('git')
source=("${_plug}::git+https://github.com/invisiblearts/VapourSynth-Inpaint.git"
        'patch.patch'
        )
sha256sums=('SKIP'
            'f2454d793377b7f6a955d2f939dd83be7005a91025bfdca3b6867e49c172cd1c'
            )

pkgver() {
  cd "${_plug}"
  #echo "$(git describe --long --tags | tr - .)"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare(){
  cd "${_plug}"
  rm -fr VSHelper.h VapourSynth.h

  patch -p1 -i "${srcdir}/patch.patch"

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
