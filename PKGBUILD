# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman-git
_pkgname=todoman
pkgver=4.1.1.dev19+g249f124
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://github.com/pimutils/todoman"
license=('ISC')
makedepends=(
  git
  python-build
  python-installer
  python-setuptools-scm
)
depends=(
  python-atomicwrites
  python-click
  python-click-log
  python-dateutil
  python-humanize
  python-icalendar
  python-parsedatetime
  python-tabulate
  python-urwid
  python-xdg
)
optdepends=('python-click-repl: the repl command.'
            'bash-completion: bash autocompletion.'
            'zsh-completions: zsh autocompletion.')
checkdepends=('python-pytest' 'python-hypothesis' 'python-pytest-runner'
              'python-freezegun' 'python-pytest-cov')
conflicts=("todoman")
provides=("todoman")
source=(git+https://github.com/pimutils/todoman.git)
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  python -m setuptools_scm 2> /dev/null
}

build() {
  cd "$srcdir/$_pkgname"
  python -m build --wheel --no-isolation
}

check() {
  cd "$srcdir/$_pkgname"

  export PYTHONPATH="${PYTHONPATH%:}:${PWD}"
  export TZ=UTC
  python -m pytest
}

package() {
  cd "$srcdir/$_pkgname"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm 644 config.py.sample \
    "$pkgdir/usr/share/doc/todoman/examples/config.py"

  install -Dm 755 bin/todo "$pkgdir/usr/bin/todo"

  install -Dm 644 contrib/completion/bash/_todo \
    "$pkgdir/usr/share/bash-completion/completions/todo"

  install -Dm 644 contrib/completion/zsh/_todo \
    "$pkgdir/usr/share/zsh/site-functions/_todo"
}
