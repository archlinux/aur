# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDV
pkgname=python-${_base,,}
pkgver=1.35.0
pkgrel=1
pkgdesc="Generate synthetic data for single table, multi table and sequential data"
arch=(x86_64)
url="https://github.com/${_base,,}-dev/${_base}"
license=(BUSL-1.1)
depends=(python-boto3 python-botocore python-cloudpickle python-graphviz
  python-copulas python-ctgan python-deepecho python-rdt python-sdmetrics python-platformdirs python-yaml)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('bcd3421ced3572894b628310cf181ac3515162c04e5501c43831bfa55cdddfbfe796f604cac9148902dabbf54a6008f0b3a44f2c1d565b806ba69c7df3643ba8')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
