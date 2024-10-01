# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PINA
pkgname=python-${_base,,}-mathlab
pkgver=0.1.2.post2410
pkgrel=1
pkgdesc="Physics-Informed Neural networks for Advanced modeling"
url="https://github.com/mathLab/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch-lightning)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('8a22b9ad66e4bd1be06051452d75f16e6c9eb32d9460ff32adec05fa2e00d221b7dba4635f3fe0f64714a05836b0ffb9b6547ab1c3e37a4733e3cd183f6388cf')

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
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
