# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyccel
pkgname=python-${_base}
pkgdesc="Python extension language using accelerators"
pkgver=2.1.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-filelock python-numpy python-sympy python-termcolor python-textx python-packaging)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7fadb3381fb81fc16666f34f44d7e62c8c2210ca56e197e1912fc034135e46cc7ae2d41e14eeeea52522d37a180dd2b690d6cc164cd808c9b2acbeed2926a1f8')

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
