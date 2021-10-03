# Maintainer:  Gustavo Alvarez <sl1pkn07@gmail.com>

_plug=eedi2cuda
pkgbase="foosynth-plugin-${_plug}-git"
pkgname=("avisynth-plugin-${_plug}-git"
         "vapoursynth-plugin-${_plug}-git"
         )
pkgver=1.10.g3f4e137
pkgrel=1
pkgdesc="Plugin for Vapoursynth/Avisynth: ${_plug} (Dual interface for Vapoursynth/Avisynth) (GIT version)"
arch=('x86_64')
url='https://github.com/AmusementClub/VapourSynth-EEDI2CUDA.git'
license=('GPL')
makedepends=('git'
             'cmake'
             'avisynthplus'
             'vapoursynth'
             'tbb'
             'cuda'
             )
source=("${_plug}::git+https://github.com/AmusementClub/VapourSynth-EEDI2CUDA.git"
        'git+https://github.com/boostorg/sync.git'
        )
sha256sums=('SKIP'
            'SKIP'
            )

pkgver() {
  cd "${_plug}"
  echo "$(git describe --long --tags | tr - . | sed 's|M2u1test||')"
}

prepare() {
  cd "${_plug}"
  mkdir -p build-{vs,avs}
}

build() {

  cd "${srcdir}/${_plug}/build-vs"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_AVISYNTHPLUS_BINDING=OFF \
    -DCMAKE_CUDA_FLAGS_RELEASE="-O2 -DNDEBUG -I${srcdir}/sync/include"

  make

  cd "${srcdir}/${_plug}/build-avs"
  cmake .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DENABLE_VAPOURSYNTH_API3_BINDING=OFF \
    -DENABLE_VAPOURSYNTH_API4_BINDING=OFF \
    -DCMAKE_CUDA_FLAGS_RELEASE="-O2 -DNDEBUG -I${srcdir}/sync/include"

  make
}

package_avisynth-plugin-eedi2cuda-git() {
  pkgdesc="Plugin for Avisynth: ${_plug} (GIT version)"
  depends=('avisynthplus')
  provides=("avisynth-plugin-${_plug}")
  conflicts=("avisynth-plugin-${_plug}")

  install -Dm644 "${_plug}/build-avs/libEEDI2CUDA.so" "${pkgdir}/usr/lib/avisynth/libEEDI2CUDA.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/avisynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_vapoursynth-plugin-eedi2cuda-git() {
  pkgdesc="Plugin for Vapoursynth: ${_plug} (GIT version)"
  depends=('vapoursynth')
  provides=("vapoursynth-plugin-${_plug}")
  conflicts=("vapoursynth-plugin-${_plug}")

  install -Dm644 "${_plug}/build-vs/libEEDI2CUDA.so" "${pkgdir}/usr/lib/vapoursynth/libEEDI2CUDA.so"
  install -Dm644 "${_plug}/README.md" "${pkgdir}/usr/share/doc/vapoursynth/plugins/${_plug}/README.md"

  install -Dm644 "${_plug}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
