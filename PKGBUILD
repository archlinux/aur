# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.12
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
sha512sums=('d01bab9242a4035bc932db8afe374b728bd3ec7e78de7eccc298dba8a2c61efc236da47e8acb710280101c748c7023352d28d1dc4c2763bf9b0b4d9278d1cc6f')

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
