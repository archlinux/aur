pkgname=python-assimulo
pkgver=3.7.2
pkgrel=1
pkgdesc="A package for solving ordinary differential equations and differential algebraic equations"
url="http://www.jmodelica.org/assimulo"
arch=('x86_64')
license=(LGPL-3.0)
makedepends=(python-setuptools cython gcc-fortran)
depends=(glibc python python-scipy python-numpy python-matplotlib sundials superlu_mt)
source=("https://github.com/modelon-community/Assimulo/archive/Assimulo-${pkgver}.tar.gz")
sha256sums=('391ee8e7cd4ec768de0fcf4ba39c5ef1928f67b3f3d1391019c381322321899c')


prepare() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
  # use shared lib
  sed -i "s|BLASname_t+'.a'|BLASname_t+'.so'|g" setup.py

  # fix blas lib name
  sed -i "s|blas_OPENMP|blas|g" setup.py

  # avoid error with eigen_blas lib
  sed -i 's|potential_files.sort(reverse=True)|potential_files = ["superlu_mt_OPENMP"]|g' setup.py

  # actual path is /usr/include/superlu_mt/supermatrix.h
  sed -i "s|self.SLUincdir = os.path.join(self.SLUdir,'include')|self.SLUincdir = os.path.join(self.SLUdir, 'include', 'superlu_mt')|g" setup.py
}

package() {
  cd "${srcdir}"/Assimulo-Assimulo-$pkgver
  python setup.py install --root=${pkgdir} --optimize=1 --extra-fortran-link-flags="-shared" --sundials-home=/usr --blas-home=/usr/lib --lapack-home=/usr --superlu-home=/usr --extra-c-flags="-DNPY_NO_DEPRECATED_API=NPY_1_7_API_VERSION"
}

