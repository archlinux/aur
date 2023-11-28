# Maintainer: wuxxin <wuxxin@gmail.com>

_pkgname="localai"
pkgbase="${_pkgname}-git"
pkgname=("${pkgbase}" "${pkgbase}-rocm")
pkgver="944.20d637e"
pkgrel=1
pkgdesc="The free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first."
url="https://github.com/mudler/LocalAI"
license=('MIT')
arch=('x86_64')

depends=('ffmpeg' 'opencv' 'blas-openblas')
makedepends=('go' 'git' 'cmake' 'ffmpeg' 'opencv' 'blas-openblas' 'rocm-hip-sdk')
provides=("localai=${pkgver}" 'localai')
conflicts=('localai')
source=("${_pkgname}"::"git+https://github.com/mudler/LocalAI"
  "whisper-gpu.patch")
sha256sums=('SKIP'
  'SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  make prepare

  cd "${srcdir}"
  cp -r "${_pkgname}" "${_pkgname}-rocm"

  cd "${srcdir}/${_pkgname}-rocm"
  patch -Np1 -i "${srcdir}/whisper-gpu.patch"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make BUILD_TYPE="openblas" GOTAGS="tts" build

  cd "${srcdir}/${_pkgname}-rocm"
  GPU_TARGETS='gfx900;gfx906;gfx908;gfx90a;gfx1030;gfx1100;gfx1101;gfx1102' \
    make BUILD_TYPE="hipblas" GOTAGS="tts" build
}

package_localai-git() {
  cd "${_pkgname}-${pkgver}"

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

package_localai-git-rocm() {
  cd "${_pkgname}-${pkgver}-rocm"

  pkgdesc+=' (with ROCM support)'
  depends+=('rocm-hip-runtime')

  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
