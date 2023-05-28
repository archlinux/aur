# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michael Straube <straubem@gmx.de>
# Contributor: Tanel K <tanel.kiis@gmail.com>
_base=pomegranate
pkgname=python-${_base}
pkgver=1.0.0
pkgrel=1
pkgdesc="A PyTorch implementation of probabilistic models"
arch=(x86_64)
url="https://github.com/jmschrei/${_base}"
license=(MIT)
depends=(python-scikit-learn python-pytorch python-apricot-select python-networkx)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-nose)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b40a1804e03b0d858a2f9bfe4da6cf2dae4cb7fd9130464e7560ebfe60ea6371a21d5332ce3428371f044cbdd44da4d80f482771a043e177913a9b318a8242d5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not sample and not learn_structure_chow_liu and not learn_structure_exact and not categorical_chow_liu and not categorical_chow_liu_weighted and not categorical_chow_liu_large and not categorical_chow_liu_large_pseudocount and not categorical_exact and not categorical_exact_weighted and not categorical_exact_exclude_parents and not categorical_exact_large and not categorical_exact_large_pseudocount and not categorical_learn_structure_chow_liu and not categorical_learn_structure_exact and not serialization'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
