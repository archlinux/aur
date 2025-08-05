# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm
_pkgname=vllm
pkgver=0.10.0
pkgrel=3
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
depends=(
  python-sympy
  numactl
  python-pytorch
  python-transformers
  python-sphinx
  python-aiohttp
  python-cachetools
  python-uvloop
  python-fastapi
  uvicorn
  python-soundfile
  python-starlette
  python-tqdm
  python-boto3
  python-openai
  python-importlib-metadata
  python-torchvision
  python-pydantic
  python-psutil
  python-opencv
  python-py-cpuinfo
  python-msgspec
  python-pyzmq
  python-blake3
  python-cloudpickle
  python-huggingface-hub
  python-gguf
  python-prometheus-fastapi-instrumentator
  python-partial-json-parser
  python-watchfiles
  python-triton
  python-diskcache
  python-pybase64
  )
makedepends=(
  git
  gcc14
  cmake
  python-installer
  python-setuptools
  python-setuptools-scm
  python-build)

optdepends=(
  'python-openai: required for openai protocols'
  'python-prometheus_client: Prometheus instrumentation library for Python applications'
  'python-pillow: required for image processing'
  'python-outlines: guided text generation'
  'python-lark: parsing toolkit'
  'python-typing_extensions: typing hints'
  'python-msgspec: JSON/MessagePack library with validation'
  'python-mistral-common: mistral tools for opencv'
  'python-einops: required for QWen2-VL models'
  'python-compressed-tensors: required to load compressed tensor files'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-datasets: tools to benchmark scripts'
#not currently in aur
  'python-xgrammar: flexible structured generation'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-tiktoken: required for DBRX tokenizer'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
  )

source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}")
sha256sums=('44f535b941d2447e817b32fca6ded58041e9e6e5f4984c97e045db66dac798c3')
_jobs=$(($(nproc) / 2))
prepare() {
  #not much luck setting CC env flags, so manually linking and pathing - this only exists for building
  mkdir -p gcc14/bin
  ln -sf /usr/bin/gcc-14 $srcdir/gcc14/bin/gcc
  ln -sf /usr/bin/g++-14 $srcdir/gcc14/bin/g++
  sed -i 's/\(PYTHON_SUPPORTED_VERSIONS\s*"3.9" "3.10" "3.11" "3.12"\)/\1 "3.13"/' "$_pkgname/CMakeLists.txt"
}

build() {
  cd $_pkgname

  # Limit the number of parallel jobs to avoid OOM
  export MAX_JOBS=$_jobs
  export VLLM_TARGET_DEVICE=cpu

  # Build
  python setup.py bdist_wheel --dist-dir=dist
  #python -m build --wheel --no-isolation # this does not work currently
}

package() {
  cd $_pkgname
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
