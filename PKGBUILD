# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Rich Li <rich@dranek.com>
_base=cmocean
pkgname=python-${_base}
pkgver=3.0.3
pkgrel=1
pkgdesc="Colormap setup for standardizing commonly-plotting oceanographic variables"
url="https://github.com/matplotlib/${_base}"
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3afb6baf6741621ca11a365cd2ce2383cb24be0e86d6af40636e2bd9efd06433af6f851648ad19fd8b5be6333031832ea7248a1aad54a3bce95492406c7d473b')

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
