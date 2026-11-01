# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=Copulas
pkgname=python-${_base,,}
pkgver=0.15.0
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
sha512sums=('49164ee83bae576334837abaf49ea78ec6d530ca5c8df388218219959a039672814c94504d88ad80148c77e8fef4870ea653d3d701b951cd695e89476e8b64e3')

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
