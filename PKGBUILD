# Maintainer: Bink
# Contributor: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-cuda"
pkgver=1.8.5
pkgrel=1
pkgdesc="High-performance inference of OpenAI's Whisper automatic speech recognition (ASR) model (with NVIDIA CUDA optimizations)"
arch=('aarch64' 'x86_64')
url="https://github.com/ggml-org/whisper.cpp"
license=("MIT")
depends=('ffmpeg' 'libggml-cuda-git' 'nvidia-utils' 'sdl2-compat')
optdepends=(
  'openblas: CPU-accelerated matrix ops (only if system ggml was built with BLAS)'
)
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
makedepends=(
  'cmake'
  'ninja'
)
source=(
  "${_pkgbase}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable-deprecated.patch
)
sha256sums=('cd702189cb5e608c8bc487f4b151db593c4455925b37cc06ef76b44861911db1'
            '5f880edae417c7083a9403260e5c381285e4c52ccc39f127c6510fdfa249c1ad')
b2sums=('926be7f4b073b12a6a224cf93b311235496857f828f121345a03047d8853a10bfb79bf0d8cf0037f2e5b05ee7bb6a7b3080db69e2aa2dc94496d8710cb9b3d23'
        '578d36bdb1749b846ea96c76bf42871bea1c6ce3a3eee3670a121361c71ae09b0bf36179880fc4f0e752d09a0adc5bee1304a1e570cd6dc3e9a84662dd2fd899')

prepare() {
  cd "${srcdir}/${_pkgbase}-${pkgver}"
  patch -Np1 -i "${srcdir}/disable-deprecated.patch"
}

build() {
  cmake \
    -G Ninja \
    -B "${srcdir}/build" \
    -S "${srcdir}/${_pkgbase}-${pkgver}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DWHISPER_FFMPEG=ON \
    -DWHISPER_SDL2=ON \
    -DWHISPER_BUILD_TESTS=OFF \
    -DWHISPER_USE_SYSTEM_GGML=ON \
    -Wno-dev

  cmake --build "${srcdir}/build"
}

package() {
  DESTDIR="${pkgdir}" cmake --install "${srcdir}/build"

  # wchess is built but has no upstream cmake install() rule
  install -Dm755 "${srcdir}/build/bin/wchess" "${pkgdir}/usr/bin/wchess"

  install -Dm644 "${srcdir}/${_pkgbase}-${pkgver}/LICENSE" \
    -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
