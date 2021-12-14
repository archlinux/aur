# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Simon Legner <Simon.Legner@gmail.com>
_base=rasterio
pkgname=python-${_base}
pkgver=1.3a2
pkgrel=2
pkgdesc="Rasterio reads and writes geospatial raster datasets"
url="https://github.com/${_base}/${_base}"
license=('custom')
arch=('x86_64')
depends=(gdal python-affine python-attrs python-certifi python-cligj python-snuggs python-click-plugins python-setuptools)
makedepends=(cython)
# checkdepends=(python-pytest python-hypothesis python-boto3 python-shapely)
source=(${_base}-${pkgver}::${url}/archive/${pkgver}.tar.gz)
sha512sums=('582e14696a57c5f08e890a2cf5306f14ed84bd4ef67cd9c8db1bed7eb3bdeeb8acf7d014a1d5320bb3ddc06a2006d1bfbface963197fc11640fc69a5ef80a2ee')

build() {
  cd "${_base}-${pkgver}"
  python setup.py build
}

# check() {
#   cd "${_base}-${pkgver}"
#   local _pyversion=$(python -c "import sys; print(sys.version[:3])")
#   mv ${_base} .${_base}
#   PYTHONPATH="${PWD}/build/lib.linux-${CARCH}-${_pyversion}:${PYTHONPATH}" py.test tests -k "not rio_env_no_credentials and not info_azure_unsigned"
# }

package() {
  cd "${_base}-${pkgver}"
  # mv .${_base} ${_base}
  export PYTHONHASHSEED=0
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
