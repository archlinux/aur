# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDMetrics
pkgname=python-${_base,,}
pkgver=0.15.1
pkgrel=1
pkgdesc="Metrics for Synthetic Data Generation Projects"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(MIT)
depends=(python-scikit-learn python-copulas python-tqdm python-plotly)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pomegranate)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('da7b6a2e3a550f0782f8669ac56c9130f7c947916497d18b383fc34edc56b3a42ccae08728ed05e241491831f7e96f1d53e45ee566ea8c7368471a1871aca47d')

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
