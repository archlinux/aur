# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=glasbey
pkgname=python-${_base}
pkgdesc="Algorithmically generate categorical color palettes"
pkgver=0.2.1
pkgrel=1
arch=(any)
url="https://github.com/lmcinnes/${_base}"
license=(MIT)
depends=(python-numba python-colorspacious python-matplotlib python-scikit-learn)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-release-${pkgver}.tar.gz::${url}/archive/release-${pkgver}.tar.gz)
sha512sums=('fbbee24659f9cd5b5a85735c81db202dfd29fa6e82f2831459baa7f2e7d284e3a31b21cf8a2eaa508dcba4bbc744513e4b14ccc2daa139c6f819af5434014d9e')

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
