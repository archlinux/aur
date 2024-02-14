# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CTGAN
pkgname=python-${_base,,}
pkgver=0.9.0
pkgrel=1
pkgdesc="Create tabular synthetic data using a conditional GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-pytorch python-rdt python-tqdm)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4cb2c9dcfef2b34717f042ec2376b2d7f0c4b0a00d6c1c28b61e1a3d33948238b7a0c82f796f90e19252f98469357d126c79b099695e5b7760c45e13e4700885')

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
