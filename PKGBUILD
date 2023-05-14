# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.8
pkgrel=2
arch=(any)
url="https://github.com/aeturrell/${_base}"
license=(MIT)
depends=(python-click python-rich python-pandas python-pygments python-ipykernel python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-typeguard)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('0187a4031df5a58e2206ba87b38d3db48cc531b792cd18de56ed3ccf6bb256b238653cfeb0415e524063d68c853dafc6b3e41942e9d7b71cfb0944ccad8568a3')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -k 'not 007_horrible_column_names and not 008_clean_default and not 009_clean_case_style and not 010_clean_replace and not 011_clean_keep_accents and not 012_clean_null_headers'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
