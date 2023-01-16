# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=focus
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=4.0.g28efbb1
pkgrel=2
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?p=1777684#post1777684'
license=('GPLv2')
depends=('vapoursynth')
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}"
          'vapoursynth-plugin-temporalsoften'
          'vapoursynth-plugin-temporalsoften-git'
          )
conflicts=("vapoursynth-plugin-${_plug}"
           'vapoursynth-plugin-temporalsoften'
           'vapoursynth-plugin-temporalsoften-git'
           )
source=("${_plug}::git+https://github.com/IFeelBloated/vapoursynth-focus.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

prepare() {
  cd "${_plug}"

  rm -fr VapourSynth.h

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o EntryPoint.o EntryPoint.cpp
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o SpatialSoften.o SpatialSoften.cpp
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o TemporalSoften.o TemporalSoften.cpp
	  g++ -shared -fPIC ${LDFLAGS} -o libvs${_plug}.so EntryPoint.o SpatialSoften.o TemporalSoften.o"> Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  cd "${_plug}"
  install -Dm775 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
