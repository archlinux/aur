# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=landlab
pkgname=python-${_base}
pkgdesc="Open-source Python package for numerical modeling of Earth surface dynamics"
pkgver=2.11.0
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-bmipy python-matplotlib python-netcdf4 python-yaml python-pyshp
  python-rich-click python-scipy python-statsmodels python-pandas python-xarray)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest python-hypothesis python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e78f63105ace32d3ffee0154cb0dc0f6473a0b0b7c7a636a52a80970d1af63ca776920c249f4c578b49258259406b3cb7c8d9290c97917810c9be3ff7382cdf6')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest \
    --ignore=tests/io/netcdf/test_from_netcdf.py \
    --ignore=tests/io/netcdf/test_to_netcdf.py \
    --ignore=tests/io/netcdf/test_read_netcdf.py \
    --ignore=tests/io/test_read_esri_ascii.py \
    --ignore=tests/grid/test_create.py \
    --ignore=tests/graph/hex/test_hex.py \
    --ignore=tests/components \
    --ignore=tests/io/test_shapefile.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.md -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
