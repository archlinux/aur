# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Jameson Pugh <imntreal@gmail.com>
_base=endpoints
pkgname=python-${_base}
pkgver=5.0.1
pkgrel=2
pkgdesc="Get an api up and running quickly"
arch=(any)
url="https://github.com/jaymon/${_base}"
license=(MIT)
depends=(python-decorators python-datatypes)
makedepends=(python-build python-installer python-setuptools python-wheel)
checkdepends=(python-pytest python-testdata python-requests python-tornado python-websocket-client python-gevent)
optdepends=('python-websocket-client' 'python-tornado')
source=(https://pypi.org/packages/source/${_base::1}/${_base}/${_base}-${pkgver}.tar.gz
  001-setup.py.patch)
sha512sums=('6658a2e472be58a1a9c2a07507bbb1b48b02a43037657fb21884f3ea491b9ed9f5d1823edbd9c6f6556093a6ba3385760506b0de1f835cd5c404f3a7d68a36b5'
  'f156548050ea505766a7ccd9be3e3a7830602ea4b9acd19c59032a101a818dd27c4dea271055e439e299b6550c19ab2bf8ec255fa5422d5af2ea805e4cf98a6a')

prepare() {
  # setup.py installs tests directory; remove it
  patch -p1 -d ${_base}-${pkgver} <001-setup.py.patch
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
}

check() {
  cd ${_base}-${pkgver}
  # tests require a Vagrant and pyenv environment
  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  test-env/bin/python -m pytest tests \
    --ignore=tests/call_test.py \
    --ignore=tests/decorators_test.py \
    --ignore=tests/reflection_test.py \
    --ignore=tests/interface/tornado_test.py \
    --ignore=tests/interface/uwsgi_test.py \
    --ignore=tests/interface/wsgi_test.py \
    --ignore=tests/http_test.py \
    --ignore=tests/extras/html_test.py
}

package() {
  cd ${_base}-${pkgver}
  PYTHONPYCACHEPREFIX="${PWD}/.cache/cpython/" python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
  install -Dm 644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
}
