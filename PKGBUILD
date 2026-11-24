# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=esutil
pkgname=python-${_base}
pkgver=0.6.17
pkgrel=1
pkgdesc="Erin Sheldons Python Utilities"
arch=(any)
url="https://github.com/esheldon/${_base}"
license=(GPL-2.0-or-later)
depends=(python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('223b1128c1350994c81699e3020a042cf9bbed7269ee8812b14cbf5ded213e51998290a79f4e9449f3ee7eb9ab9a01343c31bdd4f6eff1d4316caf68c48c3a4a')

build() {
  cd ${_base}-${pkgver}
  python setup.py build_ext --inplace
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
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
