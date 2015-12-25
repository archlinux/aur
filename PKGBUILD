# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=flt
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.0.gc94c091
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=172273'
license=('GPL')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/FLT.git")
sha1sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  rm -fr VapourSynth.h VSHelper.h

  echo "all:
	  g++ -c -std=gnu++11 -fPIC -Wextra -Wno-unused-parameter ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o FloatFilters.o FloatFilters.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o lib${_plug}.so FloatFilters.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
