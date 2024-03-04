# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.8.3
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
sha512sums=('b9a1a76b6c20c5d3520cee9b547cfd5518d517087dc5052183f6037f189a756e9184a7fed18deb7d6b2cb83388ccbae084956b19dc18bf40a83c85dcf3b474f2')

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
  -k 'not successive_runs_using_black'
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
