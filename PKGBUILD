# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDMetrics
pkgname=python-${_base,,}
pkgver=0.10.0
pkgrel=1
pkgdesc="Metrics for Synthetic Data Generation Projects"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-scikit-learn python-copulas python-tqdm python-plotly)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest python-pomegranate)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c29a2e7b8a9c7485e9b9e5ea2e8491830065cdf22ca69d47bf4554c043810826daa3bea8dd389a01f31f6976c5bb4e11ba6af8fdd1225e4d75aff710654434bd')

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
