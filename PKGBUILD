# Maintainer: otaj <jasek.ota@gmail.com>

_pkgname=faiss
pkgbase=faiss-git
pkgname=('faiss-git' 'python-faiss-git' 'python2-faiss-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=v1.5.2.r5.gd224d11
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack')
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
  ./configure --prefix=/usr --with-python=python2 --without-cuda
  mv makefile.inc makefile2.inc
  ./configure --prefix=/usr --with-python=python --without-cuda
  make clean
  make -C python clean
  make -C python2 clean
  make
  make -C python
  make -C python2
}

package_faiss-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
  install -Dm 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python-faiss-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors. Python wrappers'
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-numpy')

  cd "${srcdir}/${_pkgname}/python"
  python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

package_python2-faiss-git() {
  pkgdesc='A library for efficient similarity search and clustering of dense vectors. Python2 wrappers'
  provides=('python2-faiss')
  conflicts=('python2-faiss')
  depends=('python2' 'python2-numpy')

  cd "${srcdir}/${_pkgname}/python2"
  python2 setup.py install --root="$pkgdir/" --optimize=1 --skip-build
  install -Dm 644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
