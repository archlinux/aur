# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=spatialpandas
pkgname=python-${_base}
pkgver=0.4.8
pkgrel=1
pkgdesc="Pandas extension arrays for spatial/geometric operations"
arch=(any)
url="https://github.com/holoviz/${_base}"
license=('custom:BSD-2-clause')
depends=(python-dask python-numba python-pandas python-param python-pyarrow python-snappy python-retrying)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-hypothesis python-geopandas python-scipy) # python-shapely python-hilbertcurve
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('c7b8932c5ac0a9e1ac7380d71d2c3805a043db551cacdb56feb11e153d7074f6fea16f4ff8055d8d1c4889d3308d630033072f8dfd7ffdaf00d7d4e99151536e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests \
    --ignore=${_base}/tests/geometry/algorithms/test_intersection.py \
    --ignore=${_base}/tests/geometry/test_cx.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
