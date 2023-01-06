# Maintainer: Gustavo Alvarez <sl1pkn07@gmail.com>

pkgname=python-pytorch-tensorrt
pkgver=1.3.0
pkgrel=1
pkgdesc="PyTorch/TorchScript/FX compiler for NVIDIA GPUs using TensorRT"
arch=('x86_64')
url='https://github.com/pytorch/TensorRT'
license=('BSD')
depends=('python-pytorch-opt-cuda'
         'python-tensorrt'
         'python-torchvision-cuda'
         'python-graphviz'
         'python-pydot'
         )
makedepends=('git'
             'cmake'
             'python-pip'
             )
source=("git+https://github.com/pytorch/TensorRT.git#tag=v${pkgver}")
sha256sums=('SKIP')
options=('debug')

prepare() {
  mkdir -p path
  (cd path; ln -s /usr/bin/true bazel)

  sed '2i#include <fstream>' -i TensorRT/core/runtime/TRTEngine.cpp
}

build() {

  export CXXFLAGS+=" -std=c++14"
  export PATH="${PATH}:${srcdir}/path"

  cmake -S TensorRT -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_SKIP_RPATH=ON \
    -DCMAKE_SKIP_INSTALL_RPATH=ON

  cmake --build build

  cd TensorRT/py
  LDFLAGS+=" -L${srcdir}/build/lib" \
  python setup.py bdist_wheel --release --use-cxx11-abi
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  cd TensorRT/py
  pip install -I -U --root "${pkgdir}" --no-warn-script-location --no-deps dist/*.whl
  _site_packages="$(python -c 'import sysconfig; print(sysconfig.get_paths()["purelib"])')"
  (mkdir -p "${pkgdir}${_site_packages}/torch_tensorrt/lib"; ln -s /usr/lib/libtorchtrt.so "${pkgdir}${_site_packages}/torch_tensorrt/lib/libtorchtrt.so")


  install -Dm644 "${srcdir}/TensorRT/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
