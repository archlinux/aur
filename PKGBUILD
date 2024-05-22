# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=aerokit
pkgname=python-${_base}
pkgdesc="Python tools for basic fluid mechanics computations"
pkgver=1.2.1
pkgrel=1
arch=(any)
url="https://github.com/jgressier/${_base}"
license=(MIT)
depends=(python-matplotlib python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('7ad07102f0033c4552a1f08bbf3fd9fa7fa6b4d0f2fa52d910e7a03e0700a0fc0acbe29778501cc342b35a0a15766d898bd5771cbeb909a966d03a6d41fc1f1f')

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
