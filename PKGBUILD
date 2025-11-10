# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=landlab
pkgname=python-${_base}
pkgdesc="Open-source Python package for numerical modeling of Earth surface dynamics"
pkgver=2.10.1
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-bmipy python-matplotlib python-netcdf4 python-yaml python-pyshp
  python-rich-click python-scipy python-statsmodels python-pandas python-xarray)
makedepends=(python-build python-installer python-setuptools python-wheel cython)
checkdepends=(python-pytest python-hypothesis python-flaky)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('56237929e90bd1276c98b6ca4d4af73459b58e31c94843f60022c496cfbdf3d1694363879d7242d3a62c7986f6513374272290f1f3c4f0df525380dd050284dc')

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
