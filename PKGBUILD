# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=RDT
pkgname=python-${_base,,}
pkgver=1.9.1
pkgrel=1
pkgdesc="Reversible Data Transforms"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-pandas python-scikit-learn python-psutil python-faker)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest-subtests python-copulas)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('919a74926021338effa2a965a37e117366490c16b4dd9ab63bbea466a87c4eb3fb0b9e4b47bcb4fb6eed2bff88e2c545a5c955cfad87cebc5111783daef67519')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not performance'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
