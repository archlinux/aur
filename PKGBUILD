# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=confu
pkgname=python-${_base}
pkgver=1.9.0
pkgrel=1
pkgdesc="Configuration file validation and generation"
arch=(any)
url="https://github.com/20c/${_base}"
license=(Apache-2.0)
depends=(python-munge)
makedepends=(python-build python-installer python-poetry-core)
checkdepends=(python-pytest)
changelog=CHANGELOG.md
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('a0943cb496cd9816ca6060ed527123f479b0cafc5f2c01e7c747f5845d99840bdb77727bfc5d158a8febad278cc49b64f0b0060fcd8425c2c428a5652bac9afd')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
