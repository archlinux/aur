# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=handcalcs
pkgname=python-${_base}
pkgdesc="Python library for converting Python calculations into rendered latex"
pkgver=1.6.5
pkgrel=1
arch=(any)
url="https://github.com/connorferster/${_base}"
license=(Apache2)
depends=(python-more-itertools jupyter-nbconvert python-innerscope python-pyparsing)
makedepends=(python-build python-flit-core python-installer)
checkdepends=(python-pytest python-forallpeople python-pint python-sympy)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('6a1d632cfdc07f9c9f4298eb1ab320c9ada1868024cd7e4a92201c3fda3bf94297ecf576884f71c53f1e899db6c32ad9a8f8f77ee8c3cf3bd8bd50302fa77612')

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
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
