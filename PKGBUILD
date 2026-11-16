# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=forallpeople
pkgname=python-${_base}
pkgdesc="Python SI units library"
pkgver=3.5.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('256a5228592675f89a8303ca1d53dd54ea432a35a25387794a00365bb1edd61ef7c148b44d1b9bda394d16d58758ae384cad15c98adb8f21f5de41cf4f863d69')

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
  install -Dm 644 LICENSE.TXT -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
