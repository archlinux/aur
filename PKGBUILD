# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Fangjian Jin <askme@163.com>

_repo_name=transcribe.cpp
pkgname=transcribe-cpp-vulkan
pkgver=0.1.1
pkgrel=1
pkgdesc='C/C++ speech-to-text inference library and CLI based on ggml (Vulkan)'
arch=('x86_64')
url="https://github.com/handy-computer/${_repo_name}"
license=('MIT')
depends=(
	gcc-libs
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
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('d7013ba597385420cf7436282b166968998399d5f5a0d5b1ac738f24ff2c30ab')

build() {
  cmake -S "${_repo_name}-${pkgver}" -B build \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DTRANSCRIBE_BUILD_TESTS=OFF \
    -DTRANSCRIBE_BUILD_TOOLS=ON \
    -DTRANSCRIBE_BUILD_SHARED=OFF \
    -DTRANSCRIBE_X86_CONSERVATIVE=ON \
    -DTRANSCRIBE_VULKAN=ON \
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
