# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=multicollections
pkgname=python-${_base}
pkgdesc="Fully generic MultiDict class"
pkgver=1.1.2
pkgrel=1
arch=(any)
url="https://github.com/gerlero/${_base}"
license=(Apache-2.0)
depends=(python)
makedepends=(python-build python-installer python-uv-build)
checkdepends=(python-pytest python-multidict)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('4e1bbfe2c9fc7a23424d34df6bb76979f3c79e0774afd94d4fa474497dfabc1d27788221ec4225155631d1a1ead9185ff2f3327e66d0329a355c64740963c0fb')

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
