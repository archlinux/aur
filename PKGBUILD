# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.2
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=('x86_64')
url="https://github.com/py-nonlinopt/${_base}"
license=('custom')
depends=(coin-or-ipopt python-numpy)   # swig
makedepends=(cython python-setuptools) # mumps
checkdepends=(python-scipy python-sympy)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('2be72fa55e70868b921b590af3652a6ba0a00c504f24acacb737f0a00ffa10091416082a7bcebeb25c5282ab2410ca9f9fc85e8efd822f31df4a8fb19dca24b2')

prepare() {
  sed -i '7 a #include <optional>' ${_base}-${pkgver}/src/ipyopt_module.cpp
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
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
