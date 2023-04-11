# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Michel Zou <xantares09@hotmail.com>
_base=FMPy
pkgname=python-${_base,,}
pkgver=0.3.15
pkgrel=1
pkgdesc="Simulate Functional Mockup Units (FMUs) in Python"
url="https://github.com/CATIA-Systems/${_base}"
arch=(any)
license=('custom:BSD-2-clause')
depends=(python-attrs python-jinja python-lark-parser python-lxml python-msgpack python-numpy python-pytz)
makedepends=(python-build python-installer python-setuptools python-wheel python-requests cmake)
# checkdepends=(python-pytest python-dask python-scipy)
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('38317705b128daff91677ccf0e35c855227f9a6b43ad106e9fb067e28fe29b45e62de278a28f13cd8e9894492be0178c88ebbaf1da66ec9070f167c762232c9f')

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
