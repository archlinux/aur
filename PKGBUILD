# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=matrepr
pkgname=python-${_base}
pkgver=1.0.1
pkgrel=1
pkgdesc="Format matrices and tensors to HTML, string, and LaTeX, with Jupyter integration"
url="https://github.com/alugowski/${_base}"
license=(BSD-2-Clause)
arch=(any)
depends=(python-tabulate)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-html5lib python-scipy python-pytorch)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f8321c53f4859c233eefb36825d52e8e1798efbe6d349f7f15a561421fc57a2a2ea0c661587e32c4fccc1833276ec31a9b22c9b720648e01ca7e2bb357a0a889')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
