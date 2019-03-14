# Maintainer: otaj <jasek.ota@gmail.com>
# If you want to set only one GPU target compute capability, set _GPU_TARGET, otherwise leave it commented out and it will build default targets (35, 52, 60 and 61)

#_GPU_TARGET=61
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git' 'python2-faiss-cuda-git')
pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('BSD')
pkgver=v1.5.0.r17.g7b07685
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack' 'cuda')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  cp -ar python python2
}


build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-cuda=/opt/cuda
  if ! [ -z "$_GPU_TARGET" ]
  then
     sed -i "s/compute_[0-9][0-9]/compute_${_GPU_TARGET}/g" makefile.inc
     sed -i '$!N; /^\(.*\)\n\1$/!P; D' makefile.inc
  fi
  make
  make -C gpu
}

package_faiss-cuda-git() {
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
  make -C gpu DESTDIR="$pkgdir" install
}

package_python-faiss-cuda-git() {
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-setuptools' 'python-numpy' 'swig')

  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-python=python --with-cuda=/opt/cuda
  if ! [ -z "$_GPU_TARGET" ]
  then
     sed -i "s/compute_[0-9][0-9]/compute_${_GPU_TARGET}/g" makefile.inc
     sed -i '$!N; /^\(.*\)\n\1$/!P; D' makefile.inc
  fi
  cd python
  make cpu
  make gpu
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-faiss-cuda-git() {
  provides=('python2-faiss')
  conflicts=('python2-faiss')
  depends=('python2' 'python2-setuptools' 'python2-numpy' 'swig')

  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-python=python2 --with-cuda=/opt/cuda
  if ! [ -z "$_GPU_TARGET" ]
  then
     sed -i "s/compute_[0-9][0-9]/compute_${_GPU_TARGET}/g" makefile.inc
     sed -i '$!N; /^\(.*\)\n\1$/!P; D' makefile.inc
  fi
  cd python2
  make cpu
  make gpu
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
