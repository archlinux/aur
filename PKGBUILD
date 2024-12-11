# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=xad
pkgname=python-${_base}
pkgver=1.5.1
pkgrel=1
pkgdesc="Python bindings for the XAD automatic differentiation library"
arch=(x86_64)
url="https://github.com/auto-differentiation/${_base}-py"
license=(AGPL-3.0-or-later)
depends=(python)
makedepends=(python-build python-installer python-setuptools python-poetry-core python-pybind11-stubgen python-ninja python-wheel cmake git) # pybind11 xad
checkdepends=(python-pytest)
source=(${_base}-py-${pkgver}::git+${url}.git#tag=v${pkgver}
  github.com-src-xad::git+https://github.com/auto-differentiation/xad.git
  github.com-src-pybind11::git+https://github.com/pybind/pybind11.git)
sha512sums=('98785185df96429b962675a56507d3984e98b4bb67e6fc2b8c100229560658562967b7de742526c82cf093ae2a80f2a811fa9b6fe5b33c5d5dd0ba823f2196ea'
  'SKIP'
  'SKIP')

prepare() {
  cd ${_base}-py-${pkgver}
  git submodule init
  git config submodule.src/xad.url "${srcdir}/github.com-src-xad"
  git config submodule.src/pybind11.url "${srcdir}/github.com-src-pybind11"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd ${_base}-py-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-py-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest
# }

package() {
  cd ${_base}-py-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
