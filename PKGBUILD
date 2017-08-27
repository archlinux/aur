# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=3.2.0
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://github.com/pimutils/todoman"
license=('MIT')
depends=(python-icalendar python-urwid python-xdg python-parsedatetime
         python-atomicwrites python-click python-setuptools-scm
         python-configobj python-dateutil python-click-log python-tabulate
         python-humanize)
optdepends=('python-click-repl-git: the repl command.')
checkdepends=('python-pytest' 'python-hypothesis' 'python-pytest-runner'
              'python-freezegun')
source=("https://pypi.io/packages/source/t/$pkgname/$pkgname-$pkgver.tar.gz"
        "https://raw.githubusercontent.com/pimutils/$pkgname/v$pkgver/bin/todo"
        )
noextract=("$pkgname-$pkgver-py3-none-any.whl")
md5sums=('5d6d9414188b218384419b1f5b610d53'
         '929003485379647ca3967f2b395dd6f7')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python setup.py build
}

check() {
  cd "$srcdir/$pkgname-$pkgver"

  export PYTHONPATH="${PYTHONPATH%:}:${PWD}"
  export TZ=UTC
  sed -i '/addopts/d' "$srcdir"/"$pkgname-$pkgver"/setup.cfg
  py.test
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm 644 todoman.conf.sample \
    "$pkgdir/usr/share/doc/todoman/examples/todoman.conf"

  install -Dm 755 "$srcdir/todo" "$pkgdir/usr/bin/todo"
}
