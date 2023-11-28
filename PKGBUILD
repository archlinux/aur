# Maintainer: wuxxin <wuxxin@gmail.com>

_ENABLE_CUDA=0
_ENABLE_ROCM=0
# _GOTAGS="tts stablediffusion"
_GRPC_BACKENDS="backend-assets/grpc/bert-embeddings backend-assets/grpc/llama-cpp backend-assets/grpc/whisper"
# backend-assets/grpc/rwkv
if test -n "$GPU_TARGETS"; then _AMDGPU_TARGETS="$GPU_TARGETS"; fi
_AMDGPU_TARGETS="${AMDGPU_TARGETS:-gfx900;gfx906;gfx908;gfx90a;gfx1030;gfx1100;gfx1101;gfx1102}"
_pkgname="localai"

pkgbase="${_pkgname}-git"
pkgname=("${pkgbase}")
pkgver=v1.40.0.60.gfd1b7b3
pkgrel=2
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
  'onnxruntime'
)
makedepends=(
  'go'
  'git'
  'cmake'
)

if [[ $_ENABLE_CUDA = 1 ]]; then
  pkgname+=("${pkgbase}-cuda")
  makedepends+=(
    'cuda'
    'cudnn'
    'nccl'
  )
fi

if [[ $_ENABLE_ROCM = 1 ]]; then
  pkgname+=("${pkgbase}-rocm")
  makedepends+=(
    'rocm-hip-sdk'
    'miopen-hip'
    'rccl'
  )
fi

source=(
  "${_pkgname}"::"git+https://github.com/mudler/LocalAI"
  "whisper-1.5.1.patch"
)
# "go-piper"::"git+https://github.com/mudler/go-piper"
# "go-rwkv"::"git+https://github.com/donomii/go-rwkv.cpp"
# "whisper.cpp"::"git+https://github.com/ggerganov/whisper.cpp.git"
# "go-bert"::"git+https://github.com/go-skynet/go-bert.cpp"
# "go-stable-diffusion"::"git+https://github.com/mudler/go-stable-diffusion"

sha256sums=(
  'SKIP'
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"

  # update whisper and add gpu support
  patch -Np1 -i "${srcdir}/whisper-1.5.1.patch"

  # move backend_data to /usr/share
  sed -ri "s#/tmp/localai/backend_data#/usr/share/${_pkgname}#g" main.go

  # remove unbuild sources go-llama go-llama-ggml go-ggml-transformers gpt4all
  _SOURCES="go-piper go-rwkv whisper.cpp go-bert go-stable-diffusion"
  _SOURCES_PATHS="$(echo "$_SOURCES" | tr " " "\n" | sed -r "s#(.+)#sources/\1#" | tr "\n" " ")"
  sed -ri "s#get-sources: .*#get-sources: backend/cpp/llama/llama.cpp $_SOURCES_PATHS#g" Makefile
  sed -ri 's#.+\-replace github.com/nomic-ai/gpt4all/gpt4all.+##g' Makefile
  sed -ri 's#.+\-replace github.com/go-skynet/go-ggml-transformers.cpp.+##g' Makefile
  # fix not building hash
  # sed -ri 's#CPPLLAMA_VERSION\?=3e73d31d9cc0232882ce61c64742aff3ecfec416#CPPLLAMA_VERSION?=64e64aa2557d97490b2fe1262b313e2f4a1607e3#g' Makefile

  mkdir -p "sources"
  make $_SOURCES_PATHS

  # clone for different build types
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
  make CPPLLAMA_VERSION="$_CPPLLAMA_VERSION" BUILD_TYPE="openblas" GRPC_BACKENDS="$_GRPC_BACKENDS" GOTAGS="$_GOTAGS" prepare build

  if [[ $_ENABLE_ROCM = 1 ]]; then
    cd "${srcdir}/${_pkgname}-rocm"
    AMDGPU_TARGETS="$_AMDGPU_TARGETS" GPU_TARGETS="$_AMDGPU_TARGETS" \
      make CPPLLAMA_VERSION="$_CPPLLAMA_VERSION" BUILD_TYPE="hipblas" GRPC_BACKENDS="$_GRPC_BACKENDS" GOTAGS="$_GOTAGS" prepare build
  fi
  if [[ $_ENABLE_CUDA = 1 ]]; then
    cd "${srcdir}/${_pkgname}-cuda"
    make CPPLLAMA_VERSION="$_CPPLLAMA_VERSION" BUILD_TYPE="cublas" GRPC_BACKENDS="$_GRPC_BACKENDS" GOTAGS="$_GOTAGS" prepare build
  fi
}

package_localai-git() {
  cd "${srcdir}/${_pkgname}-cpu"

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

package_localai-git-cuda() {
  cd "${srcdir}/${_pkgname}-cuda"

  pkgdesc+=' (with CUDA support)'
  depends+=('cuda')

  install -Dm755 "local-ai" "${pkgdir}/usr/bin/local-ai"
  # install -D backend-assets/espeak-ng-data -t "${pkgdir}/usr/share/${_pkgname}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgname}"
}
