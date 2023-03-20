# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.6.4
pkgrel=1
arch=(any)
url="https://github.com/${_base}-dev/${_base}"
license=(MIT)
depends=(ipython python-tokenize-rt python-tomli)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-jupytext yapf python-isort mypy flake8
  python-black blacken-docs python-pydocstyle autopep8 pyupgrade mdformat
  python-autoflake python-pylint python-ruff)
optdepends=('python-black: toolchain support'
  'flake8: toolchain support'
  'python-isort: toolchain support'
  'mypy: toolchain support'
  'python-pylint: toolchain support'
  'pyupgrade: toolchain support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('39f63b17cbf3b981d11e9d96c57cbf9f430063ca64f5cb02e656efb2384da0c16f96a5013cdc04ec38b3ac19a567d443e23c3c71acdebfe5828b827edeaf677a')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests -k 'not return_code and not version and not black and not ruff_works'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
