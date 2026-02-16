# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Eli Schwartz <eschwartz@archlinux.org>
_base=flatdict
pkgname=python-${_base}
pkgver=4.1.0
pkgrel=1
pkgdesc="Module for interacting with nested dicts as a single level dict with delimited keys"
arch=(any)
url="https://${_base}.readthedocs.io"
license=(BSD-3-Clause)
depends=(python)
makedepends=(python-build python-installer python-hatch-vcs)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::https://github.com/gmr/${_base}/archive/${pkgver}.tar.gz)
sha256sums=('6276bcef3075e18934f0116fd436d02c0110eb419c25cbb2359e1ccd8431b77b')
b2sums=('81257f1eba486dd7de00f2518fd59dbb0dc8c6f31e2af913fc648b2b6e0d4cca953e74f99ad579579a4f9a55028d63e3f01cac9fcd5cee9d3f640c0a8067ef30')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
