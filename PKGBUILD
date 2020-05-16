# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=mvtools_sf
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r10_pre.1.g820dd0a
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://forum.doom9.org/showthread.php?t=172525'
license=('GPL2')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'vapoursynth-lib-vsfilterscript-git'
              )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/IFeelBloated/vapoursynth-mvtools-sf.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"
  sed 's|"Include/Interface.hxx"|<Include/Interface.hxx>|g' -i src/EntryPoint.cxx
  sed -e 's|"Include/VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"Include/VSHelper.h"|<VSHelper.h>|g' \
      -i src/*.hxx \
      -i src/*.h
  sed 's|"Include/fftw3.h"|<fftw3.h>|g' -i src/DCTFFTW.hpp

  echo "all:
	  g++ -c -std=gnu++20 -fPIC ${CXXFLAGS} ${CPPFLAGS} -I/usr/include/vsfilterscript -I./src $(pkg-config --cflags vapoursynth) -o EntryPoint.o src/EntryPoint.cxx
	  g++ -shared -fPIC ${LDFLAGS} -lstdc++ $(pkg-config --libs vapoursynth fftw3) -o lib${_plug}.so EntryPoint.o" > Makefile
}

build() {
  cd "${_plug}"
  make
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
}
