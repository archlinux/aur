# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PINA
pkgname=python-${_base,,}-mathlab
pkgver=0.2.6.post2602
pkgrel=1
pkgdesc="Physics-Informed Neural networks for Advanced modeling"
url="https://github.com/mathLab/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch-lightning)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz)
sha512sums=('ea5ade3d30c353c48bef18ea15aaca6f0d34a0ea082a698cf15d173f8f85c97d956bc05152075ac5fb6a359e0e58f31ddf344d7c42bf4b5bc0754efe6d30d7c3')

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
