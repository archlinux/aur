# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gotranx
pkgname=python-${_base}
pkgdesc="A declarative language describing ordinary differential equations"
pkgver=0.3.5
pkgrel=1
arch=(any)
url="https://github.com/finsberg/${_base}"
license=(MIT)
depends=(python-attrs python-lark-parser python-pint python-structlog
  python-sympy python-typer python-myokit) # python-rich-click
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
optdepends=('python-clang-format-docs: for formatter support'
  'python-black: for formatter support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f7d96dbd9df221e26a869568206091befeecd90267042af6d1cd6df5f70b27d22ac4e04779ee42f9cad52c962b9566d97de6251648c1571e2ae97736c0e920d7')

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
    --ignore=tests/test_subodes.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
}
