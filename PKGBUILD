# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm
_pkgname=vllm
pkgver=0.12.0
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
  'python-tiktoken: required for DBRX tokenizer'
  #not currently in aur
  'python-xgrammar: flexible structured generation'
  'python-depyf: required for debugging and profiling with complilation config'
  'python-lm-format-enforcer: required for JSON/REGEX llm output'
)

source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}")
sha256sums=('fcbd06d831a25d497106d493c8682a20970aa415c633bb8c5f1a973ac982f9a9')
#
# the following patch was merged so only needed for 0.10.1.1
if [ "$pkgver" = "0.10.1.1" ]; then
  source+=("add-python-313-support.patch::https://github.com/vllm-project/vllm/commit/21dce80ea96bcf033d159c0f952fb274567b315c.patch")
fi
[[ $MAKEFLAGS =~ -j[[:space:]]*([0-9]+) ]] &&
  _jobs="${BASH_REMATCH[1]}" || _jobs=1

prepare() {
  mkdir -p gcc14/bin
  ln -sf /usr/bin/gcc-14 $srcdir/gcc14/bin/gcc
  ln -sf /usr/bin/g++-14 $srcdir/gcc14/bin/g++

  # Apply patch only for 0.10.1.1
  if [ "$pkgver" = "0.10.1.1" ]; then
    cd $_pkgname
    patch -Np1 -i "../add-python-313-support.patch"
  fi
}

build() {
  cd $_pkgname

  # Limit the number of parallel jobs to avoid OOM
  export MAX_JOBS=$_jobs
  export VLLM_TARGET_DEVICE=cpu
  #gcc 14
  export CC="$srcdir/gcc14/bin/gcc"
  export CXX="$srcdir/gcc14/bin/g++"
  export PATH="$srcdir/gcc14/bin:$PATH"

  # Build
  python setup.py bdist_wheel --dist-dir=dist
  #python -m build --wheel --no-isolation # this does not work currently
}

package() {
  cd $_pkgname
  python -m installer --destdir="${pkgdir}" dist/*.whl
}

# vim:set ts=2 sw=2 et:
