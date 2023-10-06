# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=CTGAN
pkgname=python-${_base,,}
pkgver=0.7.5
pkgrel=1
pkgdesc="Create tabular synthetic data using a conditional GAN"
arch=(x86_64)
url="https://github.com/sdv-dev/${_base}"
license=('custom')
depends=(python-pytorch python-rdt python-tqdm)
makedepends=(python-build python-installer python-pytest-runner python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('343d0e98830ae7444ee6a78063043777ec669b479b9430d3a88e6a5a7c5af1fe546e1e2977b155a209e6580f005b1fc88b0ddd2fdbdaa075481c967032990945')

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
