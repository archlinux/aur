# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm
_pkgname=vllm
pkgver=0.9.1
pkgrel=1
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
  python-huggingface-hub)
makedepends=(
  git
  gcc13
  cmake
  python-installer
  python-setuptools
  python-setuptools-scm
  python-build)

optdepends=(
  'python-openai: required for openai protocols'
  'python-prometheus_client: Prometheus instrumentation library for Python applications'
  'prometheus-fastapi-instrumentator: Prometheus fastapi implementation'
  'python-pillow: required for image processing'
  'python-tiktonek: required for DBRX tokenizer'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
  'python-outlines: guided text generation'
  'python-lark: parsing toolkit'
  'python-xgrammar: flexible structured generation'
  'python-typing_extensions: typing hints'
  'python-partial-json-parser: parse partial JSON output'
  'python-msgspec: JSON/MessagePack library with validation'
  'python-mistral-common: mistral tools for opencv'
  'python-einops: required for QWen2-VL models'
  'python-compressed-tensors: required to load compressed tensor files'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-torchaudio: required for image processor of minicpm-o-2.6'
  'python-datasets: tools to benchmark scripts')

source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}")
sha256sums=('5354912742471b8a0a1a2e47075c52bf4d42370f623168f81edb2f74887a850b')
_jobs=$(($(nproc) / 2))
prepare() {
  #not much luck setting CC env flags, so manually linking and pathing - this only exists for building
  mkdir -p gcc13/bin
  ln -sf /usr/bin/gcc-13 $srcdir/gcc13/bin/gcc
  ln -sf /usr/bin/g++-13 $srcdir/gcc13/bin/g++
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
