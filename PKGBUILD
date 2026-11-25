# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=succulent
pkgname=python-${_base}
pkgver=0.6.0
pkgrel=1
pkgdesc="Collect POST requests easily"
arch=(x86_64)
url="https://github.com/firefly-cpp/${_base}"
license=(MIT)
depends=(python-pandas python-yaml python-flask python-lxml)
makedepends=(python-build python-installer python-poetry-core python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('1e653b01530e0831fc656473b129552e2f78b52719c71d59d02aa0232861214c1f60b952b24c123e67aafcd104389838dc88d6a2859fbcae3309c8e90a8a2002')

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
