pkgname=python-assimulo
pkgver=3.2.9
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('x86_64')
license=('LGPL')
makedepends=('python-setuptools' 'cython' 'gcc-fortran')
depends=('python-scipy' 'python-matplotlib' 'lapack' 'sundials')
source=("https://github.com/modelon-community/Assimulo/archive/Assimulo-${pkgver}.tar.gz")
sha256sums=('41b685f7306c38932f2fa1327eb19e2d9a6cfc57d1c8c5a4815dcd32d54289ef')

prepare() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver

  # use shared lib
  sed -i "s|BLASname_t+'.a'|BLASname_t+'.so'|g" setup.py

  curl -L https://github.com/modelon-community/Assimulo/pull/33.patch | patch -p1
}

build() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
}

package() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --lapack-home=/usr --extra-fortran-compile-flags="-fallow-argument-mismatch" --extra-c-flags="-DNPY_NO_DEPRECATED_API=NPY_1_7_API_VERSION"
}

