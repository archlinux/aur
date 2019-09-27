# Maintainer: Ben Greiner <code-arch at bnavigator dot de>
_name=slycot
pkgname=("python-${_name}" "python2-${_name}")
pkgver=0.3.5.0
pkgrel=1
pkgdesc="Python wrapper for selected SLICOT routines, notably including solvers for Riccati, Lyapunov and Sylvester equations."
arch=('i686' 'x86_64')
url="http://github.com/python-control/Slycot"
license=('GPL2')
depends=('python-numpy' 'python2-numpy')
makedepends=('git' 'cmake' 'gcc-fortran' 'lapack'
             'python-scikit-build>=0.8.1'
             'python2-scikit-build>=0.8.1'
             'python-nose' 'python2-nose'
             'python-coverage' 'python2-coverage'
             'python2-configparser')
opts=(!strip)
optdepends=()
provides=('python-slycot')
conflicts=('python-slycot-git')
source=(https://files.pythonhosted.org/packages/source/s/$_name/$_name-$pkgver.tar.gz)
sha256sums=('cad98d5ea4f0a034cf398c39189f587620a0b03f1d4b71e77cd622a327f13adf')

prepare() {
  cp -a ${_name}-$pkgver{,-py2}
}

build() {
  cd "$srcdir/${_name}-${pkgver}"
  python setup.py build -G "Unix Makefiles" -- -DF2PY_EXECUTABLE=/usr/bin/f2py3

  cd "$srcdir/${_name}-${pkgver}-py2"
  python2 setup.py build -G "Unix Makefiles" -- -DF2PY_EXECUTABLE=/usr/bin/f2py2
}

check() {
  export PYTHONDONTWRITEBYTECODE=1 

  cd "$srcdir/${_name}-${pkgver}"
  export PYTHONPATH="$PWD/_skbuild/linux-$CARCH-3.7/setuptools/lib"
  python runtests.py --coverage --no-build

  cd "$srcdir/${_name}-${pkgver}-py2"
  export PYTHONPATH="$PWD/_skbuild/linux-$CARCH-2.7/setuptools/lib"
  python2 runtests.py --coverage --no-build
}

package_python-slycot() {
  depends=('python-numpy')
  conflicts=('python-slycot-git')

  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}" --optimize=1 --skip-build -G "Unix Makefiles"
}

package_python2-slycot() {
  depends=('python2-numpy')
  conflicts=('python2-slycot-git')

  export LDFLAGS="$LDFLAGS -shared"

  cd "$srcdir/${_name}-${pkgver}-py2"
  python2 setup.py install --root="${pkgdir}" --optimize=1 --skip-build -G "Unix Makefiles"
}

# vim:set ts=2 sw=2 et:
