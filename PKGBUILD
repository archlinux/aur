# Maintainer: otaj <jasek.ota@gmail.com>
# You can set either "native" or "all" a GPU target
# If you want the python package to work with MKL, you need to have python-numpy-mkl installed!
# See https://github.com/facebookresearch/faiss/issues/1393

_GPU_TARGET="all"
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=v1.9.0.r84.g5637bb889
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack' 'cuda' 'openmp')
makedepends=('git' 'python' 'python-numpy' 'swig' 'python-setuptools' 'cmake' 'gflags')
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
  _CMAKE_FLAGS="\
    -DFAISS_ENABLE_GPU=ON \
    -DFAISS_ENABLE_PYTHON=ON \
    -DCUDAToolkit_ROOT=/opt/cuda \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_CUDA_ARCHITECTURES=$_GPU_TARGET "
  
  CC=gcc-13 CXX=g++-13 CUDAHOSTCXX=g++-13 cmake $_CMAKE_FLAGS ..
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

package_faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version.'
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}/build"
  make DESTDIR="$pkgdir" install
  cd ..
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version. Python wrappers'
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-numpy')

  cd "${srcdir}/${_pkgname}/build/faiss/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  cd ../../..
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
