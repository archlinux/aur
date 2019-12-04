pkgname=python-assimulo
pkgver=3.1
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('i686' 'x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython' 'gcc-fortran' 'sundials' 'lapack')
depends=('python-scipy' 'python-matplotlib' 'lapack' 'sundials')
source=("Assimulo-${pkgver}::svn+https://svn.jmodelica.org/assimulo/tags/Assimulo-${pkgver}" sundials5.patch)
sha256sums=('SKIP' 'SKIP')

prepare() {
  cd "${srcdir}"/Assimulo-$pkgver

  # try to build with sundials 5.0
  patch -p0 -i "${srcdir}"/sundials5.patch

  # use shared lib
  sed -i "s|BLASname_t+'.a'|BLASname_t+'.so'|g" setup.py
}

build() {
  cp -r "${srcdir}"/Assimulo-$pkgver "${srcdir}"/Assimulo-Assimulo-$pkgver-py2
}

package() {
  cd "${srcdir}"/Assimulo-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --blas-name="blas" --lapack-home=/usr
}

