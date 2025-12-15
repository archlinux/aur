# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: username227
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.145.2
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

_b2sum="b6e186d206f5f97945ccc9b5b2fd9f84ae743a2d035cd485ea809d3c0cd89d56"
_whl="semgrep-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"

options=('!strip')
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "fix.patch")
sha512sums=('d3bb1c86c22f11b5db4843d206d86f108b83dfdc4a8ffc94f5cb52c9e36279998c1fba4abec8c7f489f3e7acfb55cc8837c2672d001e9c775f368cb5cc2ee560'
            '27ba5020f1cca58ed584347907bd1ed8e4456490c0923df257b45929612c1ad0ef7614ee6d04e818fc8d4118da6c3df46979c97979701d462dac37927dccb562')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  cd "${pkgdir}/" || return 1

  patch -p1 < "${srcdir}/fix.patch"

# find ./ -name '__pycache__' -type d -exec rm -rf {} +
}
