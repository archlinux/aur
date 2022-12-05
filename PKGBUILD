# Maintainer: otaj <jasek.ota@gmail.com>
# If you want the python package to work with MKL, you need to have python-numpy-mkl installed!
# See https://github.com/facebookresearch/faiss/issues/1393

_pkgname=faiss
pkgbase=faiss-git
pkgname=('faiss-git' 'python-faiss-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=v1.7.3.r10.ga996a4a0
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack' 'openmp')
makedepends=('git' 'python' 'python-numpy' 'swig' 'python-setuptools' 'cmake')
optdepends=('intel-mkl: To use MKL blas implemenetation' 'python-numpy-mkl: To use MKL blas implementation.')
checkdepends=('python-pytest' 'python-scipy')

pkgver() {
  cd "${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
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
  PYTHONPATH="${srcdir}/${_pkgname}/build/${_pkgname}/python" python -c "import faiss; import faiss.contrib"
  cd "${srcdir}/${_pkgname}/tests"
  PYTHONPATH="${srcdir}/${_pkgname}/build/${_pkgname}/python" pytest
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
