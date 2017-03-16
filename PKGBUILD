# Maintainer: Stephen Zhang <stephen at gmail dot com>

pkgbase="python-pytorch"
pkgname=("python-pytorch" "python2-pytorch")
_pkgname="pytorch"
pkgver=0.1.10
pkgrel=1
pkgdesc="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
arch=('x86_64')
url="http://pytorch.org"
license=('BSD')
makedepends=('python' 'python-setuptools' 'python2' 'python2-setuptools' 'gcc5')
depends=('cuda' 'cudnn')
source=("https://github.com/pytorch/pytorch/archive/v${pkgver}.tar.gz")
sha256sums=('8ca58a7ab55b65bce804bf7acd55369412b6fcdc08daa4bafafb4e10c403202e')


prepare() {
  cd "$srcdir/"

  cp -a "${_pkgname}-${pkgver}" "${_pkgname}-${pkgver}-py2"
  cd "${_pkgname}-${pkgver}"
  sed -e "s|#![ ]*/usr/bin/python$|#!/usr/bin/python2|" \
      -e "s|#![ ]*/usr/bin/env python$|#!/usr/bin/env python2|" \
      -e "s|#![ ]*/bin/env python$|#!/usr/bin/env python2|" \
      -i $(find . -name '*.py')
}

build() {
  msg "Building Python 2"
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  CC=gcc-5 \
  CXX=g++-5 \
  WITH_CUDA=1 \
  CUDA_HOME=/opt/cuda \
  WITH_CUDNN=1 \
  CUDNN_LIB_DIR=/opt/cuda/lib64 \
  CUDNN_INCLUDE_DIR=/opt/cuda/include \
  python2 setup.py build

  msg "Building Python 3"
  cd "$srcdir/${_pkgname}-${pkgver}"
  CC=gcc-5 \
  CXX=g++-5 \
  WITH_CUDA=1 \
  CUDA_HOME=/opt/cuda \
  WITH_CUDNN=1 \
  CUDNN_LIB_DIR=/opt/cuda/lib64 \
  CUDNN_INCLUDE_DIR=/opt/cuda/include \
  python setup.py build
}

package_python2-pytorch() {
  depends+=('python2' 'python2-ymal' 'python2-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}-py2"
  python2 setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

package_python-pytorch() {
  depends+=('python' 'python-ymal' 'python-numpy')
  cd "$srcdir/${_pkgname}-${pkgver}"
  python setup.py install --root="$pkgdir"/ --optimize=1 --skip-build
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
