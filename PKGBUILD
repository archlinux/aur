# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=RDT
pkgname=python-${_base,,}
pkgver=1.4.2
pkgrel=1
pkgdesc="Reversible Data Transforms"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-pandas python-scikit-learn python-psutil python-faker)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest python-copulas)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('d2961d81bc951748d9073c85d57409b3bc489fd29b5c58a2dcca431d23229964940145763e308b4be6f18fb1c606bf972e9f2ec305009e7d574cfd8d41e095a6')

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
