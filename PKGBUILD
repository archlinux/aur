# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=esutil
pkgname=python-${_base}
pkgver=0.6.12
pkgrel=1
pkgdesc="Erin Sheldons Python Utilities"
arch=(any)
url="https://pypi.org/project/${_base}"
license=(GPL)
depends=(python-numpy)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-scipy)
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz)
sha512sums=('55b65d92fa10512513b2fc9c7b91d37a27e1207478094c451d31ad18c5ae1ff4a847714687ffe87fbcf0e981779802d5ccd97e455ac427782d1bcc90c271d035')

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
