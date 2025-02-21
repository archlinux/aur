# Maintainer: wuxxin <wuxxin@gmail.com>

# env vars for build steering
# eg. to only build for cpu, set _ENABLE_CUDA and _ENABLE_ROCM to 0
_ENABLE_CPU=${_ENABLE_CPU:-1}
_ENABLE_CUDA=${_ENABLE_CUDA:-1}
_ENABLE_ROCM=${_ENABLE_ROCM:-1}

# if set to 1 make is called with -j <physical cores> for paralell building, set to 0 for debug
_ENABLE_PARALLEL=${_ENABLE_PARALLEL:-1}

# additional backends
# (ggml.cpp) bark (text2speech) backend
_ENABLE_BARK=${_ENABLE_BARK:-1}
# (go/c/c++ onnx) piper (text2speech) backend
_ENABLE_PIPER=${_ENABLE_PIPER:-1}
# (ggml.cpp) stablediffusion (image generation) backend
_ENABLE_STABLEDIFFUSION=${_ENABLE_STABLEDIFFUSION:-1}
# (ggml.cpp) whisper (speech2text) backend
_ENABLE_WHISPER=${_ENABLE_WHISPER:-1}
# (go onnx) Silero Voice Activation Detection
_ENABLE_SILERO_VAD=${_ENABLE_SILERO_VAD:-1}
# python backends, enables "-python" package flavors
_ENABLE_PYTHON=${_ENABLE_PYTHON:-1}
# will be automatically set on "-python" package flavors
_IS_PYTHON_FLAVOR=0

# if GPU_TARGETS and AMDGPU_TARGETS are not set, mirror architecture list from arch:python-pytorch@2.3.0-2
_AMDGPU_TARGETS="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102"
if test -n "$GPU_TARGETS"; then _AMDGPU_TARGETS="$GPU_TARGETS"; fi
if test -n "$AMDGPU_TARGETS"; then _AMDGPU_TARGETS="$AMDGPU_TARGETS"; fi

# additional optional grpc backends
_OPTIONAL_GRPC="${_OPTIONAL_GRPC:-}"
# additional optional args for main Makefile calling
_OPTIONAL_MAKE_ARGS="${_OPTIONAL_MAKE_ARGS:-}"

# limit pulling external sources
_EXTERNAL_SOURCES="backend/cpp/llama/llama.cpp"
_DISABLED_MOD_EDIT="nomic-ai/gpt4all/gpt4all mudler/go-stable-diffusion \
  go-skynet/go-llama.cpp go-skynet/go-bert.cpp donomii/go-rwkv.cpp M0Rf30/go-tiny-dream"

if [[ $_ENABLE_BARK = 1 ]]; then
  _EXTERNAL_SOURCES="$_EXTERNAL_SOURCES sources/bark.cpp"
  _OPTIONAL_GRPC="backend-assets/grpc/bark-cpp $_OPTIONAL_GRPC"
fi

if [[ $_ENABLE_SILERO_VAD = 1 ]]; then
  _OPTIONAL_GRPC="backend-assets/grpc/silero-vad $_OPTIONAL_GRPC"
fi

if [[ $_ENABLE_STABLEDIFFUSION = 1 ]]; then
  _EXTERNAL_SOURCES="$_EXTERNAL_SOURCES sources/stablediffusion-ggml.cpp"
  _OPTIONAL_GRPC="backend-assets/grpc/stablediffusion-ggml $_OPTIONAL_GRPC"
fi

if [[ $_ENABLE_PIPER = 1 ]]; then
  _EXTERNAL_SOURCES="$_EXTERNAL_SOURCES sources/go-piper"
  _OPTIONAL_GRPC="backend-assets/grpc/piper $_OPTIONAL_GRPC"
  _GO_TAGS="tts"
else
  _DISABLED_MOD_EDIT="$_DISABLED_MOD_EDIT mudler/go-piper"
  _GO_TAGS=""
fi

