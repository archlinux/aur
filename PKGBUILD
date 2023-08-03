# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=geotiler
pkgname=python-${_base}
pkgdesc="Library to create map using tiles from a map provider"
pkgver=0.15.0
pkgrel=1
arch=(any)
url="https://github.com/wrobell/${_base}"
license=(MIT)
depends=(python-pillow python-cytoolz python-aiohttp)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-numpy)
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('f6d037f56c955a32de738ccdbe46cd9d3a0bd530cda7ec605e1696cece58eb88cc67c3f49eb66f4832dfd5eef97733afa63476bb251b13fc3fe94e5b6c92085c')

build() {
  cd ${_base}-${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=${_base}/tests/test_tile_img.py
}

package() {
  cd ${_base}-${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
