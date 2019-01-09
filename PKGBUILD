pkgbase=python-assimulo
pkgname=('python-assimulo' 'python2-assimulo')
pkgver=3.0
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'python2-setuptools' 'cython' 'cython2' 'gcc-fortran' 'sundials' 'lapack')
source=("https://github.com/modelon/Assimulo/archive/Assimulo-${pkgver}.tar.gz" sundials4.patch)
sha256sums=('6a1437af8ea0c9af3c0afa1efb44f5d1e11edfec1250ce3510f9e33397a04e6b'
            'SKIP')

prepare() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver

  # try to build with sundials 4.0
  patch -p0 -i "${srcdir}"/sundials4.patch

  # use shared lib
  sed -i "s|BLASname_t+'.a'|BLASname_t+'.so'|g" setup.py
}

build() {
  cp -r "${srcdir}"/Assimulo-Assimulo-$pkgver "${srcdir}"/Assimulo-Assimulo-$pkgver-py2
}

package_python-assimulo() {
  depends=('python-scipy' 'python-matplotlib' 'lapack' 'sundials')

  cd "${srcdir}/Assimulo-Assimulo-$pkgver"
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --blas-name="blas" --lapack-home=/usr
}

package_python2-assimulo() {
  depends=('python2-numpy' 'python2-matplotlib' 'lapack' 'sundials')

  cd "${srcdir}/Assimulo-Assimulo-$pkgver-py2"
  python2 setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --blas-name="blas" --lapack-home=/usr
}
