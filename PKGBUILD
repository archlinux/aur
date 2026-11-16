# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=findiff
pkgname=python-${_base}
pkgdesc="Python package for finite difference derivatives in any number of dimensions"
pkgver=0.16.1
pkgrel=1
arch=(any)
url="https://github.com/maroba/${_base}"
license=(MIT)
depends=(python-scipy python-sympy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('602112913ee80af748ab244282b46c68f6b81059121485b309b880ae965393d747571eccedbfc472edbad39e2fcbc2a38c84d63811182c71d2d96d7598707a7d')

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
