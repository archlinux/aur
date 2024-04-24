# Maintainer: wuxxin <wuxxin@gmail.com>

# env vars for build steering, eg. to only build for cpu, set _ENABLE_CUDA and _ENABLE_ROCM to 0
_ENABLE_CPU=${_ENABLE_CPU:-1}
_ENABLE_CUDA=${_ENABLE_CUDA:-1}
_ENABLE_ROCM=${_ENABLE_ROCM:-1}
# if GPU_TARGETS and AMDGPU_TARGETS are not set, populate build architecture list from arch:python-pytorch@2.2.2-3
_AMDGPU_TARGETS="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102"
if test -n "$GPU_TARGETS"; then _AMDGPU_TARGETS="$GPU_TARGETS"; fi
if test -n "$AMDGPU_TARGETS"; then _AMDGPU_TARGETS="$AMDGPU_TARGETS"; fi
# available GO_TAGS (use space as seperator): tts tinydream stablediffusion
_GO_TAGS="${_GO_TAGS:-}"
_OPTIONAL_GRPC="${_OPTIONAL_GRPC:-}"
# optional args for main Makefile calling
_OPTIONAL_MAKE_ARGS="${_OPTIONAL_MAKE_ARGS:-}"
# limit external sources to llama.cpp, go-piper, whisper.cpp, go-bert and go-tiny-dream and submodules
# disabled sources: sources/go-llama.cpp sources/gpt4all sources/go-rwkv.cpp sources/go-stable-diffusion sources/go-bert
_EXTERNAL_SOURCES="${_EXTERNAL_SOURCES:-backend/cpp/llama/llama.cpp sources/go-piper sources/whisper.cpp sources/go-tiny-dream}"
if test -n "$(echo "$_GO_TAGS" | grep -o "tts")"; then
  _OPTIONAL_GRPC="backend-assets/grpc/piper $_OPTIONAL_GRPC"
fi
if test -n "$(echo "$_GO_TAGS" | grep -o "stablediffusion")"; then
  _OPTIONAL_GRPC="backend-assets/grpc/stablediffusion $_OPTIONAL_GRPC"
fi
if test -n "$(echo "$_GO_TAGS" | grep -o "tinydream")"; then
  _OPTIONAL_GRPC="backend-assets/grpc/tinydream $_OPTIONAL_GRPC"
fi
# backends to be build: llama-cpp, local-store, whisper
# disabled backends: all python, bert-embeddings llama-ggml gpt4all rwkv 
_GRPC_BACKENDS="$_OPTIONAL_GRPC backend-assets/grpc/llama-cpp backend-assets/grpc/local-store backend-assets/grpc/whisper"
_pkgname="localai"

pkgbase="${_pkgname}-git"
pkgname=()
pkgver=2.12.3.112.g9dbd217c
pkgrel=1
pkgdesc="Self-hosted OpenAI API alternative - Open Source, community-driven and local-first."
url="https://github.com/mudler/LocalAI"
license=('MIT')
arch=('x86_64')

provides=('localai' "local-ai=${pkgver}")
conflicts=('localai' 'local-ai')

depends=(
  'grpc'
)
makedepends=(
  'go'
  'git'
  'cmake'
  'protoc-gen-go'
  'protoc-gen-go-grpc'
  'opencv'
  'blas-openblas'
  'sdl2'
  'ffmpeg'
)

if test "$(echo "$_GO_TAGS" | grep -o "tts")" = "tts"; then
  depends+=(
    'onnxruntime'
  )
  makedepends+=(
    'onnxruntime'
    'libucd-git'
  )
fi

if [[ $_ENABLE_CPU = 1 ]]; then
  pkgname+=("${pkgbase}")
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
)