if [[ $_ENABLE_WHISPER = 1 ]]; then
  _EXTERNAL_SOURCES="$_EXTERNAL_SOURCES sources/whisper.cpp"
  _OPTIONAL_GRPC="backend-assets/grpc/whisper $_OPTIONAL_GRPC"
else
  _DISABLED_MOD_EDIT="$_DISABLED_MOD_EDIT ggerganov/whisper.cpp"
fi


# enabled backends
_GRPC_BACKENDS="backend-assets/grpc/local-store backend-assets/grpc/huggingface \
$_OPTIONAL_GRPC"

_pkgbase="localai"
pkgbase="${_pkgbase}-git"
pkgname=()
pkgver=2.24.0.93.g0eb2911a
pkgrel=2
pkgdesc="Self-hosted OpenAI API alternative - Open Source, community-driven and local-first."
url="https://github.com/mudler/LocalAI"
license=('MIT')
arch=('x86_64')
provides=('localai' "local-ai=${pkgver}")
conflicts=('localai' 'local-ai')
backup=("etc/${_pkgbase}/${_pkgbase}.conf")

source=(
  "${_pkgbase}"::"git+https://github.com/mudler/LocalAI"
  "README.md"
  "${_pkgbase}.conf"
  "${_pkgbase}.service"
  "${_pkgbase}-regen-python.service"
  "${_pkgbase}.tmpfiles"
  "${_pkgbase}.sysusers"
)

sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
  'SKIP'
)

depends=(
  'protobuf'
  'grpc'
)

# system wide dependencies for python backends
_python_depends=(
    'python-protobuf'
    'python-grpcio'
    'python-certifi'
    'python-pillow'
    'python-opencv'
    'python-numpy'
    'python-pytorch'
    'python-torchaudio'
    'python-torchvision'
    'python-transformers'
    'python-sentencepiece'
    'python-peft'
    'python-accelerate'
  )

# python backends and their local dependencies
_python_backends=(
  "bark bark"
  "coqui coqui-tts"
  "diffusers diffusers compel optimum-quanto"
  "parler-tts llvmlite"
  "rerankers rerankers[transformers]"
  "sentencetransformers sentence-transformers"
  "transformers"
  "transformers-musicgen"
  "vall-e-x"
)

makedepends=(
  'go'
  'git'
  'cmake'
  'opencv'
  'openmpi'
  'blas-openblas'
  'sdl2'
  'ffmpeg'
  'upx'
  'protoc-gen-go'
  'protoc-gen-go-grpc'
  'python-protobuf'
  'python-grpcio'
  'python-grpcio-tools'
)

if [[ $_ENABLE_PIPER = 1 ]]; then
  depends+=(
    'espeak-ng'
  )
  makedepends+=(
    'onnxruntime'
    'libucd-git'
  )
fi

if [[ $_ENABLE_CPU = 1 ]]; then
  pkgname+=("${pkgbase}")
  if [[ $_ENABLE_PYTHON = 1 ]]; then
    pkgname+=("${pkgbase}-python")
  fi
fi

if [[ $_ENABLE_CUDA = 1 ]]; then
  pkgname+=("${pkgbase}-cuda")
  if [[ $_ENABLE_PYTHON = 1 ]]; then
    pkgname+=("${pkgbase}-cuda-python")
  fi
  makedepends+=(
    'cuda'
    'cudnn'
    'nccl'
    'magma-cuda'
  )
fi

if [[ $_ENABLE_ROCM = 1 ]]; then
  pkgname+=("${pkgbase}-rocm")
  if [[ $_ENABLE_PYTHON = 1 ]]; then
    pkgname+=("${pkgbase}-rocm-python")
  fi
  makedepends+=(
    'rocm-hip-sdk'
    'miopen-hip'
    'rccl'
    'magma-hip'
  )
fi


pkgver() {
  cd "${srcdir}/${_pkgbase}"
  (git describe --always --tags | tr "-" "." | tail -c +2)
}

