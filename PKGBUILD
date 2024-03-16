# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.8
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=(x86_64)
url="https://gitlab.com/${_base}-devs/${_base}"
license=(BSD-3-Clause)
depends=(coin-or-ipopt python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel cython) # mumps
checkdepends=(python-scipy)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('c999cbf5f0842f9e9b2c86338733b1e682071369f2fb574dbd7352631e7e7c2e9ddb76ca5d72a9ba8d0de99e705372504dcf1d9c7874b1363b8f345ce6dc5a07')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python setup_test.py build_ext --inplace
  local _pyversion=$(python -c "import sys; print(f'{sys.version_info.major}.{sys.version_info.minor}')")
  PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}/${_base}:${PYTHONPATH}" python -m unittest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
