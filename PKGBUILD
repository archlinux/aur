# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Jagannathan Tiruvallur Eachambadi <jagannathante@gmail.com>
_base=vega_datasets
pkgname=python-${_base}
pkgdesc="A Python package for offline access to Vega datasets"
pkgver=0.9
pkgrel=1
arch=(any)
url="http://github.com/altair-viz/${_base}"
license=(MIT)
depends=(python-pandas)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-pandas)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('26362eb98b6ee5fc18b12dd9894b4fbd5fbfe4291585e55af34aa39fac8315646710083bc18b395a6bf0b1cc9f25404ee31b887fe939f77ab7f96d07cb991705')

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
