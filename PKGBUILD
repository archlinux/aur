# Maintainer: Butui Hu <hot123tea123@gmail.com>

# cuda 11 supports Pascal， Volta，Turing, Ampere
# see also https://arnon.dk/matching-sm-architectures-arch-and-gencode-for-various-nvidia-cards
# adjust this list according to your target device
_CUDA_ARCH_LIST="60;61;62;70;72;75;80;86"
_pkgname=Paddle
pkgname=('python-paddlepaddle' 'python-paddlepaddle-cuda')
pkgver=2.2.1
pkgrel=1
pkgdesc='PArallel Distributed Deep LEarning: Machine Learning Framework from Industrial Practice'
arch=('x86_64')
url='http://www.paddlepaddle.org'
license=('Apache')
depends=(
  blas
  python-astor
  python-decorator
  python-numpy
  python-pillow
  python-protobuf
  python-requests
  python-six
)
makedepends=(
  cmake
  cuda
  cudnn
  git
  nccl
  patchelf
  python-pip
  python-setuptools
  python-wheel
  swig
  wget
)
source=("${_pkgname}::git+https://github.com/PaddlePaddle/Paddle.git#tag=v${pkgver}")
sha512sums=('SKIP')

prepare() {
  # improve the file descriptors limit to avoid "Too many open files" error
  ulimit -n 4096
  # use the same version of system's protobuf
  # always check https://github.com/PaddlePaddle/Paddle/blob/v2.2.1/cmake/external/protobuf.cmake
  # to make sure which protobuf git commit is used
  # if you set other config that might affect this
  _protobuf_version=$(protoc --version|cut -f 2 -d ' ')
  sed -i "s,9f75c5aa851cd877fb0d93ccc31b8567a6706546,v${_protobuf_version}," "${_pkgname}/cmake/external/protobuf.cmake"
  # set CUDA_HOME for dgc building
  sed -i 's,BUILD_COMMAND make -j $(nproc),BUILD_COMMAND make CUDA_HOME=/opt/cuda,' "${_pkgname}/cmake/external/dgc.cmake"
  # fix std::move error, see also https://github.com/PaddlePaddle/Paddle/issues/26878
  find "${_pkgname}" -type f -name CMakeLists.txt -exec sed -i -e '$aset(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-error=pessimizing-move")' {} \;
  # fix range-loop-construct
  find "${_pkgname}" -type f -name CMakeLists.txt -exec sed -i -e '$aset(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-error=range-loop-construct")' {} \;
  # fix #include <cstddef>
  sed -i 's,#include <cstdint>,#include <cstdint>\n#include <cstddef>,' "${_pkgname}/paddle/fluid/memory/detail/memory_block.h"
}

build() {
  # WITH_DISTRIBUTE=ON is not working now
  # maybe we could build it with gcc 8
  # for more related issue, report it to upstream
  cmake_opts=(
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_SKIP_INSTALL_RPATH=ON
    -DWITH_AVX=ON
    -DWITH_DISTRIBUTE=OFF
    -DWITH_MKL=OFF
    -DWITH_PYTHON=ON
    -DWITH_SYSTEM_BLAS=ON
    -DWITH_TESTING=OFF
)

  # building with CUDA
  cmake -B "${srcdir}/build-cuda" \
    -S "${srcdir}/${_pkgname}" \
    ${cmake_opts[@]} \
    -DCUDA_ARCH_BIN=${_CUDA_ARCH_LIST} \
    -DCUDA_ARCH_NAME="Manual" \
    -DWITH_GPU=ON
  make -C "${srcdir}/build-cuda"

  # building without CUDA
  cmake -B "${srcdir}/build" \
    -S "${srcdir}/${_pkgname}" \
    ${cmake_opts[@]} \
    -DWITH_GPU=OFF
  make -C "${srcdir}/build"
}

package_python-paddlepaddle-cuda() {
  pkgdesc="${pkgdesc} (with CUDA)"
  depends+=(
    cuda
    cudnn
    nccl
  )
  provides=(python-paddlepaddle)
  conflicts=(python-paddlepaddle)

  PIP_CONFIG_FILE=/dev/null find "${srcdir}/build-cuda" -type f -name "*.whl" -exec pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps {} \;
  python -O -m compileall "${pkgdir}"
}

package_python-paddlepaddle() {
  PIP_CONFIG_FILE=/dev/null find "${srcdir}/build" -type f -name "*.whl" -exec pip install --isolated --root="${pkgdir}" --ignore-installed --no-deps {} \;
  python -O -m compileall "${pkgdir}"
}
# vim:set ts=2 sw=2 et:
