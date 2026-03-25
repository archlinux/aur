# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyfonts
pkgname=python-${_base}
pkgdesc="A simple and reproducible way of using fonts in matplotlib"
pkgver=1.3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/y-sunflower/${_base}"
license=(MIT)
depends=(python-matplotlib python-requests)
makedepends=(python-build python-installer python-setuptools-scm)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('62a45e4b32222166a98fbe4c9453a9e8d29e52253492c4e1ece7b20915782aff5d490956d13c87aa32a92109e9fcfc4a7c1d3c56874a1474066086d0d9a56223')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
