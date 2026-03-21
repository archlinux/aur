# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=pyccel
pkgname=python-${_base}
pkgdesc="Python extension language using accelerators"
pkgver=2.2.3
pkgrel=1
arch=(any)
url="https://github.com/${_base}/${_base}"
license=(MIT)
depends=(python-filelock python-numpy python-sympy python-termcolor python-textx python-packaging)
makedepends=(python-build python-installer python-hatchling)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f1c7d47bd90aaa7fcd52a522debaca3cc1a6e01087157c57315dbaee665f666f96bf5889ff49745bce5a39d0c2e17c558a83923eb8ef92b7ee1a029d7817f050')

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
