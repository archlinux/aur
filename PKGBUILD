# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm
_pkgname=vllm
pkgver=0.6.6.post1
pkgrel=1
pkgdesc="faster implementation for TTS models, to be used in highly async environment - cpu version"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
license=(Apache-2.0)
depends=(python-installer python-build python-setuptools)
makedepends=(git gcc13 cuda cuda-tools) #won't build without detecting cuda - need to investiogate further
source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}")
sha256sums=('6ad088e3a376f8f8cc5d75b126f1239fd2bd940f4920413d3c79dadee8f8515b')
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
  cuda_home=/opt/cuda

  # Update paths
  PATH=$srcdir/gcc13/bin:${cuda_home}/bin:$PATH
  LD_LIBRARY_PATH=${cuda_home}/lib:$LD_LIBRARY_PATH

  # Limit the number of parallel jobs to avoid OOM
  export MAX_JOBS=$_jobs
  # Make sure release wheels are built for the following architectures
  export TORCH_CUDA_ARCH_LIST="7.0 7.5 8.0 8.6 8.9 9.0+PTX"
  export VLLM_FA_CMAKE_GPU_ARCHES="80-real;90-real"
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
