# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=forallpeople
pkgname=python-${_base}
pkgdesc="Python SI units library"
pkgver=3.4.1
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('a7c306eadc34ae5da9d249113db9c85e857ad39d83cf47ec3d98d23fd2927e6a3123446d1205b369017d56dc48c4e6bcdb100297cc60dc93f3625aee308c0c1f')

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
