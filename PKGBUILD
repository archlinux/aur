# Maintainer: envolution
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=python-vllm-cuda
_pkgname=vllm
pkgver=0.6.5
pkgrel=1
pkgdesc="faster implementation for TTS models, to be used in highly async environment - cpu version"
arch=('x86_64')
url='https://github.com/vllm-project/vllm'
provides=(python-vllm)
conflicts=(python-vllm)
license=(Apache-2.0)
depends=(python-installer python)
makedepends=(git gcc13 cuda cuda-tools) #won't build without detecting cuda - need to investiogate further
source=("git+https://github.com/vllm-project/vllm.git#tag=v${pkgver}")
sha256sums=('5c8228773ae38ddda2d38f5fc68a259856cab4891766792d859cdaf225e63bc5')
_jobs=3
prepare() {
  #not much luck setting CC env flags, so manually linking and pathing - this only exists for building
  mkdir -p gcc13/bin
  ln -sf /usr/bin/gcc-13 $srcdir/gcc13/bin/gcc
  ln -sf /usr/bin/g++-13 $srcdir/gcc13/bin/g++
}
build() {
  cd $_pkgname
  python_executable=/usr/bin/python
  cuda_home=/opt/cuda

  # Update paths
  PATH=$srcdir/gcc13/bin:${cuda_home}/bin:$PATH
  LD_LIBRARY_PATH=${cuda_home}/lib:$LD_LIBRARY_PATH

  # Limit the number of parallel jobs to avoid OOM
  export MAX_JOBS=$_jobs
  # Make sure release wheels are built for the following architectures
  export TORCH_CUDA_ARCH_LIST="7.0 7.5 8.0 8.6 8.9 9.0+PTX"
  export VLLM_FA_CMAKE_GPU_ARCHES="80-real;90-real"
  export VLLM_TARGET_DEVICE=cuda

  # Build
  $python_executable setup.py bdist_wheel --dist-dir=dist
}
#build() {
#  cd $_pkgname-$pkgver
#  export PATH="$srcdir/gcc13/bin:/opt/cuda/bin:$PATH"
#  export CC=/usr/bin/gcc-13
#  export CXX=/usr/bin/g++-13
#  mkdir -p build && cd build
#  cmake -G Ninja -S .. \
#    -DVLLM_PYTHON_EXECUTABLE=/usr/bin/python \
#    -DCMAKE_INSTALL_PREFIX=/usr \
#    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
#    -DVLLM_TARGET_DEVICE=cuda \
#    -DCMAKE_CUDA_COMPILER=/opt/cuda/bin/nvcc \
#    -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda \
#    -DCMAKE_LIBRARY_PATH=/opt/cuda/lib64 \
#    -DCMAKE_CXX_COMPILER=/usr/bin/g++-13 \
#    -DCMAKE_C_COMPILER=/usr/bin/gcc-13 \
#    -DCMAKE_CUDA_FLAGS="--compiler-options '-std=c++17'" \
#    -DCMAKE_CUDA_ARCHITECTURES="5.2" \
#    -DCMAKE_INCLUDE_PATH=/opt/cuda/include
#    -DCUDA_VERSION=12.7 \
#  cmake --build . --target install --parallel $_jobs
#
# If you want to only build one target, make sure to install it manually:
# cmake --build . --target _C
# cmake --install . --component _C
#}
#build() {
#  cd $_pkgname-$pkgver
#  mkdir -p build && cd build
#  unset CUDA_HOME
#  unset NVIDIA_CUDA_HOME
#  cmake -G Ninja -S .. \
#    -DVLLM_PYTHON_EXECUTABLE=/usr/bin/python \
#    -DCMAKE_INSTALL_PREFIX=/usr \
#    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
#    -DBUILD_CUDA_EXTENSIONS=OFF \
#    -DBUILD_SHARED_LIBS=ON \
#    -DCMAKE_CUDA_ARCHITECTURES="none" \
#    -DVLLM_TARGET_DEVICE=cpu
#  cmake --build . --target install
#
# If you want to only build one target, make sure to install it manually:
# cmake --build . --target _C
# cmake --install . --component _C
#}
package() {
  cd $_pkgname
  python -m installer --destdir="${pkgdir}" dist/*.whl
}
# vim:set ts=2 sw=2 et:
