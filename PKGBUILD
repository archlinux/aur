# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
_base=PINA
pkgname=python-${_base,,}-mathlab
pkgver=0.0.3.post2308
pkgrel=1
pkgdesc="Physics-Informed Neural networks for Advanced modeling"
url="https://github.com/mathLab/${_base}"
arch=(any)
license=(MIT)
depends=(python-pytorch)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('b28276f7ac4da60381aaca32a307e2ebea3b1d1a5327fe8514ed3b13e1645a7d741cf99565b53b9018f633464a5d533a78648ac3c3a1a4c9b6e1c5f58b053d0c')

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
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.rst -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
