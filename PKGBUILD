# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.5
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=('x86_64')
url="https://github.com/py-nonlinopt/${_base}"
license=('custom')
depends=(coin-or-ipopt python-numpy)
makedepends=(cython python-setuptools) # mumps
checkdepends=(python-scipy python-sympy)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('d9ec3243e991cc0150f3c359449681fe634d60a9640faf440ae059c1c06cf14b1c58333f0f85fafb8229a8b73e55b4c568f52d672a250ac39f35c9a9c17bdd05')

prepare() {
  sed -i '11 a #include <functional>' ${_base}-${pkgver}/src/nlp_base.hpp
}

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
}

check() {
  cd ${_base}-${pkgver}
  python setup_test.py build_ext --inplace
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}/${_base}:${PYTHONPATH}" python -m unittest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
