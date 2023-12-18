# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Marc Fehling <mafehling.git@gmail.com>
_base=sphinx-external-toc
pkgname=python-${_base}
pkgdesc="A sphinx extension that allows the site-map to be defined in a single YAML file"
pkgver=1.0.1
pkgrel=1
arch=(any)
url="https://github.com/executablebooks/${_base}"
license=(MIT)
depends=(python-click python-yaml python-sphinx)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest-regressions)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('5d0a6442538e773129ee5682e930da6366187b3bcf1f5c11327829c9b8df0a279bb7026c247f575cd9833a8c53f0e1b9bca4748ab9d53e8c2c31aab9cb8a833d')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
