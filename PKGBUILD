# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=sxdes
pkgname=python-${_base}
pkgver=0.3.1
pkgrel=1
pkgdesc="run the sep code on images with DES settings"
arch=(x86_64)
url="https://github.com/esheldon/${_base}"
license=(GPL3)
depends=(python-sep)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('adf691fba09693484e502e01c9c3a80c798cd609b0ecff11eee5395d96f1dc1aa1d8f8e512a4e09e2de9908b8919597808db2a0b490fac52a5ca8fc70de60987')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
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
