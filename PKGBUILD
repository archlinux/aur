# Maintainer: otaj <jasek.ota@gmail.com>

_pkgname=faiss
pkgbase=faiss-git
pkgname=('faiss-git' 'python-faiss-git')
arch=('i686' 'x86_64')
url="https://github.com/facebookresearch/faiss"
license=('MIT')
pkgver=v1.6.0.r5.ge325c50
pkgrel=1
source=(${_pkgname}::git+https://github.com/facebookresearch/faiss.git)
sha256sums=('SKIP')
depends=('blas' 'lapack')
makedepends=('git' 'python' 'python-numpy' 'swig' 'python-setuptools')

pkgver() {
  cd "${_pkgname}"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd "${srcdir}/${_pkgname}"
}


build() {
  cd "${srcdir}/${_pkgname}"
  ./configure --prefix=/usr --with-python=python --without-cuda
  make
  make -C python
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
