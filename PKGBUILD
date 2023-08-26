# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=skimpy
pkgname=python-${_base}
pkgdesc="A light weight tool for creating summary statistics from dataframes"
pkgver=0.0.10
pkgrel=1
arch=(any)
url="https://github.com/aeturrell/${_base}"
license=(MIT)
depends=(python-click python-rich python-pandas python-pygments python-ipykernel python-numpy)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest python-typeguard)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('75517b07eebd6c034102787c13cae904813a11bf1e0f7092583493a5124cc59de38cbb888eab54503ccbdec7439768519bfbddcd8e415d8e98dc8a071dc743ea')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    -k 'not 007_horrible_column_names and not 008_clean_default and not 009_clean_case_style and not 010_clean_replace and not 011_clean_keep_accents and not 012_clean_null_headers'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
