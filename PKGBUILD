#Maintainer: Dylan Delgado <dylan1496 at live dot com>

pkgname=python-numpy-git
_pkgname=numpy
pkgver=2.0.0.dev0.r1851.g94bc56402a
pkgrel=1
pkgdesc="Scientific tools for Python - git version"
arch=('x86_64')
license=('custom:BSD 3-clause')
url="https://www.numpy.org/"
depends=('cblas' 'lapack' 'python')
optdepends=('python-nose: testsuite' 'blas-openblas: faster linear algebra')
makedepends=('python-build' 'python-installer' 'python-wheel' 'gcc-fortran' 'python-nose' 'cython' 'python-pyproject-metadata' 'patchelf' 'meson-python')
checkdepends=('python-pytest' 'python-hypothesis')
conflicts=('python-numpy')
provides=('python-numpy')
options=('staticlibs')
source=("git+https://github.com/numpy/numpy.git")
sha512sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # https://github.com/numpy/numpy/issues/17390
    git -C "${srcdir}/numpy" clean -dfx
    sed -i '/error/a \    ignore:Module already imported so cannot be rewritten' ${srcdir}/numpy/pytest.ini
}

build() {
    cd ${srcdir}/numpy
    git submodule update --init
    python -m build --wheel --no-isolation
}

#At present, check() fails with an ImportError
#check() {
    #cd ${srcdir}/numpy
    #local python_version=$(python -c 'import sys; print("".join(map(str, sys.version_info[:2])))')
    #PYTHONPATH="$PWD/build/lib.linux-$CARCH-cpython-${python_version}" pytest
#}

package() {
  cd ${srcdir}/numpy
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -m755 -d "${pkgdir}/usr/share/licenses/python-numpy"
  install -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/python-numpy/"
}
