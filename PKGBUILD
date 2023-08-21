# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.7.0
pkgrel=2
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
sha512sums=('f367325e9d67ffc2fafbf19afe98622b1f3d86e6466923b85118e3c3aad47b0eb25b85dce3b823e3d3ec27f29461b2fd0c977e1ea47648946cbf08fbfdba7117')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests \
    --ignore=tests/test_return_code.py \
    --ignore=tests/test_version.py \
    --ignore=tests/tools/test_black.py \
    --ignore=tests/tools/test_ruff_works.py \
    --ignore=tests/tools/test_yapf.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
