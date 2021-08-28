# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bilateralgpu
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=r6.3.g69af543
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BilateralGPU'
license=('GPL')
depends=('vapoursynth'
         'cuda'
         )
makedepends=('git'
             'cmake'
             'gcc10'
             )
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
  mkdir -p build
}

build() {
  cd "${_plug}/build"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CUDA_FLAGS="--threads 0 --use_fast_math -Wno-deprecated-gpu-targets" \
    -DCMAKE_CUDA_HOST_COMPILER=/usr/bin/gcc-10 \
    -DVAPOURSYNTH_INCLUDE_DIRECTORY=/usr/include/vapoursynth \
    -DCMAKE_SKIP_RPATH=ON

  make
}

package() {
  cd "${_plug}"
  install -Dm755 "build/source/lib${_plug}.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}.so"
  install -Dm755 "build/rtc_source/lib${_plug}_rtc.so" "${pkgdir}/usr/lib/vapoursynth/lib${_plug}_rtc.so"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
}
