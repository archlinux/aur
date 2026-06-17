# Maintainer: Bink
# Contributor: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-cuda"
pkgver=1.9.0
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
sha256sums=('58252617f539320c42f8f40052433bce0556f78977d3f47f0ddcfe31a4722146'
            '5f880edae417c7083a9403260e5c381285e4c52ccc39f127c6510fdfa249c1ad')
b2sums=('a837f6c70472b6a893f38f272e4ba42ce4db4a684318b718fae3cc4e7d3f179973162a6504cbdfd4e8314239d9788f438de052f2ad6628f7af15675a6276059c'
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
