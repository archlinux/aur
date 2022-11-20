# Maintainer: Bruno Pagani <archange@archlinux.org>

_pkg=xarray
pkgname=python38-${_pkg}
pkgver=2022.06.0
pkgrel=1
pkgdesc="N-D labeled arrays and datasets in Python"
arch=(any)
url="https://xarray.pydata.org/"
license=(Apache)
depends=(python38-numpy python38-packaging python38-pandas)
makedepends=(python38-setuptools python38-setuptools-scm)
optdepends=(
  'python38-netcdf4: netCDF4 support'
  'python38-scipy: interpolation features & fallback for netCDF3 support'
#  'python38-pydap: fallback for accessing OPeNDAP'
#  'python38-h5netcdf: alternative for netCDF4 support'
#  'python38-zarr: chunked, compressed N-dimensional arrays'
  'python38-cftime: datetimes support for non-standard calendars or distant dates'
#  'python38-pseudonetcdf: atmospheric science specific file formats support'
#  'python38-rasterio: GeoTiffs and other gridded raster datasets support'
#  'python38-iris: conversion to and from iris’ Cube objects'
#  'python38-cfgrib: mapping GRIB files to CDF4'
  'python38-bottleneck: faster NaN-skipping and rolling window aggregations'
#  'python38-numbagg: faster exponential rolling window operations'  
#  'python38-flox: faster GroupBy reductions'
  'python38-dask: parallel computation'
  'python38-distributed: parallel computation'
  'python38-matplotlib: plotting support'
#  'python38-cartopy: plotting of cartographic data'
  'python38-seaborn: better color palettes for plots'
#  'python38-nc-time-axis: plotting of cftime.datetime objects'  
#  'python38-sparse: sparse arrays support'
  'python38-pint: units of measure support'
)
checkdepends=(
    python38-pytest
    python38-pytest-xdist
    python38-aiobotocore
    python38-aiohttp
    python38-bottleneck
    python38-boto3
    python38-cftime
    python38-dask
    python38-distributed
    python38-fsspec
    python38-h5py
    python38-hypothesis
    python38-lxml
    python38-matplotlib
    python38-netcdf4
    python38-numexpr
    python38-numpy
    python38-pint
    python38-requests
    python38-scipy
    python38-seaborn
)
#source=(https://files.pythonhosted.org/packages/source/${_pkg::1}/${_pkg}/${_pkg}-${pkgver}.tar.gz)
source=(https://github.com/pydata/xarray/archive/refs/tags/v${pkgver}/${pkgname}-${pkgver}.tar.gz)
sha256sums=('3c755c41d971cbd926409f2ae2441c0b3545b497f6bb05a1702611e32d0dcdff')

build() {
  cd ${_pkg}-${pkgver}
  python38 setup.py build
}

check() {
  cd ${_pkg}-${pkgver}
  # https://github.com/pydata/xarray/issues/4281
  pytest -vv --color=yes --deselect xarray/tests/test_distributed.py::test_serializable_locks
}

package() {
  cd ${_pkg}-${pkgver}
  python setup.py install --prefix=/usr --root="${pkgdir}" --skip-build --optimize=1
  # Remove tests
  rm -r "${pkgdir}"$(python3.8 -m "import site; print(site.getsitepackages()[0])")/xarray/tests
}
