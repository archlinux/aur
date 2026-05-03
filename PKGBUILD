# Maintainer: Bink
# Contributor: robertfoster

_pkgbase=whisper.cpp
pkgname="${_pkgbase}-cuda"
pkgver=1.8.4
pkgrel=2
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
sha256sums=('b26f30e52c095ccb75da40b168437736605eb280de57381887bf9e2b65f31e66'
            '5f880edae417c7083a9403260e5c381285e4c52ccc39f127c6510fdfa249c1ad')
b2sums=('d2f208733a8b6dfeb0692c84149ddf373df23a0082a522d8e0047c268dceb066ee968c07086996da0d08eec6f7b08ab2c1cf6a7e2b0054ef71811bf72ce5d1a1'
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
