# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=ufl
pkgname=python-fenics-${_base}
pkgdesc="UFL - Unified Form Language"
pkgver=2023.1.1.post0
pkgrel=2
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(MIT)
depends=(python-numpy python-setuptools)
makedepends=(python-build python-installer python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz)
sha512sums=('681580dd70a09357d823af12a1fdcd417e8718eb722dfa2869183010fc4ac605c37e87b552f51017236f4942d0c7f05e019a98bffcf04b5212f378a324f1be42')
provides=("python-${_base}")
conflicts=("python-${_base}" "python-${_base}-git")

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
  install -Dm 644 COPYING -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
