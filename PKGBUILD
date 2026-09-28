# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=fastecdsa
pkgname=python-${_base}
pkgver=4.0.0
pkgrel=1
pkgdesc="Fast elliptic curve digital signatures"
arch=(x86_64)
url="https://github.com/antonkueltz/${_base}"
license=(Unlicense)
depends=(python gmp)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest-cov)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('e11b19de81e97affce3100e3ba434891fd7fda8616320d5afded6a87b4728d43336d13beed2e5402ee2be1f76f8b53c35037e0a6a2234c037b20a22291bc9e73')
# validpgpkeys=('67C1C1178894F9017D47AC0E15AB0E7C8A4019BF')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
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
  install -Dm644 README.rst -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
