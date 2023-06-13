# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Antony Lee <anntzer dot lee at gmail dot com>
_base=viscm
pkgname=python-${_base}
pkgdesc="A colormap tool"
pkgver=0.10
pkgrel=1
arch=(any)
url="https://github.com/matplotlib/${_base}"
license=(MIT)
depends=(python-matplotlib python-colorspacious python-scipy)
makedepends=(python-build python-installer python-setuptools-scm python-wheel)
checkdepends=(python-pytest pyside6) # python-pytest-xvfb
optdepends=('pyside6: for Qt Python bindings'
  'python-pyqt6: for Qt Python bindings')
source=(${_base}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz)
sha512sums=('92896eb98fecbf29e919bbdfab7fb6fce29fc21ef0e41d01f72742f5a01a0d8d0493195395c9596f1822f4b33dbf89753d79c9a57a4135c4b18fc20c59ce3c9c')

build() {
  cd ${_base}-${pkgver}
  export SETUPTOOLS_SCM_PRETEND_VERSION=${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest --ignore=test/test_gui.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
