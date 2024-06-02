# Maintainer: wuxxin <wuxxin@gmail.com>

# env vars for build steering, eg. to only build for cpu, set _ENABLE_CUDA and _ENABLE_ROCM to 0
_ENABLE_CPU=${_ENABLE_CPU:-1}
_ENABLE_CUDA=${_ENABLE_CUDA:-1}
_ENABLE_ROCM=${_ENABLE_ROCM:-1}

# additional backends if set to 1
_ENABLE_PYTHON=${_ENABLE_PYTHON:-1}
_ENABLE_PIPER=${_ENABLE_PIPER:-0}

# if GPU_TARGETS and AMDGPU_TARGETS are not set, populate build architecture list from arch:python-pytorch@2.2.2-3
_AMDGPU_TARGETS="gfx906;gfx908;gfx90a;gfx940;gfx941;gfx942;gfx1010;gfx1012;gfx1030;gfx1100;gfx1101;gfx1102"
if test -n "$GPU_TARGETS"; then _AMDGPU_TARGETS="$GPU_TARGETS"; fi
if test -n "$AMDGPU_TARGETS"; then _AMDGPU_TARGETS="$AMDGPU_TARGETS"; fi

# additional optional grpc backends
_OPTIONAL_GRPC="${_OPTIONAL_GRPC:-}"
# additional optional args for main Makefile calling
_OPTIONAL_MAKE_ARGS="${_OPTIONAL_MAKE_ARGS:-}"

# limit pulling external sources
_EXTERNAL_SOURCES="backend/cpp/llama/llama.cpp sources/whisper.cpp"
# disabled_sources=go-llama.cpp gpt4all go-rwkv.cpp go-stable-diffusion go-tiny-dream go-bert go-piper
_DISABLED_MOD_EDIT="nomic-ai/gpt4all/gpt4all mudler/go-stable-diffusion \
  go-skynet/go-llama.cpp go-skynet/go-bert.cpp donomii/go-rwkv.cpp M0Rf30/go-tiny-dream"

if [[ $_ENABLE_PIPER = 1 ]]; then
  _EXTERNAL_SOURCES="$_EXTERNAL_SOURCES sources/go-piper"
  _OPTIONAL_GRPC="backend-assets/grpc/piper $_OPTIONAL_GRPC"
  _GO_TAGS="tts"
else
 _DISABLED_MOD_EDIT="$_DISABLED_MOD_EDIT mudler/go-piper"
 _GO_TAGS=""
fi

# enabled backends
_GRPC_BACKENDS="backend-assets/grpc/llama-cpp-grpc backend-assets/util/llama-cpp-rpc-server \
backend-assets/grpc/llama-cpp-avx2 backend-assets/grpc/whisper backend-assets/grpc/local-store \
$_OPTIONAL_GRPC"
# disabled backends: llama-ggml gpt4all rwkv tinydream bert-embeddings huggingface stablediffusion

_pkgbase="localai"
pkgbase="${_pkgbase}-git"
pkgname=()
pkgver=2.16.0.66.g77d752a4
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

if [[ $_ENABLE_PYTHON = 1 ]]; then
  depends+=(
    'python-numpy'
    'python-opencv'
    'python-pillow'
    'python-pytorch'
    'python-torchaudio'
    'python-torchvision'
    'python-protobuf'
    'python-grpcio'
		'python-grpcio-tools'
  )
fi

if [[ $_ENABLE_PIPER = 1 ]]; then
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
  "${_pkgbase}"::"git+https://github.com/mudler/LocalAI"
	"libbackend.patch"
  "README.md"
)

sha256sums=(
  'SKIP'
	'SKIP'
  'SKIP'
)

pkgver() {
  cd "${srcdir}/${_pkgbase}"
  (git describe --always --tags | tr "-" "." | tail -c +2)
}

