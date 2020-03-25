# Maintainer: otaj <jasek.ota@gmail.com>
# If you want to set only one GPU target compute capability, set _GPU_TARGET, otherwise leave it commented out and it will build default targets (35, 52, 60 and 61). You can also set multiple targets separated by space (bash array)

#_GPU_TARGET="75"
_pkgname=faiss
pkgbase=faiss-cuda-git
pkgname=('faiss-cuda-git' 'python-faiss-cuda-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=v1.6.1.r16.gb9914eb
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack' 'cuda')
makedepends=('git' 'python' 'python-numpy' 'swig' 'python-setuptools')


pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
  rm -f gpu/impl/{PQScanMultiPassNoPrecomputed.cu,gpu/impl/PQCodeDistances.cu}
  _CONF_FLAGS='--prefix=/usr --with-cuda=/opt/cuda'
  if ! [ -z "$_GPU_TARGET" ]
  then
    _CONF_FLAGS=$_CONF_FLAGS" --with-cuda-arch=\""
    for _ARCH in ${_GPU_TARGET[@]} ; do
      _CONF_FLAGS=$_CONF_FLAGS"-gencode=arch=compute_${_ARCH},code=sm_${_ARCH} "
    done
    _CONF_FLAGS=$_CONF_FLAGS'"'
  fi
  sh -c "./configure $_CONF_FLAGS --with-python=python"

}


build() {
  cd "${srcdir}/${_pkgname}"
  make			# build faiss
  make -C python	# build python package
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
