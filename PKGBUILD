# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.7
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=('x86_64')
url="https://github.com/py-nonlinopt/${_base}"
license=('custom:BSD-3-clause')
depends=(coin-or-ipopt python-numpy)
makedepends=(cython python-setuptools) # mumps
checkdepends=(python-scipy python-sympy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('b69b4f605244227ad8945bcbb815699c607ab90987656a73bbfc1218af7c54ef9f1d3ec7d5bc3cf95f0d38f3eb2fb93939a6ee916cd4bcf2b58d8ea62c3bb176')

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