sha256sums=(
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"
  (git describe --always --tags | tr "-" "." | tail -c +2)
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  # display config
  echo "_ENABLE_CPU=$_ENABLE_CPU"
  echo "_ENABLE_CUDA=$_ENABLE_CUDA"
  echo "_ENABLE_ROCM=$_ENABLE_ROCM"
  echo "_GO_TAGS=$_GO_TAGS"
  echo "_OPTIONAL_MAKE_ARGS=$_OPTIONAL_MAKE_ARGS"
  echo "_EXTERNAL_SOURCES=$_EXTERNAL_SOURCES"
  echo "_OPTIONAL_GRPC=$_OPTIONAL_GRPC"
  echo "_GRPC_BACKENDS=$_GRPC_BACKENDS"

  # modify get-sources
  sed -ri "s#get-sources: .*#get-sources: $_EXTERNAL_SOURCES#g" Makefile

  # remove go mod edits for inactive backend sources
  sed -ri 's#.+\-replace github.com/nomic-ai/gpt4all/gpt4all.+##g' Makefile
  sed -ri 's#.+\-replace github.com/donomii/go-rwkv.cpp.+##g' Makefile
  sed -ri 's#.+\-replace github.com/go-skynet/go-llama.cpp.+##g' Makefile
  sed -ri 's#.+\-replace github.com/go-skynet/go-bert.cpp.+##g' Makefile
  sed -ri 's#.+\-replace github.com/mudler/go-stable-diffusion.+##g' Makefile

  # verbose output of find
  # sed -ri 's#^([\t ]+)(LLAMA_VERSION=.+-C backend/cpp/llama grpc-server[\t ]*)#\1CMAKE_ARGS="${CMAKE_ARGS} --debug-find" \2##g' Makefile

  # fetch sources of backends to be recursive git checked out before build()
  mkdir -p "sources"
  make $_OPTIONAL_MAKE_ARGS $_EXTERNAL_SOURCES

  # fix piper build
  mkdir -p "sources/go-piper/piper-phonemize/pi/lib"
  touch "sources/go-piper/piper-phonemize/pi/lib/keep"
  sed -ri 's#(\$\(MAKE\) -C sources/go-piper libpiper_binding.a) example/main#\1#g' Makefile

  # # fix stablediffusion
  # sed -ri "s/^(#include <ncnn\/)(benchmark|net)(\.h>)/\1src\/\2\3/g" \
  #   sources/go-stable-diffusion/stablediffusion.hpp

  # copy for different build types
  cd "${srcdir}"
  for n in "${_pkgname}-cpu" "${_pkgname}-cuda" "${_pkgname}-rocm"; do
    if test -d "$n"; then rm -rf "$n"; fi
    cp -r "${_pkgname}" "$n"
  done

  # ROCM fixes
  cd "${srcdir}/${_pkgname}-rocm"
  # fix build error on ROCM by removing unsupported cf-protection from CMAKE_CXX_FLAGS
  sed -i '1s/^/string(REPLACE "-fcf-protection" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")\n/' \
    backend/cpp/llama/llama.cpp/CMakeLists.txt
  # fix --offload-arch for multiple GPU_TARGETS, makefile does "," splitting, data is ";"
  #   also: --ofload-arch is deprecated, replace it with -DGPU_TARGETS
  for i in backend/cpp/llama/llama.cpp/Makefile sources/whisper.cpp/Makefile; do
    sed -ri 's/^(.+HIPFLAGS.+\+=).+offload-arch=.+$/\1 -DGPU_TARGETS="$(GPU_TARGETS)"/g' "$i"
  done
}

_build() {
  if test -n "$(echo "$_GO_TAGS" | grep -o "stablediffusion")"; then
    make BUILD_TYPE="$1" GRPC_BACKENDS="backend-assets/grpc/stablediffusion" GO_TAGS="$_GO_TAGS" $_OPTIONAL_MAKE_ARGS build
  fi
  make BUILD_TYPE="$1" GRPC_BACKENDS="$_GRPC_BACKENDS" GO_TAGS="$_GO_TAGS" $_OPTIONAL_MAKE_ARGS build
}

build() {
  if [[ $_ENABLE_CPU = 1 ]]; then
    cd "${srcdir}/${_pkgname}-cpu"
    _build openblas
  fi

  if [[ $_ENABLE_CUDA = 1 ]]; then
    cd "${srcdir}/${_pkgname}-cuda"
    export CUDA_HOME="${CUDA_HOME:-/opt/cuda}"
    export PATH="$CUDA_HOME/bin:$PATH"
    MAGMA_HOME="$CUDA_HOME/targets/x86_64-linux" CUDA_LIBPATH="$CUDA_HOME/lib64/" \
      _build cublas
  fi

  if [[ $_ENABLE_ROCM = 1 ]]; then
    cd "${srcdir}/${_pkgname}-rocm"
    export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
    export PATH="$ROC_HOME/bin:$PATH"
    MAGMA_HOME="$ROCM_HOME" AMDGPU_TARGETS="$_AMDGPU_TARGETS" GPU_TARGETS="$_AMDGPU_TARGETS" \
      _build hipblas
  fi
}

_package_install() {
  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}

package_localai-git() {
  cd "${srcdir}/${_pkgname}-cpu"
  depends+=('openblas')
  _package_install
}

package_localai-git-cuda() {
  cd "${srcdir}/${_pkgname}-cuda"
  pkgdesc+=' (with CUDA support)'
  depends+=('cuda')
  _package_install
}

package_localai-git-rocm() {
  cd "${srcdir}/${_pkgname}-rocm"
  pkgdesc+=' (with ROCM support)'
  depends+=('rocm-hip-runtime' 'hipblas' 'rocblas')
  _package_install
}
