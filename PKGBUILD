# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=vt-py
pkgname=python-${_base}
pkgver=0.17.5
pkgrel=1
pkgdesc="Official Python client library for VirusTotal's REST API"
arch=(any)
url="https://github.com/virustotal/${_base}"
license=(Apache)
depends=(python-aiohttp)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
checkdepends=(python-pytest-asyncio python-pytest-httpserver)
provides=(python-virustotal)
replaces=(python-virustotal-api)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4167ef4ba7e66f9b82e56a8aad0f5295213369233484278b508b70fe2fa06e01b797b2d28f2a9fe72040d073219d4ff741e2712112aafe239ae03491dde3dacf')

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
