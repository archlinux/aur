# Maintainer: Joy Jasper <0x73757375@gmail.com>

pkgname=alphallama-cuda-bin
pkgver=2.0.12
pkgrel=1
pkgdesc='Fast local MoE LLM inference engine with OpenAI-compatible API (prebuilt NVIDIA CUDA 12.8)'
arch=('x86_64')
url='https://github.com/AlphaChat-dotcom/alphallama'
license=('Apache-2.0' 'MIT' 'LicenseRef-NVIDIA-CUDA-EULA')
depends=(
  'gcc-libs'
  'glibc'
)
optdepends=(
  'nvidia-utils: NVIDIA GPU driver (525+, or 570+ for RTX 20/50 series) required for CUDA inference'
)
provides=('alphallama')
conflicts=('alphallama')
options=('!strip' '!debug')
source=(
  "${pkgname}-${pkgver}-${CARCH}.tar.zst::https://github.com/AlphaChat-dotcom/alphallama/releases/download/v${pkgver}/alphallama-v2-linux-x64-cuda12.tar.zst"
)
sha256sums=(
  '8230f3daa7a3afb4696280302b01091fc26e903bbb6d82edc7dedb4a749f37dd'
)

package() {
  local _src="${srcdir}/alphallama-v2-linux-x64-cuda12"

  # Keep bundled binaries and shared libraries together so ELF $ORIGIN RPATH resolves cleanly
  install -dm755 "${pkgdir}/opt/alphallama/bin"
  cp -a "${_src}/bin/." "${pkgdir}/opt/alphallama/bin/"

  # Expose AlphaLlama-specific entrypoints without conflicting with llama.cpp
  install -dm755 "${pkgdir}/usr/bin"
  local _bin
  for _bin in alphallama-serve alphallama alphallama-latest alphachat alphainfer; do
    ln -s "/opt/alphallama/bin/${_bin}" "${pkgdir}/usr/bin/${_bin}"
  done

  # Documentation
  install -Dm644 "${_src}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "${_src}/BUILD_INFO" "${pkgdir}/usr/share/doc/${pkgname}/BUILD_INFO"

  # Licenses (Apache-2.0, MIT, NVIDIA CUDA EULA, and third-party notices)
  install -Dm644 "${_src}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_src}/NOTICE" "${pkgdir}/usr/share/licenses/${pkgname}/NOTICE"
  install -dm755 "${pkgdir}/usr/share/licenses/${pkgname}/licenses"
  cp -a "${_src}/licenses/." "${pkgdir}/usr/share/licenses/${pkgname}/licenses/"
}
