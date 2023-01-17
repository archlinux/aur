# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.6
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=('x86_64')
url="https://github.com/py-nonlinopt/${_base}"
license=('custom')
depends=(coin-or-ipopt python-numpy)
makedepends=(cython python-setuptools) # mumps
checkdepends=(python-scipy python-sympy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a072f76aaae8b5b7c6bb7a10bee1ba0d67c75c64e71251f887a3fc3f00d6ddd32cedd6238034c177d6314b927e9e8e88cb80bf1843165c71c48d1cfaa5da0fc6')

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
