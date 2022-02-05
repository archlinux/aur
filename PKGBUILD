# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.3a3
pkgrel=1
pkgdesc="Rasterio reads and writes geospatial raster datasets"
url="https://github.com/${_base}/${_base}"
license=('custom')
arch=('x86_64')
depends=(gdal python-affine python-attrs python-certifi python-cligj python-snuggs python-click-plugins python-setuptools)
makedepends=(cython)
# checkdepends=(python-pytest python-hypothesis python-boto3 python-shapely)
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz)
sha512sums=('c26c0cf0cb7ffbbf12bdcbe123a35af4cdd4a3d8c88729ed22bebfea8a205a6472a2cfe125e9806c0b2f51f8b05babef2f5f0bd7759e01ec39b254baeebe4c11')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   local _pyversion=$(python -c "import sys; print(sys.version[:3])")
#   #   mv ${_base} .${_base}
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" py.test tests -k "not rio_env_no_credentials and not info_azure_unsigned"
# }

package() {
  cd "${_base}-${pkgver}"
  # mv .${_base} ${_base}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
