# Maintainer: otaj <jasek.ota@gmail.com>
# If you want the python package to work with MKL, you need to have python-numpy-mkl installed!
# See https://github.com/facebookresearch/faiss/issues/1393

_pkgname=faiss
pkgbase=faiss-git
pkgname=('faiss-git' 'python-faiss-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=1.6.1.r90.g9873376
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git
	'tests.patch')
sha256sums=('SKIP'
            '0e90164da283d87b2ad176449b1ba441b7ce0c6343aa4dbb8d268483bf805ccd')
depends=('blas' 'lapack' 'openmp')
makedepends=('git' 'python' 'python-numpy' 'swig' 'python-setuptools' 'cmake')
optdepends=('intel-mkl')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 < ../tests.patch # see https://github.com/facebookresearch/faiss/issues/1394
  mkdir -p build
  cd build
  cmake .. \
    -DFAISS_ENABLE_GPU=OFF \
    -DFAISS_ENABLE_PYTHON=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DBUILD_TESTING=ON
}

check() {
  cd "${srcdir}/${_pkgname}/build"
  make test
  cd "${srcdir}/${_pkgname}/tests"
  PYTHONPATH=../build/faiss/python:$PYTHONPATH pytest
}

build() {
  cd "${srcdir}/${_pkgname}/build"
  make
  cd faiss/python
  python setup.py build
}

package_faiss-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir" install
  cd ..
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-faiss-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors. Python wrappers'
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-numpy')

  cd "${srcdir}/${_pkgname}/build/faiss/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  cd ../../..
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
