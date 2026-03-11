pkgname=python-vllm-rocm
_pkgname=vllm
pkgver=0.17.1
pkgrel=1
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs (ROCm support)"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
depends=(
  amdsmi
  numactl
  python-aiohttp
  python-blake3
  python-cachetools
  python-cloudpickle
  python-diskcache
  python-einops
  python-fastapi
  python-gguf
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
  'python-compressed-tensors: required to load compressed tensor files'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-datasets: tools to benchmark scripts'
#not currently in aur
  'python-xgrammar: flexible structured generation'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-tiktoken: required for DBRX tokenizer'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
)

source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}" "0001-Fix-LTO-build-for-ROCm-when-default-compiler-is-GCC.patch")
sha256sums=('42499b2db5b7e0a7fbba76fbcec2028d13230004c382501deb832d42b85bd84e'
            'cbab00db18bf41a18d01b309606801d91bc2f292fd37b0037883db702691b649')

_jobs=$(($(nproc) / 2))
prepare() {
  cd "$_pkgname"
  git apply ../0001-Fix-LTO-build-for-ROCm-when-default-compiler-is-GCC.patch
  git cherry-pick --no-commit 5a5c43511ac98299856d0fee6c619fdd8bcdd2ef
  sed -i 's/\(PYTHON_SUPPORTED_VERSIONS\s*"3.10" "3.11" "3.12" "3.13"\)/\1 "3.14"/' "CMakeLists.txt"
}

build() {
  cd "$_pkgname"

  # Limit the number of parallel jobs to avoid OOM
  export MAX_JOBS=$_jobs
  export VLLM_TARGET_DEVICE=rocm
  export PYTORCH_ROCM_ARCH="gfx906;gfx908;gfx90a;gfx942;gfx1100;gfx1101;gfx1200;gfx1201"
  # Build
  python setup.py bdist_wheel --dist-dir=dist
  #python -m build --wheel --no-isolation # this does not work currently
}

package() {
  cd "$_pkgname"
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
