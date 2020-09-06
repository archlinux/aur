# Maintainer: otaj <jasek.ota@gmail.com>
# If you want to set only one GPU target compute capability, set _GPU_TARGET, otherwise leave it commented out and it will build default targets (52, 60, 61, 70 and 75). You can also set multiple targets separated by a space

#_GPU_TARGET="75"
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=1.6.1.r90.g9873376
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git
        'compiler.patch'
	'tests.patch')
sha256sums=('SKIP'
            '3739947d39ebffb2775607f135743cd30489aa12f41c14e3aec42fbe79822fd3'
            '0e90164da283d87b2ad176449b1ba441b7ce0c6343aa4dbb8d268483bf805ccd')
depends=('blas' 'lapack' 'cuda' 'openmp')
makedepends=('git' 'python' 'python-numpy' 'swig' 'python-setuptools' 'gcc9')
optdepends=('intel-mkl')


pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  patch -p1 < ../compiler.patch # see https://github.com/facebookresearch/faiss/issues/1392
  patch -p1 < ../tests.patch # see https://github.com/facebookresearch/faiss/issues/1394
  mkdir -p build
  cd build
  _CMAKE_FLAGS="\
    -DFAISS_ENABLE_GPU=ON \
    -DFAISS_ENABLE_PYTHON=ON \
    -DCUDAToolkit_ROOT=/opt/cuda \
    -DCMAKE_BUILD_TYPE=Release \
    -DBUILD_TESTING=ON \
    -DCMAKE_INSTALL_PREFIX=/usr "
  if ! [ -z "$_GPU_TARGET" ]
  then
    _CMAKE_FLAGS=$_CMAKE_FLAGS"-DCMAKE_CUDA_ARCHITECTURES=\""$_GPU_TARGET"\""
  else
    _CMAKE_FLAGS=$_CMAKE_FLAGS"-DCMAKE_CUDA_ARCHITECTURES=\"\"52 60 61 70 75\"\""
  fi
  echo $_CMAKE_FLAGS
  cmake $_CMAKE_FLAGS ..
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
