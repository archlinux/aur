# Maintainer: otaj <jasek.ota@gmail.com>

_pkgname=faiss
pkgbase=faiss-git
pkgname=('faiss-git' 'python-faiss-git' 'python2-faiss-git')
pkgdesc='A library for efficient similarity search and clustering of dense vectors.'
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('BSD')
pkgver=v1.5.0.r17.g7b07685
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack')

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
  ./configure --prefix=/usr
  make
}

package_faiss-git() {
  provides=('faiss')
  conflicts=('faiss')
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="$pkgdir" install
}

package_python-faiss-git() {
  provides=('python-faiss')
  conflicts=('python-faiss')
  depends=('python' 'python-setuptools' 'python-numpy' 'swig')

  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-python=python
  cd python
  make cpu
  python setup.py install --root="$pkgdir/" --optimize=1
}

package_python2-faiss-git() {
  provides=('python2-faiss')
  conflicts=('python2-faiss')
  depends=('python2' 'python2-setuptools' 'python2-numpy' 'swig')

  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-python=python2
  cd python2
  make cpu
  python2 setup.py install --root="$pkgdir/" --optimize=1
}
