# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Copulas
pkgname=python-${_base,,}
pkgver=0.8.0
pkgrel=1
pkgdesc="Create tabular synthetic data using copulas-based modeling"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-matplotlib python-pandas python-scipy)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1b4f432a100ecaf28897996d344e37970f6d7a2dcb9244e4be2c00dc0b5bf32d36208bf0a9daebc776f60d4999b591cd792f5a1e76ef602faace22b7aea9def1')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not gaussian_kde'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
