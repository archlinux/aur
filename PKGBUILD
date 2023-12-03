# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=bm3dcuda
pkgname="vapoursynth-plugin-${_plug}-git"
pkgver=2.14.1.ga9dcda9
pkgrel=1
pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
arch=('x86_64')
url='https://github.com/WolframRhodium/VapourSynth-BM3DCUDA'
license=('GPL')
depends=('vapoursynth')
makedepends=(
  'git'
  'cmake'
  'cuda'
)
optdepends=(
  'cuda: CUDA support'
  'nvidia-utils: CUDA support'
)
provides=("vapoursynth-plugin-${_plug}")
conflicts=("vapoursynth-plugin-${_plug}")
source=("${_plug}::git+https://github.com/WolframRhodium/VapourSynth-BM3DCUDA.git")
sha256sums=('SKIP')
options=('debug')

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | tr -d R | sed 's|test.||g')"
}

build() {

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
}
