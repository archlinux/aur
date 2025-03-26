# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm
_pkgname=vllm
pkgver=0.8.2
pkgrel=1
pkgdesc="high-throughput and memory-efficient inference and serving engine for LLMs"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
depends=(python-installer python-sympy numactl python-pytorch python-build python-setuptools)
makedepends=(git gcc13)
source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}")
sha256sums=('ff2a1952f02e21a93e1e2b2d07868d73b9934c3ac95441d10fee9b0763e6fc21')
_jobs=3
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
