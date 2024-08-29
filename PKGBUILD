# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Joshua Leahy <jleahy@gmail.com>
_base=freetype-py
pkgname=python-${_base}
pkgver=2.5.1
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=(any)
url="https://github.com/rougier/${_base}"
license=(BSD-3-Clause)
depends=(python freetype2)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4b85c8e38dfcddd180d87520c13a8e8bf366bd809cab2f5a044be33232ad7f1a1793f5a7059f9d82f659b821e9459e646c2b8c1a803ca9b8c7ffd13faf3e0b90')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
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
