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
sha512sums=('77efffa351741b960ce5f3b73c28e0cb71767b5b33cec944254e062c75d9ea9c22d148e4d99acf89a263b95f062158260023d63413dd0f7e1b2b36f49562f7ba')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest ${_base}/tests -k "not multipoint_cx_selection"
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
