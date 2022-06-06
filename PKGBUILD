# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.4
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=('x86_64')
url="https://github.com/py-nonlinopt/${_base}"
license=('custom')
depends=(coin-or-ipopt python-numpy)
makedepends=(cython python-setuptools) # mumps
checkdepends=(python-scipy python-sympy)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('80c5c02fd4396afd6f7e1734fba76bd0bcc48807bb3c28f86900de43cd633cc8708052f287ce520cdfa55c16d7f681a41e8e2804a4176a6a879ebcaf5d9b60bd')

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
