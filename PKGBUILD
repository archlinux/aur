# Maintainer: Carter Green <crtrgreen at gmail dot com>
pkgname=mssql-cli
pkgver=0.15.0
pkgrel=3
pkgdesc="Interactive command line query tool for SQL Server"
arch=(any)
url="https://github.com/dbcli/mssql-cli"
license=('BSD-3-Clause')
depends=('python' 'python-click' 'python-argparse' 'python-pygments'
         'python-prompt_toolkit1' 'python-sqlparse' 'python-configobj'
         'python-humanize' 'python-cli_helpers' 'python-applicationinsights'
         'python-future')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-${pkgver}-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('4971e2e8eaa6fbf5e2ad2b1764a2d7af93b3f5666f0565634da43da7cefd43ea')

prepare() {
  cd "${srcdir}"
  sed -e 's/prompt_toolkit/prompt_toolkit1/g' -i mssqlcli/*.py
  sed -e 's/prompt-toolkit/prompt-toolkit1/g' -i \
    "mssql_cli-${pkgver}.dist-info/METADATA"
}

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  msg2 "Removing non-existant required static libraries..."
  sed -i '/\.a": {}/d' "${pkgdir}/usr/lib/python3.7/site-packages/mssqlcli/mssqltoolsservice/bin/MicrosoftSqlToolsServiceLayer.deps.json"
  msg2 "forcing version 1 of prompt_toolkit ${pkgdir}"
  sed -e 's/prompt_toolkit/prompt_toolkit1/g' -i ${pkgdir}/usr/lib/python3.7/site-packages/mssqlcli/*.py
  msg2 "Generating .pyo files..."
  python -O -m compileall "$pkgdir"
}

# vim:set ts=2 sw=2 et:

