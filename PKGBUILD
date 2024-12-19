# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.16
pkgrel=1
arch=(any)
url="https://github.com/aeturrell/${_base}"
license=(MIT)
depends=(python-click python-rich python-pandas python-pygments python-ipykernel python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-typeguard python-polars python-pyarrow)
optdepends=('python-polars: for polars data frame support'
  'python-pyarrow: for columnar memory support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0e8d590ae91405ce73dfcb7328a41650c13f1210d80d9b91e598e7f554b5a0cb0ba60efe2e33943295d93dc0ef669e099d20bf0a40ee04a3afad15b4dd8f1828')

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
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
