# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=vt-py
pkgname=python-${_base}
pkgver=0.18.4
pkgrel=1
pkgdesc="Official Python client library for VirusTotal's REST API"
arch=(any)
url="https://github.com/virustotal/${_base}"
license=(Apache-2.0)
depends=(python-aiohttp)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
checkdepends=(python-pytest-asyncio python-pytest-httpserver)
provides=(python-virustotal)
replaces=(python-virustotal-api)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('5a8b4bf3c3ccdb7161cbb415455d13bb84211abebe9fe10ec1d37fca99f85a12a0ac4ec9516c57a048a0e2b8ad221d5c47be7462a1aaea0183046e2ca6945dd1')

prepare() {
  sed -i '/setup_requires/d' ${_base}-${pkgver}/setup.py
}

build() {
  cd ${_base}-${pkgver}
  python -m build --wheel --skip-dependency-check --no-isolation
  PYTHONPATH="${PWD}" sphinx-build -b man docs/source _build
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
  install -Dm644 "_build/${_base}.1" -t "$pkgdir/usr/share/man/man1/"
  install -Dm 644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
