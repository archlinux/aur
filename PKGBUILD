# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bilateralgpu
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r4.4.gc861ec6
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BilateralGPU'
license=('GPL')
depends=('vapoursynth'
         'opencv-cuda'
         )
makedepends=('git')
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-BilateralGPU.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}
prepare() {
  cd "${_plug}"

  sed 's|<vapoursynth/|<|g' -i bilateralGPU/bilateral.cpp

  echo "all:
	  g++ -c -fPIC ${CXXFLAGS} ${CPPFLAGS} -I. $(pkg-config --cflags vapoursynth) $(pkg-config --cflags opencv4) -o bilateral.o bilateralGPU/bilateral.cpp
	  g++ -shared -lopencv_core -lopencv_cudaarithm -lopencv_cudafilters -lopencv_cudaimgproc -lopencv_cudev -lopencv_imgproc -fPIC ${LDFLAGS} -o lib${_plug}.so bilateral.o" > Makefile
}

build() {
  make -C "${_plug}"
}

package() {
  cd "${_plug}"
  install -Dm755 "lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
