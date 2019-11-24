_name=slycot
pkgname="python-${_name}"
pkgver=0.3.5.0
pkgrel=2
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/python-control/Slycot"
license=('GPL2')
depends=('python-numpy')
makedepends=('git' 'cmake' 'gcc-fortran' 'lapack'
             'python-scikit-build>=0.8.1'
             'python-nose'
             'python-coverage')
opts=(!strip)
optdepends=()
provides=('python-slycot')
conflicts=('python-slycot-git')
source=(https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz)
sha256sums=('cad98d5ea4f0a034cf398c39189f587620a0b03f1d4b71e77cd622a327f13adf')

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build -G "Unix Makefiles" -- -DF2PY_EXECUTABLE=/usr/bin/f2py3
}

check() {
  export PYTHONDONTWRITEBYTECODE=1 

  cd "$srcdir/${_name}-${pkgver}"
  export PYTHONPATH="$PWD/_skbuild/linux-$CARCH-3.7/setuptools/lib"
  python runtests.py --coverage --no-build
}

package() {
  depends=('python-numpy')
  conflicts=('python-slycot-git')

  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build -G "Unix Makefiles"
}

# vim:set ts=2 sw=2 et:
