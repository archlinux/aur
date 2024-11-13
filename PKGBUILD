# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Copulas
pkgname=python-${_base,,}
pkgver=0.12.0
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
sha512sums=('549607b360abf77e3e66741637d91501385e1421acd66d4fa4fb7f37af1b4d4aa6d894a68b661beeb197ffb31eb16addf278c1ccbad482d78a25ad8b67e6f819')

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
