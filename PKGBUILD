# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=nbQA
pkgname=${_base,,}
pkgdesc="Run any standard Python code quality tool on a Jupyter Notebook"
pkgver=1.10.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}-dev/${_base}"
license=(MIT)
depends=(autopep8 ipython python-tokenize-rt python-tomli)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-jupytext python-black blacken-docs flake8 python-pydocstyle
  python-autoflake python-isort mdformat mypy python-pylint pyupgrade ruff yapf)
optdepends=('python-black: toolchain support'
  'blacken-docs: toolchain support'
  'flake8: toolchain support'
  'python-isort: toolchain support'
  'python-jupytext: toolchain support'
  'mypy: toolchain support'
  'python-pylint: toolchain support'
  'pyupgrade: toolchain support'
  'ruff: toolchain support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('f1b6848c57820a785da3ead374b10086c5077cb344874d32eb57df2bc64ef318390aae6810b2cf2a480295c83d5ba88e6c374cd68113b9df2ecb85e0feac90f3')

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
