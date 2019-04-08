# Maintainer: Sven-Hendrik Haase <sh@lutzhaase.com>
# Contributor: Stephen Zhang <zsrkmyn at gmail dot com>

pkgbase="python-pytorch"
pkgname=("python-pytorch" "python-pytorch-cuda")
_pkgname="pytorch"
pkgver=1.0.1
pkgrel=6
pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
arch=('x86_64')
url="https://pytorch.org"
license=('BSD')
depends=('python' 'python-yaml' 'python-numpy' 'opencv' 'nccl')
makedepends=('python' 'python-setuptools' 'python-yaml' 'python-numpy' 'cmake' 'cuda' 'cudnn' 'git')
source=("${_pkgname}-${pkgver}::git+https://github.com/pytorch/pytorch.git#tag=v$pkgver")
sha256sums=('SKIP')

prepare() {
  cd "${_pkgname}-${pkgver}"

  # This is the lazy way since pytorch has sooo many submodules and they keep
  # changing them around but we've run into more problems so far doing it the
  # manual than the lazy way. This lazy way (not explicitly specifying all
  # submodules) will make building inefficient but for now I'll take it.
  # It will result in the same package, don't worry.
  git submodule update --init --recursive

  cd ..

  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-cuda"
}

build() {
  export CC=gcc
  export CXX=g++
  export PYTORCH_BUILD_VERSION=${pkgver}
  export PYTORCH_BUILD_NUMBER=1

  echo "Building without cuda"
  export NO_CUDA=1
  export WITH_CUDNN=0
  export USE_OPENCV=1
  export BUILD_BINARY=1

  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py build

  echo "Building with cuda"
  export NO_CUDA=0
  export WITH_CUDNN=1
  export CUDAHOSTCXX=g++
  export CUDA_HOME=/opt/cuda
  export CUDNN_LIB_DIR=/usr/lib
  export CUDNN_INCLUDE_DIR=/usr/include
  export TORCH_NVCC_FLAGS="-Xfatbin -compress-all"
  export TORCH_CUDA_ARCH_LIST="3.0;3.2;3.5;3.7;5.0;5.2;5.3;6.0;6.1;6.2;7.0;7.2;7.5"

  cd "$srcdir/${_pkgname}-${pkgver}-cuda"
  python setup.py build
}

package_python-pytorch() {
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-pytorch-cuda() {
  depends+=('cuda' 'cudnn')
  provides=('python-pytorch')
  conflicts=('python-pytorch')
  cd "$srcdir/${_pkgname}-${pkgver}-cuda"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
