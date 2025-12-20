# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: username227
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.146.0
pkgrel=1
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL-2.1-only)

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python' 'python-attrs' 'python-boltons' 'python-click' 'python-click-option-group'
  'python-colorama' 'python-defusedxml' 'python-glom' 'python-jsonschema' 'python-packaging'
  'python-peewee' 'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml'
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-pydantic'
  'python-opentelemetry-api' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-sdk'
  'python-opentelemetry-instrumentation-requests' 'python-starlette' 'python-mcp' 'python-fastmcp'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=('semgrep')

_b2sum="dedbc873b2c9f7d2ca49d8a9e536991066a513d2cabde15c587034e03f7ab2ed"
_whl="semgrep-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"

options=('!strip')
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "fix.patch")
sha512sums=('febfadfae1e0ed324196575bf5b2dd9760235b2036aab502e60763a5cd62faea09ee6d3880b14a3eab69d054fb29c1867ba78b67a2e504042ddf6f65d498dbf7'
            '1376150a4b4310d7b4ac65f82f91d0e06c0588540d21634fe8f03bb0655a932a2defcc632cc19409f8175982620f08d3982d9986ac09b87e5b72703817314277')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  cd "${pkgdir}/" || return 1

  patch -p1 < "${srcdir}/fix.patch"

  # find ./ -name '__pycache__' -type d -exec rm -rf {} +
}
