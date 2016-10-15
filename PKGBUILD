# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=miscfilters
pkgname=vapoursynth-plugin-${_plug}
pkgver=4
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug}"
arch=('i686' 'x86_64')
url='http://forum.doom9.org/showthread.php?t=173871'
license=('GPL')
depends=('vapoursynth')
source=("https://dl.dropboxusercontent.com/u/36232595/vapoursynth/vapoursynth-miscfilters-${pkgver}.tar.gz")
sha256sums=('5e7544a55001224749ed4b5b495215d50da9191b11cbf837b6dca943a1984e9d')

prepare() {
  cd "vapoursynth-miscfilters-${pkgver}"

  sed -e 's|"VSHelper.h"|<VSHelper.h>|g' \
      -e 's|"VapourSynth.h"|<VapourSynth.h>|g' \
      -i filtersharedcpp.h \
      -i filtershared.h

  echo "all:
	  g++ -c -std=c++11 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o miscfilters.o miscfilters.cpp
	  g++ -shared  -fPIC ${LDFLAGS} -o libvs${_plug}.so miscfilters.o"> Makefile
}

build() {
  cd "vapoursynth-miscfilters-${pkgver}"
  make
}

package(){
  cd "vapoursynth-miscfilters-${pkgver}"
  install -Dm755 "libvs${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/libvs${_plug}.so"
}
