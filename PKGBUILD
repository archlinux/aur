# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spatialpandas
pkgname=python-${_base}
pkgver=0.6.0
pkgrel=1
pkgdesc="Pandas extension arrays for spatial/geometric operations"
arch=(any)
url="https://github.com/holoviz/${_base}"
license=(BSD-2-Clause)
depends=(python-dask python-numba python-pandas python-param python-pyarrow python-snappy python-retrying)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-hypothesis python-geopandas python-scipy) # python-shapely python-hilbertcurve
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('2a30eca33ff5b7198a69f48960f1085a7f0e0342663309a77601590c9cc840d3960661a08f131091f977a2434c948df91e4fe4f3f4690dbee0f07630d08be11b')

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
