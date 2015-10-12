# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=tc2cfr
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=v0.0.1.3.gf5f52f3
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url="https://github.com/gnaggnoyil/${_plug}"
license=('BSD')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("git+https://github.com/gnaggnoyil/${_plug}.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  rm -fr "${_plug}/"{VapourSynth,VSHelper}.h

  # fix missing include
  sed '26a#include <stdlib.h>' -i "${_plug}/Backend.cpp"
  # comment unused parameter on linux
  sed -e '35a/*' -e '38a*/' -i "${_plug}/Backend.cpp"

  echo "all:
	  g++ -o lib${_plug}.so -std=gnu++11 ${CXXFLAGS} ${CPPFLAGS} ${LDFLAGS} $(pkg-config --cflags vapoursynth) -fPIC -shared ${_plug}/Backend.cpp ${_plug}/VSFrontend.cpp" > Makefile
}

build() {
  make
}

package(){
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE.BSD2c" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.BSD2c"
}
