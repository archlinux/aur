# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gotranx
pkgname=python-${_base}
pkgdesc="A declarative language describing ordinary differential equations"
pkgver=1.1.2
pkgrel=1
arch=(any)
url="https://github.com/finsberg/${_base}"
license=(MIT)
depends=(python-attrs python-lark-parser python-pint python-structlog
  python-sympy python-typer python-myokit) # python-rich-click
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov cmake)
optdepends=('python-clang-format-docs: for formatter support'
  'python-black: for formatter support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('41f99d717d63f23255f71e3c7c117c3708a32b64170a2c290c6c239c512d59d3c78e27e99f62de509b7e3957451b0789467072c3ba608735ba05ac4b40738fa5')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/test_c_codegen.py \
    --ignore=tests/test_python_codegen.py \
    --ignore=tests/test_subodes.py \
    --ignore=tests/test_cli.py \
    --ignore=tests/test_demos.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
