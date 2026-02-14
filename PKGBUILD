# Maintainer: wuxxin
# shellcheck shell=bash disable=SC2034,SC2154
_pkgname=torchao
pkgname=python-${_pkgname}-rocm
pkgver=0.16.0
pkgrel=1
pkgdesc="Package for applying ao techniques to GPU models (with ROCm/HIP support)"
arch=(x86_64)
url="https://pytorch.org/ao/stable/index.html"
license=('BSD-3-Clause')
depends=(
  python-pytorch-rocm
)
makedepends=(
  python-build
  python-installer
  python-setuptools
  python-wheel
  cmake
  ninja
  git
  rocm-hip-runtime
  hipblas
)
provides=(python-torchao=$pkgver)
conflicts=(python-torchao)
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/ao.git#tag=v${pkgver}")
sha256sums=('ae87182d472681ded40f59f8acef411f8b64560701319504c8486a094fc3e2d2')

prepare() {
  cd "${_pkgname}-${pkgver}"
  git submodule update --init --recursive
}

build() {
  cd "${_pkgname}-${pkgver}"

  # Ensure ROCm is selected
  export USE_ROCM=1
  export USE_CPP=1
  export USE_CUDA=0
  export HIP_PLATFORM=amd

  # populate build architecture list similar to pkg arch:python-pytorch
  # python-pytorch 2.10.0-1: gfx950 lacks support for 128 bit atomics
  _PYTORCH_ROCM_ARCH="$(rocm-supported-gfx -e gfx950)"
  if test -n "$GPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$GPU_TARGETS"; fi
  if test -n "$AMDGPU_TARGETS"; then _PYTORCH_ROCM_ARCH="$AMDGPU_TARGETS"; fi
  if test -n "$PYTORCH_ROCM_ARCH"; then _PYTORCH_ROCM_ARCH="$PYTORCH_ROCM_ARCH"; fi
  export PYTORCH_ROCM_ARCH="${_PYTORCH_ROCM_ARCH}"
  echo "building for PYTORCH_ROCM_ARCH=$PYTORCH_ROCM_ARCH"

  # if ROCM_HOME is not set, hardcode ROCM_HOME, ROCM_PATH, HIP_ROOT_DIR to /opt/rocm
  export ROCM_HOME="${ROCM_HOME:-/opt/rocm}"
  export ROCM_PATH="$ROCM_HOME"
  export HIP_ROOT_DIR="$ROCM_HOME"
  
  # Fix glog header conflict: directly satisfy the !defined(GLOG_EXPORT) check
  # used by glog 0.7.0+ when not using CMake or when GLOG_USE_GLOG_EXPORT is missing.
  export CXXFLAGS="${CXXFLAGS} -DGLOG_USE_GLOG_EXPORT -DGLOG_EXPORT= -DGLOG_NO_EXPORT="
  export CFLAGS="${CFLAGS} -DGLOG_USE_GLOG_EXPORT -DGLOG_EXPORT= -DGLOG_NO_EXPORT="
  export LDFLAGS="${LDFLAGS}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
