# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDV
pkgname=python-${_base,,}
pkgver=2.2.0
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
sha512sums=('5210c783db9123a0ac771fa8f5e54f72d7ee36c8c166a265298885c3b67469e5b530101f17492b45472e48579de6d407092514c6c9bdf72aa57181ec5fedc649')

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
