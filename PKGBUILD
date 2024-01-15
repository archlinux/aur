# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.7.1
pkgrel=1
arch=(any)
url="https://github.com/${_base}-dev/${_base}"
license=(MIT)
depends=(autopep8 ipython python-tokenize-rt python-tomli)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-jupytext python-black blacken-docs flake8 python-pydocstyle
  python-autoflake python-isort mdformat mypy python-pylint pyupgrade python-ruff yapf)
optdepends=('python-black: toolchain support'
  'blacken-docs: toolchain support'
  'flake8: toolchain support'
  'python-isort: toolchain support'
  'python-jupytext: toolchain support'
  'mypy: toolchain support'
  'python-pylint: toolchain support'
  'pyupgrade: toolchain support'
  'python-ruff: toolchain support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('5f74919ca0f54917c415a814e3b163e2bd8d2e254f905639289d3aa78d98abe004d1263cf50be39b48d146f14a6dc219c39811ba312aef4a8de7cfc794a389ac')

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
    --ignore=tests/tools/test_ruff_works.py \
    -k 'not successive_runs_using_black and not pylint_works'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
