# Maintainer: otaj <jasek.ota@gmail.com>
# If you want to set only one GPU target compute capability, set _GPU_TARGET, otherwise leave it commented out and it will build default targets (35, 52, 60 and 61). You can also set multiple targets separated by space (bash array)

#_GPU_TARGET="61"
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git' 'python2-faiss-cuda-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=v1.5.2.r5.gd224d11
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack' 'cuda')
makedepends=('git' 'python' 'python2' 'python-numpy' 'python2-numpy' 'swig' 'python-setuptools' 'python2-setuptools')


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
  _CONF_FLAGS='--prefix=/usr --with-cuda=/opt/cuda'
  if ! [ -z "$_GPU_TARGET" ]
  then
    _CONF_FLAGS=$_CONF_FLAGS" --with-cuda-arch=\""
    for _ARCH in ${_GPU_TARGET[@]} ; do
      _CONF_FLAGS=$_CONF_FLAGS"-gencode=arch=compute_${_ARCH},code=sm_${_ARCH} "
    done
    _CONF_FLAGS=$_CONF_FLAGS'"'
  fi
  sh -c "./configure $_CONF_FLAGS --with-python=python2" # what an ugliness! I don't know how to do it better though
  mv makefile.inc makefile2.inc
  sh -c "./configure $_CONF_FLAGS --with-python=python"
  make clean
  make -C python clean
  make -C python2 clean
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
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version. Python wrappers'
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-numpy')

  cd "${srcdir}/${_pkgname}/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-faiss-cuda-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors, CUDA version. Python2 wrappers'
  provides=('python2-faiss')
  conflicts=('python2-faiss')
  depends=('python2' 'python2-numpy')

  cd "${srcdir}/${_pkgname}/python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
