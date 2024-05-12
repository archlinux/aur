# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optimistix
pkgname=python-${_base}
pkgdesc="Nonlinear optimisation in JAX and Equinox"
pkgver=0.0.7
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-lineax)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('845d3b0e5fba4b3e186eff1a7839147961adc0c4fbd6b8d0d3e261b9bc191e6b396ca8b96a222842b1762b907e5f78bec70b0ddc6e30ab1e4e35acc73bc39529')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
