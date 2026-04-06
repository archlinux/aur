pkgname=python-vllm-rocm-git
_pkgname=vllm
pkgver=0.19.1rc0.r58.ge8ebbdd
pkgrel=1
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs (ROCm support)"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
provides=(python-vllm-rocm vllm)
conflicts=(python-vllm-rocm python-vllm-cuda)
depends=(
  amdsmi
  numactl
  python-aiohttp
  python-blake3
  python-cachetools
  python-cbor2
  python-cloudpickle
  python-compressed-tensors
  python-diskcache
  python-einops
  python-fastapi
  python-gguf
  python-huggingface-hub
  python-ijson
  python-importlib-metadata
  python-jmespath
  python-mistral-common
  python-model-hosting-container-standards
  python-msgpack
  python-msgspec
  python-openai
  python-openai-harmony
  python-opencv
  python-partial-json-parser
  python-pillow
  python-prometheus-fastapi-instrumentator
  python-psutil
  python-py-cpuinfo
  python-pybase64
  python-pycountry
  python-pydantic
  python-pytorch-opt-rocm
  python-pyzmq
  python-seaborn
  python-setproctitle
  python-soundfile
  python-sphinx
  python-starlette
  python-sympy
  python-tiktoken
  python-torchvision
  python-tqdm
  python-transformers
  python-triton
  python-typing_extensions
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
  'python-outlines: guided text generation'
  'python-lark: parsing toolkit'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-datasets: tools to benchmark scripts'
#not currently in aur
  'python-xgrammar: flexible structured generation'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
)

source=("git+https://github.com/vllm-project/vllm.git")
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(git describe --long --tags --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  cd "$srcdir/$_pkgname"
  rm -f "dist"/*

  # 放宽 python 版本
  sed -i 's/\(PYTHON_SUPPORTED_VERSIONS\s*"3.10" "3.11" "3.12" "3.13"\)/\1 "3.14"/' "CMakeLists.txt"
}

build() {
  cd "$srcdir/$_pkgname"

  if [[ -z "${ROCM_PATH}" ]]; then
    source /etc/profile
  fi

  export MAX_JOBS=$(nproc)
  export VLLM_TARGET_DEVICE=rocm

  # 彻底禁用 LTO
  export CFLAGS="${CFLAGS/-flto/}"
  export CFLAGS="${CFLAGS/-flto=auto/}"
  export CXXFLAGS="${CXXFLAGS/-flto/}"
  export CXXFLAGS="${CXXFLAGS/-flto=auto/}"
  export LDFLAGS="${LDFLAGS/-flto/}"
  export LDFLAGS="${LDFLAGS/-flto=auto/}"
  export CMAKE_INTERPROCEDURAL_OPTIMIZATION=FALSE

  # 暴露默认可见性并确保扩展名正确
  # -Wno-macro-redefined 清除头文件重定义警告
  export CXXFLAGS="$CXXFLAGS -fvisibility=default -Wno-macro-redefined"
  export CFLAGS="$CFLAGS -fvisibility=default -Wno-macro-redefined"

  # 检查是否在 CI 环境中构建
  if [ -n "$CI" ] && [ "$CI" != 0 ]; then
    # https://llvm.org/docs/AMDGPUUsage.html
    # gfx906: MI 50/60, Radeon VII
    # gfx101x: RX 5000 Series
    # gfx103x: RX 6000 Series
    # gfx110x: RX 7000 Series
    # gfx1151: Strix Halo
    # gfx120x: RX 9000 Series
    PYTORCH_ROCM_ARCH="gfx906;gfx1010;gfx1030;gfx1100;gfx1101;gfx1102;gfx1151;gfx1200;gfx1201"
  else
    # 本地构建, 针对当前设备优化
    _detected_archs=$(rocminfo | grep -oP 'Name:\s+\Kgfx\d+' | sort -u | tr '\n' ';' | sed 's/;$//')
    PYTORCH_ROCM_ARCH="$_detected_archs"
  fi
  msg2 "Building for ROCM=$PYTORCH_ROCM_ARCH"
  # Build
  python setup.py bdist_wheel --dist-dir=dist
  # python -m build --wheel --no-isolation # this does not work currently
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
