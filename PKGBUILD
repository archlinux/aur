# Maintainer: Noor Christensen <archlinux_AT_technopragmatics_DOT_org>
# shellcheck disable=SC2164,SC2034,SC2154
_pkgauthor=vulnersCom
_pkgname=api
_pkgurl="https://github.com/${_pkgauthor}/${_pkgname}"

pkgname=python-vulners
pkgver=4.5.0
pkgrel=1
_pkgver="v${pkgver}"

pkgdesc="Official Python SDK for the Vulners vulnerability-intelligence API"
url="https://github.com/vulnersCom/api"

arch=('any')
license=('MIT')

depends=(
  'python'
  'python-brotli'
  'python-h2'
  'python-httpx'
  'python-ijson'
  'python-isal'
  'python-orjson'
  'python-pydantic'
  'python-stream-unzip'
  'python-typing-inspection'
  'python-typing_extensions'
  'python-zstandard'
)
makedepends=(
  'python-build'
  'python-installer'
  'python-uv-build'
)
checkdepends=(
  'python-coverage>=7'
  'python-pytest>=8.3'
  'python-pytest-asyncio>=0.24'
  'python-pytest-codspeed>=2.2.1'
  'python-pytest-cov>=5'
  'python-pytest-xdist>=3.6'
  'python-respx>=0.21'
  'python-uv'
)
optdepends=(
  'python-fastmcp: MCP server support'
  'python-opentelemetry-api: OpenTelemetry tracing support'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=('4d7c5a6cf82b63dd4f5f12a4a8c5f620c67314829e8ba56c1e0a075e1ae21dc7')

check() {
  cd "${_pkgname}-${pkgver}"

  python -m venv --system-site-packages test-env
  test-env/bin/python -m installer dist/*.whl
  PYTHONPATH=src test-env/bin/python -m pytest -n auto
}

build() {
  cd "${_pkgname}-${pkgver}"

  python -m build --wheel --no-isolation
}

package() {
  cd "${_pkgname}-${pkgver}"

  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md CONTRIBUTING.md SECURITY.md
}
