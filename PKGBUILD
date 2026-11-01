# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: acxz <akashpatel2008@yahoo.com>
_base=flake8-builtins
pkgname=python-${_base}
pkgver=3.2.0
pkgrel=1
pkgdesc="Check for python builtins being used as variables or parameters"
arch=(any)
url="https://github.com/gforcada/${_base}"
license=(GPL-2.0-or-later)
depends=(flake8)
makedepends=(python-build python-installer python-hatchling python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('bdf075eee3015c24f25e50e72d27c08bb65ea66afb64fee7b61a5f1cf4e8faec9d4880f97df6fb7d16ded7ddf39044dc32048f93e29efa00c7489767e016e4ca')

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest run_tests.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
