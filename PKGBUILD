# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Rich Li <rich@dranek.com>
_base=cmocean
pkgname=python-${_base}
pkgver=4.0.1
pkgrel=1
pkgdesc="Colormap setup for standardizing commonly-plotting oceanographic variables"
url="https://github.com/matplotlib/${_base}"
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('dc273f44ef6eda6322f698e52d0e1796cdf96d1705566369383c65c91a8d5ff06373afcbbd03457f009ff5aef0476028747be4acd8076af304ac7dd082f84a0e')

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
