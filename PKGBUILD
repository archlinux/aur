# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=testdata
pkgname=python-${_base}
pkgver=6.1.1
pkgrel=1
pkgdesc="Generates random test data"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python-datatypes)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('13a9eb10ef16aab06a45bdf10c1406306b68598fcbf0529d0ab8262d2503684b6711cba6111c9d1b102f74715b4c8541d2b444ca4e90ba53d5e3805b7874993d')

prepare() {
  cd ${_base}-${pkgver}
  sed -i "/find_packages/s/()/(exclude=['tests'])/" setup.py
}

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
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
