# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.22
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
sha512sums=('c6cd3613e0e751b1458f6184c4bad9a74446297e527436b4b5e51ca412f407ea901897786c8aa2f6e6120a5e2522b4a3874cbf49fdbd3173da83de88c7ca916f')

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
