# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=findiff
pkgname=python-${_base}
pkgdesc="Python package for finite difference derivatives in any number of dimensions"
pkgver=0.12.1
pkgrel=1
arch=(any)
url="https://github.com/maroba/${_base}"
license=(MIT)
depends=(python-scipy python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('402aaa2807cde0f67d90df320901db700c85dfadbec16ba0e7acd229d52834a1003fce76e2d585d8a39aa331c38f0615961f0b51b3cec61736737f770e790d9e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
