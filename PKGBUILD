# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tc2cfr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.0.1.3.gf5f52f3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/dubhater/vapoursynth-${_plug}"
license=('BSD')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/gnaggnoyil/tc2cfr.git")
md5sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  rm -fr VapourSynth.h VSHelper.h avisynth.h

  sed '26a#include <stdlib.h>' -i Backend.cpp
  sed -e '35a/*' -e '38a*/' -i Backend.cpp

  echo "all:
	  g++ -shared ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS} -fPIC *.cpp -o lib${_plug}.so -I. $(pkg-config --cflags vapoursynth)" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README"
  install -Dm644 LICENSE.BSD2c "${pkgdir}/usr/share/license/${pkgname}/LICENSE"
}
