# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-pytorch-tensorrt
pkgver=1.4.0
pkgrel=1
pkgdesc="PyTorch/TorchScript/FX compiler for NVIDIA GPUs using TensorRT"
arch=('x86_64')
url='https://github.com/pytorch/TensorRT'
license=('BSD')
depends=(
  'python-pytorch-opt-cuda'
  'python-tensorrt'
  'python-torchvision-cuda'
  'python-graphviz'
  'python-pydot'
)
makedepends=(
  'git'
  'cmake'
  'ninja'
  'cuda'
  'python-build'
  'python-wheel'
  'python-installer'
  'python-setuptools'
)
source=("git+https://github.com/pytorch/TensorRT.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('debug')

prepare() {
  mkdir -p path
  (cd path; ln -s /usr/bin/true bazel)

  sed '2i#include <fstream>' -i TensorRT/core/runtime/TRTEngine.cpp
  sed '5i#include <cstdint>' -i TensorRT/core/util/Exception.h
  sed '4i#include <cstdint>' -i TensorRT/core/util/Exception.cpp

  # CXX 17
  sed 's|CMAKE_CXX_STANDARD 14|CMAKE_CXX_STANDARD 17|g' -i TensorRT/CMakeLists.txt
}

build() {
  export CC=/opt/cuda/bin/gcc
  export CXX=/opt/cuda/bin/g++
  export CXXFLAGS+=" -std=c++17"
  export PATH="${srcdir}/path:${PATH}"

  cmake -S TensorRT -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DCUDA_HOST_COMPILER=/opt/cuda/bin/g++

  cmake --build build

  cd TensorRT/py
  LDFLAGS+=" -L${srcdir}/build/lib" \
  python setup.py bdist_wheel --release --use-cxx11-abi
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd TensorRT/py
  python -m installer --destdir="${pkgdir}" dist/*.whl
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
  (mkdir -p "${pkgdir}${_site_packages}/torch_tensorrt/lib"; ln -s /usr/lib/libtorchtrt.so "${pkgdir}${_site_packages}/torch_tensorrt/lib/libtorchtrt.so")


  install -Dm644 "${srcdir}/TensorRT/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
