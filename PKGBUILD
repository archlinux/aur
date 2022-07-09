_name=slycot
pkgname="python-${_name}"
pkgver=0.5.0.0
pkgrel=1
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
             'python-build'
             'python-installer'
             'python-scikit-build>=0.14.1'
             'python-setuptools'
             'python-numpy<1.23.0')
opts=(!strip)
optdepends=()
checkdepends=('python-pytest' 'python-scipy')
provides=('python-slycot')
conflicts=('python-slycot-git')
source=(https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz)
sha256sums=('8c80e45d09000bf41a5f30794608844d4aa3410df6442cbe92e82d5ff7c2f330')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  # Link against the Generic NetLIB blas/lapack ABI. If openblas is installed
  # instead of blas, that one will provide the library. Same mechanism as in
  # Extra/python-numpy
  export BLA_VENDOR=Generic
  export CMAKE_GENERATOR="Unix Makefiles"
  # -x: don't check for cmake python metadata
  python -m build --wheel --no-isolation -x
}

check() {
  export PYTHONDONTWRITEBYTECODE=1 
  local python_version=$(python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
  export PYTHONPATH="${srcdir}/${_name}-${pkgver}/_skbuild/linux-$CARCH-$python_version/setuptools/lib"
  pytest --pyargs slycot -k "not (test_mb03rd or test_tg01fd)"
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