prepare() {
  cd "${srcdir}/${_pkgbase}"

  # display config
  cat - << EOF
Build Options:

_ENABLE_CPU=$_ENABLE_CPU
_ENABLE_CUDA=$_ENABLE_CUDA
_ENABLE_ROCM=$_ENABLE_ROCM
_ENABLE_PIPER=$_ENABLE_PIPER
_ENABLE_PYTHON=$_ENABLE_PYTHON

_OPTIONAL_MAKE_ARGS=$_OPTIONAL_MAKE_ARGS
_EXTERNAL_SOURCES=$_EXTERNAL_SOURCES
_DISABLED_MOD_EDIT=$_DISABLED_MOD_EDIT
_OPTIONAL_GRPC=$_OPTIONAL_GRPC
_GRPC_BACKENDS=$_GRPC_BACKENDS

EOF

  # modify Makefile
  # modify get-sources
  sed -ri "s#get-sources: .*#get-sources: $_EXTERNAL_SOURCES#g" Makefile
  # modify (remove) go mod edits for inactive backend sources
  for i in $_DISABLED_MOD_EDIT; do
    sed -ri 's#.+\-replace github.com/'$i'.+##g' Makefile
  done

  # modify python backend build library to use -system-site-packages, and dont reinstall torch*
  patch -N -i "${srcdir}/libbackend.patch" -p1

	# fetch sources of backends to be recursive git checked out before build()
  mkdir -p "sources"
  make $_OPTIONAL_MAKE_ARGS $_EXTERNAL_SOURCES

  if [[ $_ENABLE_PIPER = 1 ]]; then
    # fix piper build
    mkdir -p "sources/go-piper/piper-phonemize/pi/lib"
    touch "sources/go-piper/piper-phonemize/pi/lib/keep"
    sed -ri 's#(\$\(MAKE\) -C sources/go-piper libpiper_binding.a) example/main#\1#g' Makefile
  fi

  # copy for different build types
  cd "${srcdir}"
  for n in "${_pkgbase}-cpu" "${_pkgbase}-cuda" "${_pkgbase}-rocm"; do
    if test -d "$n"; then rm -rf "$n"; fi
    cp -r "${_pkgbase}" "$n"
  done

  # ROCM fixes
  cd "${srcdir}/${_pkgbase}-rocm"

  # fix build error on ROCM by removing unsupported cf-protection from CMAKE_CXX_FLAGS
  export CXXFLAGS+="$CXXFLAGS -fcf-protection=none"

  # fix llama and whisper build: --offload-arch, is deprecated, replace it with -DGPU_TARGETS
  for i in \
    backend/cpp/llama/llama.cpp/Makefile \
    sources/whisper.cpp/Makefile; do
      sed -ri 's/^(.+HIPFLAGS.+\+=).+offload-arch=.+$/\1 -DGPU_TARGETS="$(GPU_TARGETS)"/g' "$i"
  done

}

_build() {
  make BUILD_TYPE="$1" GRPC_BACKENDS="$_GRPC_BACKENDS" GO_TAGS="$_GO_TAGS" $_OPTIONAL_MAKE_ARGS build
  if [[ $_ENABLE_PYTHON = 1 ]]; then
		make BUILD_TYPE="$1" protogen-python
	fi
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
    export PATH="$ROC_HOME/bin:$PATH"
    MAGMA_HOME="$ROCM_HOME" AMDGPU_TARGETS="$_AMDGPU_TARGETS" GPU_TARGETS="$_AMDGPU_TARGETS" \
      _build hipblas
  fi
}

_package_install() {
  install -Dm755 "local-ai" "${pkgdir}/usr/bin/localai"
  ln -s "/usr/bin/localai" "${pkgdir}/usr/bin/local-ai"
  install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${_pkgbase}"
  install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${_pkgbase}/README-build.md"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgbase}"
  if [[ $_ENABLE_PYTHON = 1 ]]; then
    cp -a backend/python "${pkgdir}/usr/share/${_pkgbase}/python"
  fi
  install -Dm644 localai.service -t "${pkgdir}/usr/lib/systemd/user"
  install -Dm644 localai.env -t "${pkgdir}/usr/share/${_pkgbase}"
}

package_localai-git() {
  cd "${srcdir}/${_pkgbase}-cpu"
  depends+=('openblas')
  _package_install
}

package_localai-git-cuda() {
  cd "${srcdir}/${_pkgbase}-cuda"
  pkgdesc+=' (with CUDA support)'
  depends+=('cuda')
  _package_install
}

package_localai-git-rocm() {
  cd "${srcdir}/${_pkgbase}-rocm"
  pkgdesc+=' (with ROCM support)'
  depends+=('rocm-hip-runtime' 'hipblas' 'rocblas')
  _package_install
}
