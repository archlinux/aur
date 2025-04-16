# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDMetrics
pkgname=python-${_base,,}
pkgver=0.20.1
pkgrel=1
pkgdesc="Metrics for Synthetic Data Generation Projects"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(MIT)
depends=(python-scikit-learn python-copulas python-tqdm python-plotly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pomegranate)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('053cad131209287259d43d4783bc90a990f74bd4e6126e34ac0815be3e01f1b1f926c786dd5861da97fca31a4e2b40664a39eadae906c50308568b81ac151944')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not rank[LSTMClassifierEfficacy] and not fit'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
