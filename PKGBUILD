# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDMetrics
pkgname=python-${_base,,}
pkgver=0.10.1
pkgrel=1
pkgdesc="Metrics for Synthetic Data Generation Projects"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-scikit-learn python-copulas python-tqdm python-plotly)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest python-pomegranate)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0792c42348cea49a45c46139000882487d5bd52105db4ab0c53444bece52a7e50ae0941fff241acd544d964c2fe57387647ba307e713823d76652e7d56f03758')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not good[SVCParentChildDetection] and not num[NumericalLR] and not rank[BNLikelihood] and not rank[BNLogLikelihood] and not rank[MLPRegressor] and not fit and not rank[MulticlassMLPClassifier] and not rank[LSTMClassifierEfficacy] and not num[NumericalMLP] and not num[NumericalSVR] and not num[NumericalRadiusNearestNeighbor]'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
