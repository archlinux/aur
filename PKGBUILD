# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: username227
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.147.0
pkgrel=2
pkgdesc="Lightweight static analysis for many languages. Find bug variants with patterns that look like source code."
arch=(x86_64)
url=https://github.com/returntocorp/semgrep
license=(LGPL-2.1-only)

makedepends=('python-pip' 'python-setuptools' 'python-wheel')
depends=(
  'python>=3.14' 'python-attrs' 'python-boltons' 'python-click' 'python-click-option-group'
  'python-colorama' 'python-defusedxml' 'python-glom' 'python-jsonschema' 'python-packaging'
  'python-peewee' 'python-lsp-jsonrpc' 'python-requests' 'python-rich'  'python-ruamel-yaml'
  'python-tomli' 'python-typing_extensions' 'python-urllib3' 'python-wcmatch' 'python-pydantic'
  'python-opentelemetry-api' 'python-opentelemetry-exporter-otlp-proto-http' 'python-opentelemetry-sdk'
  'python-opentelemetry-instrumentation-requests' 'python-starlette' 'python-mcp' 'python-fastmcp'
)
optdepends=('jsonnet: experimental jsonnet support')
provides=('semgrep')

_b2sum="c5d920ad508af6759b61952c2f3209a39c494d7c396cf2dfe24f7029b59dd517"
_whl="semgrep-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"

options=('!strip')
noextract=("${_whl}")
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "fix.patch")
sha512sums=('832a8b443a768cb08006f00575a1ba396765ad3e4fbfe6b66a91f344200d0e87d6b1beb65f78c36279d4fd73a86940cef90eb332ddad97d7d1edb9cadcf29766'
            '1e9ef18cb9130075aac39408f2ede92956e81360358a23eda4835788ced0c654283dfc90588c54baaed9272574cf58024aac9d6f1afca51029f17ecf26844040')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="${pkgdir}" --ignore-installed --no-warn-script-location --root-user-action ignore --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  cd "${pkgdir}/" || return 1
  patch -p1 < "${srcdir}/fix.patch"
}