prepare() {
  cd "${srcdir}/${_pkgbase}"

  # display config
  cat - << EOF

prepare():

Build Options:

_ENABLE_CPU=$_ENABLE_CPU
_ENABLE_CUDA=$_ENABLE_CUDA
_ENABLE_ROCM=$_ENABLE_ROCM
_ENABLE_PYTHON=$_ENABLE_PYTHON

_ENABLE_PARALLEL=$_ENABLE_PARALLEL

_ENABLE_BARK=$_ENABLE_BARK
_ENABLE_SILERO_VAD=$_ENABLE_SILERO_VAD
_ENABLE_STABLEDIFFUSION=$_ENABLE_STABLEDIFFUSION
_ENABLE_PIPER=$_ENABLE_PIPER
_ENABLE_WHISPER=$_ENABLE_WHISPER

_OPTIONAL_MAKE_ARGS=$_OPTIONAL_MAKE_ARGS
_EXTERNAL_SOURCES=$_EXTERNAL_SOURCES
_DISABLED_MOD_EDIT=$_DISABLED_MOD_EDIT
_OPTIONAL_GRPC=$_OPTIONAL_GRPC
_GRPC_BACKENDS=$_GRPC_BACKENDS


EOF

  # ### modify Makefile
  # remove unused sources from get-sources
  sed -ri "s#get-sources: .*#get-sources: $_EXTERNAL_SOURCES#g" Makefile

  # remove go mod edits for inactive backend sources
  for i in $_DISABLED_MOD_EDIT; do
    sed -ri 's#.+\-replace github.com/'$i'.+##g' Makefile
  done

  # fetch sources of backends to be recursive git checked out before build()
  mkdir -p "sources"
  make $_OPTIONAL_MAKE_ARGS $_EXTERNAL_SOURCES

  # copy for different build types
  cd "${srcdir}"
  for n in "${_pkgbase}-cpu" "${_pkgbase}-cuda" "${_pkgbase}-rocm"; do
    if test -d "$n"; then rm -rf "$n"; fi
    cp -r "${_pkgbase}" "$n"
  done

  # additional patching for specific build types
  # cd "${srcdir}/${_pkgbase}-rocm"
}

_build() {
  # generate grpc protobuf files for python and copy python files to backend-assets
  make BUILD_TYPE="$1" protogen-python
  mkdir -p backend-assets/grpc
  cp -a backend/python backend-assets/grpc/python

  if test "$1" = "cublas"; then
    _LLAMA_CPP_BACKEND="backend-assets/grpc/llama-cpp-cuda"
  elif test "$1" = "hipblas"; then
    _LLAMA_CPP_BACKEND="backend-assets/grpc/llama-cpp-hipblas"
  else
    _LLAMA_CPP_BACKEND="backend-assets/grpc/llama-cpp-avx2"
  fi

  cat - << EOF


_build($1):
GO_TAGS=$_GO_TAGS
OPTIONAL_MAKE_ARGS=$_OPTIONAL_MAKE_ARGS
LLAMA_BACKEND=$_LLAMA_CPP_BACKEND
OTHER_GRPC_BACKENDS=$_GRPC_BACKENDS

EOF

  _nproc=1
  if [[ $_ENABLE_PARALLEL = 1 ]]; then
    # use number of physical cores for parallel build
    _nproc=$(grep  "^core id" /proc/cpuinfo | sort -n | uniq | wc -l)
  fi

  # build all enabled backends
  make -j"$_nproc" \
    BUILD_TYPE="$1" \
    GRPC_BACKENDS="$_LLAMA_CPP_BACKEND $_GRPC_BACKENDS" \
    GO_TAGS="$_GO_TAGS" $_OPTIONAL_MAKE_ARGS build
}

