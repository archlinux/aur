# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

_name=slycot
pkgname="python-${_name}"
pkgver=0.6.0
pkgrel=1
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/python-control/Slycot"
license=('GPL-2')
depends=('python>=3.10' 'python-numpy>=1.23.1')
makedepends=('python>=3.10' 'python-numpy>=1.23.1' 'python-scikit-build>=0.15' 'cmake>=3.14' 'gcc-fortran' 'blas' 'lapack' 'python-setuptools>=45' 'python-setuptools-scm>=8' 'python-wheel' 'python-scikit-build>=0.15')
opts=(!strip)
checkdepends=('python-scipy' 'python-pytest')
provides=('python-slycot')
conflicts=('python-slycot-git' 'python-slycot-mkl')
source=(https://files.pythonhosted.org/packages/a8/18/96acf7dcdc931d0c9a165a8aa3a6f3e6b145d0d69aea43ecef82b8611888/${_name}-${pkgver}.tar.gz)
sha256sums=('98ecf19cad0c6ce0d6f4db95169efc14f89a285ac24a4a8da1ca5b96b9da3c23')

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
  export PYTHONPATH="${srcdir}/${_name}-${pkgver}/_skbuild/linux-$CARCH-$python_version/setuptools/lib.linux-$CARCH-cpython-${python_version//./}/"
  pytest --pyargs ${_name}
}

package() {
  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/${_name}-${pkgver}"
  python -m installer --destdir="${pkgdir}" dist/*.whl

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

# vim:set ts=2 sw=2 et:
