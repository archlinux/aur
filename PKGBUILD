# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=FMPy
pkgname=python-${_base,,}
pkgver=0.3.12
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/${_base}"
arch=(any)
license=('custom:BSD-2-clause')
depends=(python-attrs python-jinja python-lark-parser python-lxml python-msgpack python-numpy python-pytz)
makedepends=(python-build python-installer python-setuptools python-wheel python-requests cmake)
# checkdepends=(python-pytest python-dask python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('f42e49a527217a646d1e42b1f3e3b981f6aa83a9001576e5009843d771f9f2f59be0a53d4687005ebc2e02b128c31d75c75c8fba4655bb7021ea51f71cef2436')

build() {
  cd ${_base}-${pkgver}
  python build_cvode.py
  python -m build --wheel --skip-dependency-check --no-isolation
}

# check() {
#   cd ${_base}-${pkgver}
#   python -m venv --system-site-packages test-env
#   test-env/bin/python -m installer dist/*.whl
#   test-env/bin/python -m pytest tests
# }

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
