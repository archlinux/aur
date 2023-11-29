# Maintainer: wuxxin <wuxxin@gmail.com>

_ENABLE_CUDA=0
_ENABLE_ROCM=1
_GO_TAGS=""
# _GO_TAGS="tts stablediffusion"
_OPTIONAL_BACKENDS=""
if test "$(echo "$_GO_TAGS" | grep -o "tts")" = "tts"; then
  _OPTIONAL_BACKENDS="backend-assets/grpc/piper $_OPTIONAL_BACKENDS"
fi
if test "$(echo "$_GO_TAGS" | grep -o "stablediffusion")" = "stablediffusion"; then
  _OPTIONAL_BACKENDS="backend-assets/grpc/stablediffusion $_OPTIONAL_BACKENDS"
fi
_GRPC_BACKENDS="backend-assets/grpc/bert-embeddings backend-assets/grpc/llama-cpp backend-assets/grpc/whisper $_OPTIONAL_BACKENDS"
# backend-assets/grpc/rwkv
_pkgname="localai"

pkgbase="${_pkgname}-git"
pkgname=("${pkgbase}")
pkgver=v1.40.0.60.gfd1b7b3
pkgrel=4
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
)
makedepends=(
  'go'
  'git'
  'cmake'
)

if test "$(echo "$_GO_TAGS" | grep -o "tts")" = "tts"; then
  depends+=(
    'onnxruntime'
    'libucd-git'
  )
fi

if [[ $_ENABLE_CUDA = 1 ]]; then
  pkgname+=("${pkgbase}-cuda")
  makedepends+=(
    'cuda'
    'cudnn'
    'nccl'
    'magma-cuda'
  )
fi

if [[ $_ENABLE_ROCM = 1 ]]; then
  pkgname+=("${pkgbase}-rocm")
  makedepends+=(
    'rocm-hip-sdk'
    'miopen-hip'
    'rccl'
    'magma-hip'
  )
fi

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

  # update whisper and add gpu support
  patch -Np1 -i "${srcdir}/whisper-1.5.1.patch"

  # remove sources for inactive backends: go-llama go-llama-ggml go-ggml-transformers gpt4all
  _SOURCES="go-piper go-rwkv whisper.cpp go-bert go-stable-diffusion"
  _SOURCES_PATHS="$(echo "$_SOURCES" | tr " " "\n" | sed -r "s#(.+)#sources/\1#" | tr "\n" " ")"
  sed -ri "s#get-sources: .*#get-sources: backend/cpp/llama/llama.cpp $_SOURCES_PATHS#g" Makefile
  sed -ri 's#.+\-replace github.com/nomic-ai/gpt4all/gpt4all.+##g' Makefile
  sed -ri 's#.+\-replace github.com/go-skynet/go-ggml-transformers.cpp.+##g' Makefile

  # fetch sources for active backends
  mkdir -p "sources"
  make $_SOURCES_PATHS

  # copy for different build types
  cd "${srcdir}"
  for n in "${_pkgname}-cpu" "${_pkgname}-cuda" "${_pkgname}-rocm"; do
    if test -d "$n"; then rm -rf "$n"; fi
    cp -r "${_pkgname}" "$n"
  done
}

pkgver() {
  cd "${srcdir}/../${_pkgname}"
  echo "$(git describe --always --tags | tr "-" ".")"
}

build() {
  cd "${srcdir}/${_pkgname}-cpu"
  make BUILD_TYPE="openblas" GRPC_BACKENDS="$_GRPC_BACKENDS" GO_TAGS="$_GO_TAGS" build

  if [[ $_ENABLE_ROCM = 1 ]]; then
    cd "${srcdir}/${_pkgname}-rocm"
    export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
    export PATH="$ROC_HOME/bin:$PATH"
    if test -n "$GPU_TARGETS"; then
      _AMDGPU_TARGETS="$GPU_TARGETS"
    else
      _AMDGPU_TARGETS="${AMDGPU_TARGETS:-gfx900;gfx906;gfx908;gfx90a;gfx1030;gfx1100;gfx1101;gfx1102}"
    fi
    MAGMA_HOME="$ROCM_HOME" AMDGPU_TARGETS="$_AMDGPU_TARGETS" GPU_TARGETS="$_AMDGPU_TARGETS" \
      make BUILD_TYPE="hipblas" GRPC_BACKENDS="$_GRPC_BACKENDS" GO_TAGS="$_GO_TAGS" build
  fi

  if [[ $_ENABLE_CUDA = 1 ]]; then
    cd "${srcdir}/${_pkgname}-cuda"
    export CUDA_HOME="${CUDA_HOME:-/opt/cuda}"
    export PATH="$CUDA_HOME/bin:$PATH"
    MAGMA_HOME="$CUDA_HOME/targets/x86_64-linux" \
      make BUILD_TYPE="cublas" GRPC_BACKENDS="$_GRPC_BACKENDS" GO_TAGS="$_GO_TAGS" build
  fi
}

package_localai-git() {
  cd "${srcdir}/${_pkgname}-cpu"

  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

package_localai-git-rocm() {
  cd "${srcdir}/${_pkgname}-rocm"

  pkgdesc+=' (with ROCM support)'
  depends+=('rocm-hip-runtime')

  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}

package_localai-git-cuda() {
  cd "${srcdir}/${_pkgname}-cuda"

  pkgdesc+=' (with CUDA support)'
  depends+=('cuda')

  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
