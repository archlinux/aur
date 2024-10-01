# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=optimistix
pkgname=python-${_base}
pkgdesc="Nonlinear optimisation in JAX and Equinox"
pkgver=0.0.8
pkgrel=1
arch=(any)
url="https://github.com/patrick-kidger/${_base}"
license=(Apache-2.0)
depends=(python-lineax)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest python-beartype)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('503dc67e5346bb68ea6d2be969982564896aa76a7ff3e2fd4179bcfcccdd55ef9558e4fb1ff7c62b8b41129b0770673fb6fd3972986a93c46144918301a3a229')

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
