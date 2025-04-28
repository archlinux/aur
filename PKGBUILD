# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.10
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=(x86_64)
url="https://gitlab.com/${_base}-devs/${_base}"
license=(BSD-3-Clause)
depends=(coin-or-ipopt python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel cython) # mumps
checkdepends=(python-scipy)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('dd6da44495ecf4a1a8d4a3f2af947f3c80fd77a03d1b96ce605f35eda387fddf65486c9abcba8f012db081f07bd6c519d8b338d9c28e80351e9b3db41cb78684')

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
