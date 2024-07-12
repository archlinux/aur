# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=forallpeople
pkgname=python-${_base}
pkgdesc="Python SI units library"
pkgver=2.7.0
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('f1a077cbefd5b05035c5ca06ace7c83a5cdc881c4dac91810eddec71d4eaa2cca174eeaec7682c12839fc75509d584ea40f3cfd56910e096735d5196e3dd9da9')

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
