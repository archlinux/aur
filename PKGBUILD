# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: devome <evinedeng@hotmail.com>

_pkgname=firecrawl-py
_pipname="${_pkgname//-/_}"
pkgname="python-${_pkgname}"
pkgver=4.37.0
pkgrel=1
pkgdesc="Python SDK for Firecrawl API"
arch=('any')
url="https://github.com/mendableai/firecrawl"
license=('MIT')
depends=(python-aiohttp python-dotenv python-httpx python-nest-asyncio python-pydantic python-requests python-websockets)
makedepends=('python-build' 'python-installer' 'python-setuptools' 'python-wheel')
source=("${_pkgname}-${pkgver}.tar.gz::https://files.pythonhosted.org/packages/source/${_pkgname::1}/${_pkgname}/${_pipname}-${pkgver}.tar.gz")
sha256sums=('b1c3f6f896b11ee7f4cab099585a318c56a9f4be6a6438d37af8cbb250361bd0')

latestver() {
    python - <<'PY'
import json
import urllib.request

with urllib.request.urlopen("https://pypi.org/pypi/firecrawl-py/json", timeout=10) as response:
    print(json.load(response)["info"]["version"])
PY
}

build() {
    cd "${_pipname}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${_pipname}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    local site_packages="${pkgdir}/usr/lib/$(readlink /usr/bin/python3)/site-packages"
    rm -rf "${site_packages}/build" "${site_packages}/firecrawl/__tests__" "${site_packages}/tests"
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
