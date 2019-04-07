# Maintainer: otaj <jasek.ota@gmail.com>
# If you want to set only one GPU target compute capability, set _GPU_TARGET, otherwise leave it commented out and it will build default targets (35, 52, 60 and 61)

#_GPU_TARGET=61
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git' 'python2-faiss-cuda-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('BSD')
pkgver=v1.5.1.r0.g7f5b22b
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git 'cuda10.1.patch')
sha256sums=('SKIP'
            'b021ca0a3ecfc4cca41e4819a7d8fd0c73a46a3349b1d498d5ad786f1f6a0535')
depends=('blas' 'lapack' 'cuda')
makedepends=('python' 'python2' 'python-numpy' 'python2-numpy' 'swig' 'python-setuptools' 'python2-setuptools')


pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  cp -ar python python2
  sed -i 's/makefile.inc/makefile2.inc/g' python2/Makefile
  patch -Np1 < ../cuda10.1.patch
}


build() {
  cd "${srcdir}/${_pkgname}"
  _CONF_FLAGS="--prefix=/usr --with-cuda=/opt/cuda"
  if ! [ -z "$_GPU_TARGET" ]
  then
    _CONF_FLAGS="$_CONF_FLAGS --with-cuda-arch=-gencode=arch=compute_$_GPU_TARGET,code=compute_$_GPU_TARGET"
  fi
  ./configure $_CONF_FLAGS --with-python=python2
  mv makefile.inc makefile2.inc
  ./configure $_CONF_FLAGS --with-python=python
  make 			# build faiss
  make -C python  	# build python package
  make -C python2 	# build python2 package
}

package_faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version.'
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

package_python-faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version. Python wrappers'
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-numpy')

  cd "${srcdir}/${_pkgname}/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}

package_python2-faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version. Python2 wrappers'
  provides=('python2-faiss')
  conflicts=('python2-faiss')
  depends=('python2' 'python2-numpy')

  cd "${srcdir}/${_pkgname}/python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
