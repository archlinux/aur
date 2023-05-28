# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=metadetect
pkgname=python-${_base}
pkgver=0.12.0
pkgrel=1
pkgdesc="Combining detection and metacalibration"
arch=(any)
url="https://github.com/esheldon/${_base}"
license=(GPL)
depends=(python-galsim python-fitsio python-esutil python-sep python-ngmix python-meds python-sxdes)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-tqdm) # python-lsst python-descwl_shear_sims
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a9449442cf3efb1f6cbc8873c65573971d54d421b4a96fcd4766ecc7fcd7f436829ff725f3197d5535f1916947008d0e708b85d7efa0bbefc37465ecfdeb1328')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=${_base}/lsst/tests --ignore=shear_meas_test
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
