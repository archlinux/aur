# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.15
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
sha512sums=('bc81df6c2f53da69b1c620864883700364b6826f4378a047d1ecb39bf3e6d69819cad9b5991f9b4c5195adb560c7168e03e4d4a94437ccc0222b83bdc71594bd')

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
