pkgname=python-vllm-rocm
_pkgname=vllm
pkgver=0.23.0
pkgrel=1
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs (ROCm support)"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
depends=(
  amdsmi
  numactl
  python-aiohttp
  python-av
  python-blake3
  python-cachetools
  python-cbor2
  python-cloudpickle
  python-diskcache
  python-einops
  python-fastapi
  python-gguf
  python-xgrammar
  python-huggingface-hub
  python-ijson
  python-importlib-metadata
  python-mistral-common
  python-msgspec
  python-openai
  python-opencv
  python-partial-json-parser
  python-prometheus-fastapi-instrumentator
  python-psutil
  python-py-cpuinfo
  python-pybase64
  python-pydantic
  python-pytorch-opt-rocm
  python-pyzmq
  python-soundfile
  python-sphinx
  python-starlette
  python-sympy
  python-torchvision
  python-tqdm
  python-transformers
  python-triton
  python-uvloop
  python-watchfiles
  rocblas
  uvicorn
)
makedepends=(
  git
  gcc
  cmake
  python-installer
  python-setuptools
  python-setuptools-scm
  python-build
)

optdepends=(
  'python-prometheus_client: Prometheus instrumentation library for Python applications'
  'python-pillow: required for image processing'
  'python-outlines: guided text generation'
  'python-lark: parsing toolkit'
  'python-typing_extensions: typing hints'
  'python-compressed-tensors: required to load compressed tensor files (eg. for GPT OSS)'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-datasets: tools to benchmark scripts'
#not currently in aur
  'python-xgrammar: flexible structured generation'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-tiktoken: required for DBRX tokenizer'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
)

provides=('python-vllm')

source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}" "0001-Fix-LTO-build-for-ROCm-when-default-compiler-is-GCC.patch")
sha256sums=('b450cfefaf8e4c3e4905c7a15ec7a9bed914f1e76ca1be690192a10482b11cf7'
            'b218671c925b0f081b6caa8246c27b05dea98c14d3389504f68e73486d513b58')

_jobs=$(($(nproc) / 2))
prepare() {
  cd "$srcdir/$_pkgname"
  rm -f "dist"/*

  git apply ../0001-Fix-LTO-build-for-ROCm-when-default-compiler-is-GCC.patch
  sed -i 's/\(PYTHON_SUPPORTED_VERSIONS\s*"3.10" "3.11" "3.12" "3.13"\)/\1 "3.14"/' "CMakeLists.txt"
  sed -i 's/mwaitxintrin/x86intrin/' csrc/spinloop.cpp
}

build() {
  cd "$srcdir/$_pkgname"

  # Limit the number of parallel jobs to avoid OOM
  export MAX_JOBS=$_jobs
  export VLLM_TARGET_DEVICE=rocm
  if [[ -z "$PYTORCH_ROCM_ARCH" ]]; then
    PYTORCH_ROCM_ARCH="gfx906;gfx908;gfx90a;gfx942;gfx950;gfx1030;gfx1100;gfx1101;gfx1150;gfx1151;gfx1152;gfx1153;gfx1200;gfx1201"
    if [[ -n "$ROCM_ARCH" ]]; then
      PYTORCH_ROCM_ARCH="$ROCM_ARCH"
    elif [[ ! -v ROCM_ARCH && $(command -v rocminfo 2>/dev/null) ]]; then
      _detected_archs=$(rocminfo | grep -oP 'Name:\s+\Kgfx\d+' | sort -u | tr '\n' ';' | sed 's/;$//')
      if [[ -n "$_detected_archs" ]]; then
        PYTORCH_ROCM_ARCH="$_detected_archs"
      fi
    fi
    export PYTORCH_ROCM_ARCH
  fi
  echo "Building for ROCM=$PYTORCH_ROCM_ARCH"
  # Build
  python setup.py bdist_wheel --dist-dir=dist
  #python -m build --wheel --no-isolation # this does not work currently
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
