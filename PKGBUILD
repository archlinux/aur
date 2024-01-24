# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Rich Li <rich@dranek.com>
_base=cmocean
pkgname=python-${_base}
pkgver=3.1.3
pkgrel=1
pkgdesc="Colormap setup for standardizing commonly-plotting oceanographic variables"
url="https://github.com/matplotlib/${_base}"
depends=(python-matplotlib)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
license=(MIT)
arch=(any)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('73b781f13b60a8a4bb8bd5eea6dfcc4ca07c5f65786ced1d343e721d047b37760ea32f413a1f41a0651e6fc20a30656b1c1566e59bc31ed09b98789f1dc8e01f')

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
