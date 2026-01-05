# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.20
pkgrel=1
arch=(any)
url="https://github.com/aeturrell/${_base}"
license=(MIT)
depends=(python-click python-ipykernel python-pandas-stubs python-pandas
	python-polars python-pygments python-rich python-typeguard python-pyarrow
	#python-pydoclint
	python-duckdb)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-polars)
optdepends=('python-polars: for polars data frame support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('51b8553c95549711da220e30e8b2676376c1fedbb1311faec048a1082b9b64e7dedfbca3fba3599d2d979d772bbfb8444af3a554f87c1150e3ffee59888a4255')

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
