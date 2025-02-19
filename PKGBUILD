# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spatialpandas
pkgname=python-${_base}
pkgver=0.5.0
pkgrel=1
pkgdesc="Pandas extension arrays for spatial/geometric operations"
arch=(any)
url="https://github.com/holoviz/${_base}"
license=(BSD-2-Clause)
depends=(python-dask python-numba python-pandas python-param python-pyarrow python-snappy python-retrying)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-hypothesis python-geopandas python-scipy) # python-shapely python-hilbertcurve
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7b9701c6b4a92c297dfc958c37169f135a1aad326482e9ca840d81a7bcef36bc674f4a20e0895c736c8715485d576a313c3165e9ddc8f9ef3f6d49a3e5d7dd0f')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests
  # --ignore=${_base}/tests/geometry/algorithms/test_intersection.py \
  # --ignore=${_base}/tests/geometry/test_cx.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
