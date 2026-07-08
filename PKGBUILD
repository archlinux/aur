# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Fangjian Jin <askme@163.com>

_repo_name=transcribe.cpp
pkgname=transcribe-cpp-vulkan
pkgver=0.1.2
pkgrel=1
pkgdesc='C/C++ speech-to-text inference library and CLI based on ggml (Vulkan)'
arch=('x86_64')
url="https://github.com/handy-computer/${_repo_name}"
license=('MIT')
depends=(
	gcc-libs
	ggml-vulkan
	glibc
	vulkan-icd-loader
)
makedepends=(
	cmake
	shaderc
	spirv-headers
	vulkan-headers
)
conflicts=('transcribe.cpp')
optdepends=(
  'ffmpeg: convert audio to 16 kHz mono WAV'
  'sox: convert audio to 16 kHz mono WAV'
)
source=(
  "${url}/archive/refs/tags/v${pkgver}.tar.gz"
  'system-ggml.patch'
)
sha256sums=('f5644af5eb639a8342995c9064019936ff7f8cf50727658a7df40f3198e2b9b2'
            '4fcd78b8c84d3982eddfa32770d919fc961264dee319cca9a97e11fbaee89d32')

prepare() {
  patch -Np1 -d "${_repo_name}-${pkgver}" < system-ggml.patch
}

build() {
  # Vulkan is enabled by the system ggml-vulkan
  cmake -S "${_repo_name}-${pkgver}" -B build \
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

  install -Dm644 "${_repo_name}-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${_repo_name}/LICENSE"
  install -Dm644 "${_repo_name}-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${_repo_name}/README.md"
}
