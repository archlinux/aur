# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=DeepEcho
pkgname=python-${_base,,}
pkgver=0.6.1
pkgrel=1
pkgdesc="Create sequential synthetic data of mixed types using a GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=(BUSL-1.1)
depends=(python-pytorch python-tqdm)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7dbecae66523a008245154f4957e7935413347dc5192075e292e9b57d705fca6da8b5bd127e513fa90384749b5a21193a6861dd6dfec85275a5c4c6b2fc2bcba')

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
