# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=forallpeople
pkgname=python-${_base}
pkgdesc="Python SI units library"
pkgver=3.4.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('5332282c11a569041efb47e3d7849a49f3b91137c79693b1e1b50f2bf32119ab692d62982d0d67657aa4ee2dce7ef4a5948472a34cf5891b8deb12611dea6c8f')

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
