# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fixtelecinedfades
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r2.0.g2022095
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=174151'
license=('GPL2')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/Fix-Telecined-Fades")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  rm -fr src/VapourSynth.h src/VSHelper.h

  sed '1i#include <cstring>' -i Source.cpp

  echo "all:
	  g++ -c -std=c++14 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o ${_plug}.o Source.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o libvs${_plug}.so ${_plug}.o"> Makefile

}

build() {
  cd "${_plug}"

  make
}

package(){
  install -Dm755 "${_plug}/libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
