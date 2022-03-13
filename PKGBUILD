# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=surfaceblur
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=0.1.gf8fac49
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/MoePus/VapourSynth-surfaceBlur'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/MoePus/VapourSynth-surfaceBlur.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"

  _AVX=$(gcc -march=native -dM -E - </dev/null | grep _AVX_ | cut -d ' ' -f3)
  if [ "${_AVX}" = "1" ]; then
    CXXFLAGS+=" -mavx"
  else
    echo "" > config.h
  fi

  echo "all:
	  g++ -c -std=gnu++11 -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o VSPlugin.o VSPlugin.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so VSPlugin.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 readme.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/readme.md"
}
