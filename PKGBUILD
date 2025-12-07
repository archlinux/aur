# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=SDV
pkgname=python-${_base,,}
pkgver=1.30.0
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
sha512sums=('3b7af31e1c44ad12c8ae80d3af7a24642a062fb58cadd4ae46bab089f4455d1e8d18a0de39ce1115b46839937ab38c0b496948021646d84b9741e609cc920718')

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
