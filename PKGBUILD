# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bm3dcuda
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=R2.4.15.g9f7b3c1
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BM3DCUDA'
license=('GPL')
depends=('vapoursynth'
         'fftw'
         )
makedepends=('git'
             'cmake'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-BM3DCUDA.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - .)"
}

prepare() {
  mkdir -p build
}

build() {
  cd build
  CXXFLAGS+=" $(pkg-config --cflags vapoursynth)" cmake ../bm3dcuda \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package(){
  install -Dm755 build/cpu_source/libbm3dcpu.so "${pkgdir}/usr/lib/vapoursynth/libbm3dcpu.so"
  install -Dm755 build/source/libbm3dcuda.so  "${pkgdir}/usr/lib/vapoursynth/libbm3dcuda.so"
  install -Dm755 build/rtc_source/libbm3dcuda_rtc.so "${pkgdir}/usr/lib/vapoursynth/libbm3dcuda_rtc.so"

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
