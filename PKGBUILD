# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=esutil
pkgname=python-${_base}
pkgver=0.6.11
pkgrel=1
pkgdesc="Erin Sheldons Python Utilities"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(GPL)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('d814e00574b6d1927dc280825260f85d253cc8243158a826f5d4a75eba03ef2ac190d44cac843859f4e0d771dd788216bb63a5d6f8210f873abb9c34098eba50')

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
