# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=vt-py
pkgname=python-${_base}
pkgver=0.21.0
pkgrel=1
pkgdesc="Official Python client library for VirusTotal's REST API"
arch=(any)
url="https://github.com/virustotal/${_base}"
license=(Apache-2.0)
depends=(python-aiohttp python-aiofiles)
makedepends=(python-build python-installer python-setuptools python-wheel python-sphinx)
checkdepends=(python-pytest-asyncio python-pytest-httpserver)
provides=(python-virustotal)
replaces=(python-virustotal-api)
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz)
sha512sums=('4baa1ddfc77fb74ab296ec510745f5c828b26545fbd4aface9fe54dc3cd488059affedc020a22e982b145ee348ba9e6c54de7198c5f8c0f635b6064fa3ae2629')

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
