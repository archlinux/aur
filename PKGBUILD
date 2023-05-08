# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Joshua Leahy <jleahy@gmail.com>

_base=freetype-py
pkgname=python-${_base}
pkgver=2.4.0
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=(any)
url="https://github.com/rougier/${_base}"
license=('BSD')
depends=(python freetype2)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('82cdb06cfae90bb94b5a2c91235ebc39e03ed85da92db139f6edddc09e219b07a9b6983b0990998fb0baaab2e92c628cf08d9b90a635a91636e17d2b228109e7')

export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
