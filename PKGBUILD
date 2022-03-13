# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bilateralgpu
pkgname=vapoursynth-plugin-${_plug}-git
pkgver=8.5.g5b10bd2
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BilateralGPU'
license=('MIT')
depends=('vapoursynth'
         'nvidia-utils'
         )
makedepends=('git'
             'cmake'
             'cuda'
             )
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-BilateralGPU.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d r)"
}

build() {
  source /etc/profile.d/cuda.sh

  cmake -S "${_plug}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib/vapoursynth \
    -DCMAKE_SKIP_RPATH=ON \
    -DVAPOURSYNTH_INCLUDE_DIRECTORY="$(pkg-config --cflags vapoursynth | sed 's|-I||g')" \
    -DCMAKE_CUDA_FLAGS="--threads 0 --use_fast_math -Wno-deprecated-gpu-targets" \
    -DUSE_NVRTC_STATIC=ON

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"
  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
