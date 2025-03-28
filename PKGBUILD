# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gotranx
pkgname=python-${_base}
pkgdesc="A declarative language describing ordinary differential equations"
pkgver=1.3.3
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
sha512sums=('a63765d87517a103dc6a8ac76f23aa04b921158520a768a7caea90adac6c57ea3ed564e197fd929f06a14cbc771d032487344b846c47808b0398e5534175e4bb')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
