# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.3.6
pkgrel=1
pkgdesc="Fast and direct raster I/O for use with Numpy and SciPy"
url="https://github.com/${_base}/${_base}"
license=(custom)
arch=(x86_64)
depends=(
  gdal
  python-affine
  python-attrs
  python-certifi
  python-cligj
  python-snuggs
  python-click-plugins
  python-setuptools
)
makedepends=(python-build python-installer python-wheel)
checkdepends=(
  openexr
  cfitsio
  hdf5
  libheif
  openjpeg2
  libjxl
  poppler
  postgresql-libs
  libwebp
  netcdf
  arrow
  mariadb-libs
  podofo
  python-boto3
  python-hypothesis
  python-pytest
  python-shapely
  python-matplotlib
)
optdepends=('ipython: for ipython support'
  'python-boto3: for s3 support'
  'python-matplotlib: for plotting support')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a2e55a8e8dbc60dd0343c59aba1e41504fd024285a17fe5173331bca14eb01b880df4e9489afb40b56ae0a5d0a92481308dc60d0ff22d8c4097e25328c6d3b1e')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  mv ${_base} .${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest -m "not wheel" -rxXs tests -k 'not reproject_view and not reproject_nodata[options0-6644] and not reproject_nodata_nan[options1-6644] and not reproject_nodata[options1-6644] and not reproject_nodata_nan[options0-6644] and not reproject_dst_nodata_default[options0-6644] and not reproject_dst_nodata_default[options1-6644]' # py.test
}

package() {
  cd ${_base}-${pkgver}
  # mv .${_base} ${_base}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
