# Maintainer: otaj <jasek.ota@gmail.com>
# If you want to set only one GPU target compute capability, set _GPU_TARGET, otherwise leave it commented out and it will build default targets (35, 52, 60 and 61)

#_GPU_TARGET=61
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git' 'python2-faiss-cuda-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('BSD')
pkgver=v1.5.0.r17.g7b07685
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
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
}


build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-cuda=/opt/cuda --with-python=python2
  if ! [ -z "$_GPU_TARGET" ]
  then
     sed -i "s/compute_[0-9][0-9]/compute_${_GPU_TARGET}/g" makefile.inc
     sed -i '$!N; /^\(.*\)\n\1$/!P; D' makefile.inc
  fi
  mv makefile.inc makefile2.inc
  ./configure --prefix=/usr --with-cuda=/opt/cuda --with-python=python
  if ! [ -z "$_GPU_TARGET" ]
  then
     sed -i "s/compute_[0-9][0-9]/compute_${_GPU_TARGET}/g" makefile.inc
     sed -i '$!N; /^\(.*\)\n\1$/!P; D' makefile.inc
  fi
  make 			# build faiss
  make -C gpu 		# build gpu part
  make -C python cpu	# build cpu python
  make -C python gpu 	# build gpu python
  make -C python build 	# build python package
  make -C python2 cpu	# build cpu python2
  make -C python2 gpu 	# build gpu python2
  make -C python2 build	# build python2 package
}

package_faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version.'
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
  make -C gpu DESTDIR="$pkgdir" install
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
