# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=gotranx
pkgname=python-${_base}
pkgdesc="A declarative language describing ordinary differential equations"
pkgver=0.3.4
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
sha512sums=('08dd4fc858b72168f6a07d29f6f5e0a3f2d8260ab794a9138fe4ce3505f47657ced27cf0e4f06dfba4755068288cfaace8eae3616c1ef36bbcdbde097805d680')

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
