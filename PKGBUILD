# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Contributor: eDgar <eDgar|-at*|openmail cc>
_base=ufl
pkgname=python-${_base}-git
pkgdesc="UFL - Unified Form Language"
pkgver=2021.1.0.58.g6eeef938
pkgrel=1
arch=(any)
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
depends=(python-numpy python-setuptools)
makedepends=(python-build python-installer python-wheel git)
checkdepends=(python-pytest)
provides=("python-${_base}=${pkgver%%.r*}")
conflicts=("python-${_base}" "python-fenics-${_base}")
source=("${_base}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
  cd ${_base}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest
}

package() {
  cd "${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}
