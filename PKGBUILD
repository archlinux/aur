# Maintainer: fzerorubigd <fzero@rubi.gd>
# Contributor: Sven-Hendrik Haase <sh@lutzhaase.com>

pkgname=pgcli-git
pkgver=v2.0.1.r5.g9494ef70
pkgrel=1
pkgdesc="a command line interface for Postgres with auto-completion and syntax highlighting"
url="http://pgcli.com/"
arch=(any)
license=('BSD')
depends=('python' 'python-sqlparse' 'python-psycopg2' 'python-click' 'python-prompt_toolkit' 'python-humanize' 'python-configobj' 'python-pgspecial>=1.9.0' 'python-setproctitle' 'python-cli_helpers')
optdepends=('python-keyring: using keyring for saving password')
makedepends=('python-distribute')
source=("git://github.com/amjith/pgcli.git")
md5sums=('SKIP')
provides=('pgcli')
conflicts=('pgcli')
pkgver() {
  cd "$srcdir/pgcli"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


package() {
    cd $srcdir/pgcli
    python setup.py install --root=$pkgdir/ --optimize=1
    echo "#!/usr/bin/bash" > $pkgdir/usr/bin/pgcli
    echo "python -c 'import pgcli.main; pgcli.main.cli()' \"\$@\"" >> $pkgdir/usr/bin/pgcli
}
