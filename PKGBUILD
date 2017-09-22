# Maintainer: Hugo Osvaldo Barrera <hugo@barrera.io>

pkgname=todoman
pkgver=3.2.4
pkgrel=1
pkgdesc="A simple CalDav-based todo manager."
arch=("any")
url="https://github.com/pimutils/todoman"
license=('ISC')
depends=(python-icalendar python-urwid python-xdg python-parsedatetime
         python-atomicwrites python-click python-setuptools-scm
         python-configobj python-dateutil python-tabulate python-humanize)
optdepends=('python-click-repl-git: the repl command.')
checkdepends=('python-pytest' 'python-hypothesis' 'python-pytest-runner'
              'python-freezegun')
source=("https://github.com/pimutils/todoman/releases/download/v${pkgver}/todoman-${pkgver}.tar.gz"
        "https://raw.githubusercontent.com/pimutils/$pkgname/v$pkgver/bin/todo")
noextract=("$pkgname-$pkgver-py3-none-any.whl")
md5sums=('d970432621d1493ddd2c9fe591940421'
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
