# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CTGAN
pkgname=python-${_base,,}
pkgver=0.13.0
pkgrel=1
pkgdesc="Create tabular synthetic data using a conditional GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pytorch python-rdt python-tqdm)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('3b5c58636e491799e818f454c42e56551520ce5b5a8763eb3d5ee0dbf928c4c9c2ae0f82f1553bec83bbd94286996cd80c8151b46aef6e643d04d76ce3a6f556')

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
