# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
_base=vt-py
pkgname=python-${_base}
pkgver=0.18.0
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
sha512sums=('b5ad6f1ef6401a46b4cdcc4f1b7a8696bc9c6ba6f4012cf497c65e469d2d569054f02224c0b914622aea06d7d39a6a8704fa20eae757d1dbdadce2a0eb65abf6')

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