build() {
  if [[ $_ENABLE_CPU = 1 ]]; then
    cd "${srcdir}/${_pkgbase}-cpu"
    _build openblas
  fi

  if [[ $_ENABLE_CUDA = 1 ]]; then
    cd "${srcdir}/${_pkgbase}-cuda"
    export CUDA_HOME="${CUDA_HOME:-/opt/cuda}"
    export PATH="$CUDA_HOME/bin:$PATH"
    MAGMA_HOME="$CUDA_HOME/targets/x86_64-linux" CUDA_LIBPATH="$CUDA_HOME/lib64/" \
      _build cublas
  fi

  if [[ $_ENABLE_ROCM = 1 ]]; then
    cd "${srcdir}/${_pkgbase}-rocm"
    export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
    export ROCM_VERSION="$(cat $ROCM_HOME/.info/version)"
    export PATH="$ROC_HOME/bin:$PATH"
    echo "CXX=$CXX , CC=$CC"

    # fix build error on ROCM by removing unsupported cf-protection from CMAKE_CXX_FLAGS
    ONNX_VERSION=1.19.2 CXXFLAGS="$CXXFLAGS -fcf-protection=none" MAGMA_HOME="$ROCM_HOME" \
      AMDGPU_TARGETS="$_AMDGPU_TARGETS" GPU_TARGETS="$_AMDGPU_TARGETS" \
        _build hipblas
  fi
}

_package_install() {
  install -Dm755 "local-ai" "${pkgdir}/usr/bin/localai"
  ln -s "/usr/bin/localai" "${pkgdir}/usr/bin/local-ai"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgbase}"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgbase}"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README-build.md"
  install -Dm644 ${srcdir}/${_pkgbase}.conf -t "${pkgdir}/etc/${_pkgbase}"
  _python_backends_str=""
  if [[ $_IS_PYTHON_FLAVOR = 1 ]]; then
    _python_backends_str=$(printf "%s\n" "${_python_backends[@]}")
  fi
  echo "ARCH_LOCALAI_PYTHON_BACKENDS=\"${_python_backends_str}\"" \
      > "${pkgdir}/etc/${_pkgbase}/python_backends.conf"
  install -Dm644 ${srcdir}/${_pkgbase}.service -t "${pkgdir}/usr/lib/systemd/system"
  install -Dm644 ${srcdir}/${_pkgbase}.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgbase}.conf"
  install -Dm644 ${srcdir}/${_pkgbase}.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgbase}.conf"
}

package_localai-git() {
  cd "${srcdir}/${_pkgbase}-cpu"
  depends+=('openblas')
  if test "$_ENABLE_PIPER" = "1" -o "$_ENABLE_SILERO_VAD" = "1"; then depends+=('onnxruntime'); fi
  if [[ $_IS_PYTHON_FLAVOR = 1 ]]; then depends+=("${_python_depends[@]}"); fi
  _package_install
}

package_localai-git-cuda() {
  cd "${srcdir}/${_pkgbase}-cuda"
  pkgdesc+=' (with CUDA support)'
  depends+=('cuda')
  if test "$_ENABLE_PIPER" = "1" -o "$_ENABLE_SILERO_VAD" = "1"; then depends+=('onnxruntime'); fi
  if [[ $_IS_PYTHON_FLAVOR = 1 ]]; then depends+=("${_python_depends[@]}"); depends+=('python-pytorch-cuda'); fi
  _package_install
}

package_localai-git-rocm() {
  cd "${srcdir}/${_pkgbase}-rocm"
  pkgdesc+=' (with ROCM support)'
  depends+=('rocm-hip-runtime' 'hipblas' 'rocblas')
  if test "$_ENABLE_PIPER" = "1" -o "$_ENABLE_SILERO_VAD" = "1"; then depends+=('onnxruntime'); fi
  if [[ $_IS_PYTHON_FLAVOR = 1 ]]; then depends+=("${_python_depends[@]}"); depends+=('python-pytorch-rocm'); fi
  _package_install
}

package_localai-git-python() {
  _IS_PYTHON_FLAVOR=1
  package_localai-git "$@"
}

package_localai-git-cuda-python() {
  _IS_PYTHON_FLAVOR=1
  package_localai-git-cuda "$@"
}

package_localai-git-rocm-python() {
  _IS_PYTHON_FLAVOR=1
  package_localai-git-rocm "$@"
}
