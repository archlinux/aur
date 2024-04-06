# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Rich Li <rich@dranek.com>
_base=cmocean
pkgname=python-${_base}
pkgver=4.0.3
pkgrel=1
pkgdesc="Colormap setup for standardizing commonly-plotting oceanographic variables"
url="https://github.com/matplotlib/${_base}"
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('03b81cc24f0d0bb38a4d3430c6b79f007fb462c2d5710d8ce6eb1fb3c6a6da4501b2ad207b4b6d2ab6bff48d93f77db375dfa1f26e52110ace3cb4ff5a42d6aa')

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
