# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CTGAN
pkgname=python-${_base,,}
pkgver=0.8.0
pkgrel=1
pkgdesc="Create tabular synthetic data using a conditional GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-pytorch python-rdt python-tqdm)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('cb66ac8f012a0132794c410fc2a9c77cd4d85b87bae4aa0d5f719c7d99c575d11da54f67d15cf1d62e429e15def7e9518d9895debec85229ba7ea96c236f44a8')

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
