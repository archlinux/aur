# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=esutil
pkgname=python-${_base}
pkgver=0.6.10
pkgrel=1
pkgdesc="Erin Sheldons Python Utilities"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(GPL)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('32a608bce04d237ac096ee0474d172e29d2d42fa5d588bc83d8e087b8140c6e45446a6051d18a23a7ec252287a3b890de4375a7e980a61b1be70946aadb64876')

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
