# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jan Heczko <jan dot heczko at gmail dot com>
_base=ipyopt
pkgname=python-${_base}
pkgver=0.12.9
pkgrel=1
pkgdesc="Python interface to Ipopt"
arch=(x86_64)
url="https://gitlab.com/${_base}-devs/${_base}"
license=(BSD-3-Clause)
depends=(coin-or-ipopt python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel cython) # mumps
checkdepends=(python-scipy)
source=(${url}/-/archive/${pkgver}/${_base}-${pkgver}.tar.gz)
sha512sums=('318e1af30cc04a028bacd0ba787a66e5f17ef10ad57633c32f5b45b44dbd27161184e69e1a43481afcfc4e66c5957a631c253c6379a4e3d4d85cdabcb2b5bcb6')

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
