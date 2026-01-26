# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=entmax
pkgname=python-${_base}
pkgdesc="The entmax mapping and its loss, a family of sparse alternatives to softmax"
pkgver=1.3
pkgrel=1
arch=(any)
url="https://github.com/deep-spin/${_base}"
license=(MIT)
depends=(python-pytorch)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4c183e1f8677234332de8afcb31b41a16f513a01ba23c8f2912248434157d791297dd5a84eb6a654886a50f0ed6a01429b6f7d5fe30d293d0cf341aa9b062dc4')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer ${_base}-${pkgver}/dist/*.whl
  test-env/bin/python -m pytest ${_base}-${pkgver}
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
