#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-numpy-git
_pkgname=numpy
pkgver=v1.25.0rc1.r193.g2e8994d3d1
pkgrel=1
pkgdesc="Scientific tools for Python - git version"
arch=('x86_64')
license=('custom:BSD 3-clause')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('python-nose: testsuite' 'openblas: faster linear algebra')
makedepends=('python-setuptools' 'gcc-fortran' 'python-nose' 'cython')
checkdepends=('python-pytest' 'python-hypothesis')
conflicts=('python-numpy')
provides=('python-numpy')
options=('staticlibs')
source=("git+https://github.com/numpy/numpy.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # https://github.com/numpy/numpy/issues/17390
    sed -i '/error/a \    ignore:Module already imported so cannot be rewritten' ${srcdir}/numpy/pytest.ini
}

build() {
    cd ${srcdir}/numpy
    git submodule update --init
    python setup.py build
}

check() {
  cd ${srcdir}/numpy
  python setup.py install --root="$PWD/tmp_install" --optimize=1
  cd "$PWD/tmp_install"
  PATH="$PWD/usr/bin:$PATH" PYTHONPATH="$PWD/usr/lib/python3.10/site-packages/:$PYTHONPATH" python -c 'import numpy; numpy.test()'
}

package() {
  cd ${srcdir}/numpy
  python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}
