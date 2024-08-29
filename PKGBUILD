# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Andrew Steinke <rkcf@rkcf.me>
# Contributor: Joshua Leahy <jleahy@gmail.com>
_base=freetype-py
pkgname=python-${_base}
pkgver=2.5.0
pkgrel=1
pkgdesc="FreeType Python bindings"
arch=(any)
url="https://github.com/rougier/${_base}"
license=(BSD-3-Clause)
depends=(python freetype2)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('10c00fb87ef8541fdfa3a30e8ad2ebebb7d35129bee3fa32807541baa6bf305f12e1965b6f4d75b3f8b0940ce9972c5e7b77ad263aa614fb3c5103d955239fc5')

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
