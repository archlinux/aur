# Maintainer: Fangjian Jin <askme@163.com>

pkgname=transcribe.cpp
pkgver=0.1.3
pkgrel=1
pkgdesc='C/C++ speech-to-text inference library and CLI based on ggml'
arch=('x86_64' 'aarch64')
url='https://github.com/handy-computer/transcribe.cpp'
license=('MIT')
depends=('gcc-libs' 'glibc')
makedepends=('cmake' 'ninja')
optdepends=(
  'ffmpeg: convert audio to 16 kHz mono WAV'
  'sox: convert audio to 16 kHz mono WAV'
)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('a7baabcb365b7b9f049bba1eb6d2da56ccc5874eee41cde238e3ef3eee742bc1')

build() {
  cmake -S "${pkgname}-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTRANSCRIBE_BUILD_TESTS=OFF \
    -DTRANSCRIBE_BUILD_TOOLS=ON \
    -DTRANSCRIBE_BUILD_SHARED=OFF \
    -DTRANSCRIBE_X86_CONSERVATIVE=ON \
    -Wno-dev

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -Dm755 build/bin/transcribe-cli "${pkgdir}/usr/bin/transcribe-cli"

  if [[ -x build/bin/transcribe-quantize ]]; then
    install -Dm755 build/bin/transcribe-quantize "${pkgdir}/usr/bin/transcribe-quantize"
  fi

  if [[ -x build/bin/transcribe-bench ]]; then
    install -Dm755 build/bin/transcribe-bench "${pkgdir}/usr/bin/transcribe-bench"
  fi

  install -Dm644 "${pkgname}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${pkgname}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
