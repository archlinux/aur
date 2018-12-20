# Maintainer: Andrej Radović <r.andrej@gmail.com>

pkgname=litecli-git
pkgver=v0.0.3.r1.g08d6953
pkgrel=1
pkgdesc="A command-line client for SQLite databases that has auto-completion "\
"and syntax highlighting."
url="https://github.com/dbcli/litecli"
arch=(any)
license=('BSD')
depends=(
  'python'
  'python-click'
  'python-pygments'
  'python-prompt_toolkit'
  'python-sqlparse'
  'python-configobj'
  'python-cli_helpers'
)
makedepends=('python-distribute')
source=("git://github.com/dbcli/litecli.git")
md5sums=('SKIP')
provides=('litecli')
conflicts=('litecli')

pkgver() {
    cd "$srcdir/litecli"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null |
            sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
            printf "r%s.%s" "$(git rev-list --count HEAD)" \
                "$(git rev-parse --short HEAD)"
    )
}

package() {
    cd $srcdir/litecli
    python setup.py install --root=$pkgdir/ --optimize=1
    echo "#!/usr/bin/bash" >$pkgdir/usr/bin/litecli
    python_bin='/usr/bin/python'
    echo "$(python_bin) -c 'import litecli.main; litecli.main.cli()' \"\$@\"" \
        >>$pkgdir/usr/bin/litecli
}
