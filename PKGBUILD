_name=slycot
pkgname="python-${_name}"
pkgver=0.4.0.0
pkgrel=3
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/python-control/Slycot"
license=('GPL2')
depends=('python-numpy')
makedepends=(
             'blas'
             'cmake'
             'gcc-fortran'
             'lapack'
             'python-coverage'
             'python-pytest'
             'python-scipy'
             'python-scikit-build>=0.8.1'
             'python-setuptools')
opts=(!strip)
optdepends=()
provides=('python-slycot')
conflicts=('python-slycot-git')
source=(https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz)
sha256sums=('1d9921e9b04a5b9892870fd3481f7b08e6fa083a1a3848ad262819de19eb5e02')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  # Link against the Generic NetLIB blas/lapack ABI. If openblas is installed
  # instead of blas, that one will provide the library. Same mechanism as in
  # Extra/python-numpy
  export BLA_VENDOR=Generic
  python setup.py build -G "Unix Makefiles"
}

check() {
  export PYTHONDONTWRITEBYTECODE=1 
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="${srcdir}/${_name}-${pkgver}/_skbuild/linux-$CARCH-$python_version/setuptools/lib"
  pytest --pyargs slycot
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build -G "Unix Makefiles"

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
