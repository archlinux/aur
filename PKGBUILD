# Maintainer: wuxxin <wuxxin@gmail.com>

_pkgname="localai"
pkgbase="${_pkgname}-git"
pkgname=("${pkgbase}")
# "${pkgbase}-rocm"
pkgver="v1.40.0.58.gb782136"
pkgrel=1
pkgdesc="The free, Open Source OpenAI alternative. Self-hosted, community-driven and local-first."
url="https://github.com/mudler/LocalAI"
license=('MIT')
arch=('x86_64')

provides=('localai')
conflicts=('localai')

depends=(
  'ffmpeg'
  'opencv'
  'blas-openblas'
  # 'onnxruntime'
)
makedepends=(
  'go'
  'git'
  'cmake'
  # 'rocm-hip-sdk'
)

source=(
  "${_pkgname}"::"git+https://github.com/mudler/LocalAI"
  "whisper-1.5.1.patch"
)

sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  patch -Np1 -i "${srcdir}/whisper-1.5.1.patch"
  sed -ri "s#/tmp/localai/backend_data#/usr/share/${_pkgname}#g" main.go

  # OPTIONAL_GRPC="backend-assets/grpc/piper"
  # GOTAGS="tts"
  GRPC_BACKENDS="backend-assets/grpc/langchain-huggingface backend-assets/grpc/bert-embeddings backend-assets/grpc/llama-cpp backend-assets/grpc/gpt4all backend-assets/grpc/dolly backend-assets/grpc/rwkv backend-assets/grpc/whisper $OPTIONAL_GRPC"
  make GRPC_BACKENDS="$GRPC_BACKENDS" GOTAGS="$GOTAGS" prepare

  cd "${srcdir}"
  cp -r "${_pkgname}" "${_pkgname}-rocm"

  cd "${srcdir}/${_pkgname}-rocm"

  if test -z "$AMDGPU_TARGETS"; then
    if test -z "$GPU_TARGETS"; then
      GPU_TARGETS='gfx900;gfx906;gfx908;gfx90a;gfx1030;gfx1100;gfx1101;gfx1102'
    fi
  else
    GPU_TARGETS="$AMDGPU_TARGETS"
  fi

}

pkgver() {
  cd "${srcdir}/../${_pkgname}"
  echo "$(git describe --always --tags | tr "-" ".")"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make BUILD_TYPE="openblas" GRPC_BACKENDS="$GRPC_BACKENDS" GOTAGS="$GOTAGS" build

  # cd "${srcdir}/${_pkgname}-rocm"
  # GPU_TARGETS="$GPU_TARGETS" \
  #   make BUILD_TYPE="hipblas" GRPC_BACKENDS="$GRPC_BACKENDS" GOTAGS="$GOTAGS" build
}

package_localai-git() {
  cd "${srcdir}/${_pkgname}"

  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  # install -D backend-assets/espeak-ng-data -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

package_localai-git-rocm() {
  cd "${srcdir}/${_pkgname}-rocm"

  pkgdesc+=' (with ROCM support)'
  depends+=('rocm-hip-runtime')

  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  # install -D backend-assets/espeak-ng-data -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
