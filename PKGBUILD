# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDMetrics
pkgname=python-${_base,,}
pkgver=0.11.1
pkgrel=1
pkgdesc="Metrics for Synthetic Data Generation Projects"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(MIT)
depends=(python-scikit-learn python-copulas python-tqdm python-plotly)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest python-pomegranate)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('1aecc352d78fba780cc7318d74822d481a4eb037df4cf9a069b40aee67404eaeae8f08c7454dc100560f1671ef19e1aed7a447dd8c4d28c8fae592beaf74213c')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not fit'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
