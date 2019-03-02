# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=fftspectrum
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r1.1.g0fe5160
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/Beatrice-Raws/FFTSpectrum'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/Beatrice-Raws/FFTSpectrum.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  cd "${_plug}"

  sed -e 's|"vapoursynth/VapourSynth.h"|<VapourSynth.h>|g' \
      -e 's|"vapoursynth/VSHelper.h"|<VSHelper.h>|g' \
      -e 's|"fftw3.h"|<fftw3.h>|g' \
      -i FFTSpectrum.c

  echo "all:
	  gcc -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) -o FFTSpectrum.o FFTSpectrum.c
	  gcc -shared $(pkg-config --libs fftw3f) -fPIC ${LDFLAGS} -o lib${_plug}.so FFTSpectrum.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package(){
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
