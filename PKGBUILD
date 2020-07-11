# Maintainer: Carter Green <crtrgreen at gmail dot com>
pkgname=mssql-cli
pkgver=1.0.0
pkgrel=1
pkgdesc="Interactive command line query tool for SQL Server"
arch=(any)
url="https://github.com/dbcli/mssql-cli"
license=('BSD')
depends=('python' 'python-click' 'python-argparse' 'python-pygments'
         'python-prompt_toolkit' 'python-sqlparse' 'python-configobj'
         'python-humanize' 'python-cli_helpers' 'python-applicationinsights'
         'python-future')
makedepends=('python-pip')
source=("https://files.pythonhosted.org/packages/py2.py3/${pkgname::1}/${pkgname//-/_}/${pkgname//-/_}-${pkgver}-py2.py3-none-manylinux1_x86_64.whl")
sha256sums=('edb3850ab8ffa077c64270f27263f6377fdb5bd5bb5c5b4990c5fb08f49627b6')

package() {
  cd "$srcdir"
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps *.whl
  msg2 "Removing non-existant required static libraries..."
  local deps_path="${pkgdir}$(python --version | \
    awk -F'[ .]' '{ printf "/usr/lib/python%s.%s/site-packages/mssqlcli/mssqltoolsservice/bin/MicrosoftSqlToolsServiceLayer.deps.json",
      $2, $3 }')"
  sed -i '/\.a": {/,+2d' "$deps_path"
  msg2 "Generating .pyo files..."
  python -O -m compileall "$pkgdir"
}

# vim:set ts=2 sw=2 et:

