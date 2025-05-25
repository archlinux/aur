# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=glasbey
pkgname=python-${_base}
pkgdesc="Algorithmically generate categorical color palettes"
pkgver=0.3.0
pkgrel=1
arch=(any)
url="https://github.com/lmcinnes/${_base}"
license=(MIT)
depends=(python-numba python-colorspacious python-matplotlib python-scikit-learn)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-release-${pkgver}.tar.gz::${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('419751dd8e12b7d16e5d73c4a33e57abece56c771bbb780aadcdf695c79a4841f0fd74900dd69b4d95917ffde3ecdeb8a5bfe9389e47d82e0149840a18ddaa89')

build() {
  cd ${_base}-release-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-release-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd ${_base}-release-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
