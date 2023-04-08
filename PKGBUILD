# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pypardiso
pkgname=python-${_base}
pkgver=0.4.2
pkgrel=1
pkgdesc="Python interface to the Intel MKL Pardiso library to solve large sparse linear systems of equations"
arch=('x86_64')
url="https://github.com/haasad/PyPardisoProject"
license=('custom:BSD-3-clause')
depends=(intel-oneapi-mkl python-scipy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('defc59769f40447099260f4f9ef9b6707f3c09708275f74fedc44226faa259a7d41b39aaefd36c203a6eb2623167f7fde6404d7d96d551ac9001e3b6c69dd1ef')

build() {
  cd PyPardisoProject-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd PyPardisoProject-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests
}

package() {
  cd PyPardisoProject-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
