# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: username227
# Contributor: ejedev <evan@ejedev.com>
# Contributor: Aloxaf <aloxafx@gmail.com>

_name=semgrep
pkgname=${_name}-bin
pkgver=1.145.0
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

_b2sum="4afd08e731b69529a42bb95b72883848cc720b8669c781ca99bb623751a6df00"
_whl="semgrep-${pkgver}-cp310.cp311.cp312.cp313.cp314.py310.py311.py312.py313.py314-none-musllinux_1_0_${CARCH}.manylinux2014_${CARCH}.whl"

options=('!strip')
source=("https://files.pythonhosted.org/packages/${_b2sum:0:2}/${_b2sum:2:2}/${_b2sum:4}/${_whl}"
        "fix.patch")
sha512sums=('37288fe9c8a730f04ee40d40286d7b6709365c2b20160a411505c442e0b82ce446cd06b5cdf138ba1093914161b6d98e971094586867ab34647e51c1594d2f2f'
            '27ba5020f1cca58ed584347907bd1ed8e4456490c0923df257b45929612c1ad0ef7614ee6d04e818fc8d4118da6c3df46979c97979701d462dac37927dccb562')


package() {
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps "${_whl}"

  python -O -m compileall "${pkgdir}"

  cd "${pkgdir}/" || return 1

  patch -p1 < "${srcdir}/fix.patch"

# find ./ -name '__pycache__' -type d -exec rm -rf {} +
}
