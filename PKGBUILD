# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.6.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}-dev/${_base}"
license=(MIT)
depends=(ipython python-tokenize-rt python-tomli)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-jupytext yapf python-isort mypy flake8
  python-black blacken-docs python-pydocstyle autopep8 pyupgrade mdformat
  python-autoflake python-pylint ruff)
optdepends=('python-black: toolchain support'
  'flake8: toolchain support'
  'python-isort: toolchain support'
  'mypy: toolchain support'
  'python-pylint: toolchain support'
  'pyupgrade: toolchain support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('67c6e94d003f9f4414a9f5818766e77f2210ee4c249db6552e34ce327ef32f2c8fc15bed029de77daa86fc785643d220ebeafdafe191bfbf2d5b32213309bd49')

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
