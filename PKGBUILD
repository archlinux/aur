# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lucas H. Gabrielli <heitzmann@gmail.com>
# Contributor: eDgar <eDgar|-at*|openmail cc>
_base=ufl
pkgname=python-${_base}-git
pkgdesc="UFL - Unified Form Language"
pkgver=2021.1.0.14.g1de7f12a
pkgrel=1
arch=('any')
url="https://github.com/FEniCS/${_base}"
license=(LGPL3)
depends=(python-numpy)
makedepends=(python-setuptools git)
checkdepends=(python-pytest)
provides=("python-${_base}=${pkgver%%.r*}")
conflicts=("python-${_base}")
options=(!emptydirs)
source=("${_base}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  git describe --tags --match '*.*' | tr '-' '.'
}

build() {
  cd ${_base}
  python setup.py build
}

check() {
  cd ${_base}
  python setup.py install --root="${PWD}/tmp_install" --optimize=1
  PYTHONPATH="${PWD}/tmp_install$(python -c "import site; print(site.getsitepackages()[0])"):${PYTHONPATH}"
  python -m pytest
}

package() {
  cd "${_base}"
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm644 COPYING "${pkgdir}/usr/share/licenses/${pkgbase}/LICENSE"
}
