# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Copulas
pkgname=python-${_base,,}
pkgver=0.12.2
pkgrel=1
pkgdesc="Create tabular synthetic data using copulas-based modeling"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pandas python-plotly python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
optdepends=('python-markupsafe' 'python-scikit-learn' 'jupyter-notebook')
checkdepends=(python-pytest python-invoke)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('a36370491a865d5fd87f039de5c8806fc220197a04731bb68bf5e340d40e2a653f2791c4c0558f4ba661d27bf29935db30b6685b29d7b84b85507eb415d93cb1')

prepare() {
  sed -i 's/np.NaN/np.nan/' ${_base}-${pkgver}/${_base,,}/multivariate/tree.py
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
