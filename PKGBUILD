# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.3
pkgrel=2
pkgdesc="Python interface to Ipopt"
arch=('x86_64')
url="https://github.com/py-nonlinopt/${_base}"
license=('custom')
depends=(coin-or-ipopt python-numpy)
makedepends=(cython python-setuptools) # mumps
checkdepends=(python-scipy python-sympy)
source=(${url}/archive/${pkgver}.tar.gz)
sha512sums=('f1767d677ebc544f25ab22fa0ef97d2dadadc569a1f6aad70dd7c92b508fa7ecbe2952e2e923c54540298702fdb10ecf8ddd8e7b90941b9586fef527d841ed39')

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
