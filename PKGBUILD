# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=DeepEcho
pkgname=python-${_base,,}
pkgver=0.4.2
pkgrel=1
pkgdesc="Create sequential synthetic data of mixed types using a GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-pytorch python-tqdm)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('43a39191177e09852dd63a076cac7a1aaecce84d6d0ec2b387720c931abb77cab54af8e8e42ea89ae565b1d6104dbb76efa56cb10b1d6fd9380d7389028ae731')

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
