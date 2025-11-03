# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matlabdomain
pkgname=python-sphinxcontrib-${_base}
pkgver=0.22.1
pkgrel=1
pkgdesc="A Sphinx extension for documenting Matlab code"
arch=(any)
url="https://github.com/sphinx-contrib/${_base}"
license=(BSD)
depends=(python-sphinx python-tree-sitter python-tree-sitter-matlab)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('d0ddee6465d4b4becce61efcf6964c879aa98f0fcc54d07c334f8753a488b966be52913833d5404ed5e1177df7b218b84c5918f4a83e571d4323933421a44c07')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
