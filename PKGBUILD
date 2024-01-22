# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=geotiler
pkgname=python-${_base}
pkgdesc="Library to create map using tiles from a map provider"
pkgver=0.15.1
pkgrel=1
arch=(any)
url="https://github.com/wrobell/${_base}"
license=(MIT)
depends=(python-pillow python-cytoolz python-aiohttp)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov python-numpy)
source=(${url}/archive/${_base}-${pkgver}.tar.gz)
sha512sums=('336ae1d9711599fdc151fd44a2913fb109b7d7bcd33e6b36eb6c26727327631a8ea9786d059639faac563f19af7cdc2bcda8b243e5fb1c96f6949f673ff9d227')

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
