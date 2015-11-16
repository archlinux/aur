# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=6.1.0
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='http://sopel.chat'
depends=('python-setuptools' 'sqlite')
optdepends=('python-feedparser: nws and rss modules'
            'python-pytz: remind module'
            'python-lxml: xkcd module'
            'python-pyenchant: spellcheck module'
            'python-praw: reddit module'
            'python-pygeoip: geoip module'
            'python-xmltodict: bugzilla, currency, weather modules')
makedepends=('git' 'python-sphinx')
checkdepends=('python-pytest' 'python-feedparser' 'python-pytz' 'python-lxml'
              'python-pyenchant' 'python-praw' 'python-pygeoip' 'ipython'
              'python-xmltodict')
backup=('etc/sopel.cfg')
source=("git+https://github.com/sopel-irc/sopel.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  sed -e 's|willie|sopel|g' -e 's|Willie|Sopel|g' -i sopel/contrib/willie{.cfg,.service,.conf}
}

build() {
  cd "$srcdir/sopel"
  python setup.py build
  make -C docs man
}

check() {
  cd "$srcdir/sopel"
  py.test build || warning "Tests failed"
}

package() {
  cd "$srcdir/sopel"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/willie.cfg "$pkgdir/etc/sopel.cfg"
  install -Dm644 contrib/willie.service "$pkgdir/usr/lib/systemd/system/sopel.service"
  install -Dm644 contrib/willie.conf "$pkgdir/usr/lib/tmpfiles.d/sopel.conf"
  install -Dm644 docs/build/man/sopel.1 "$pkgdir/usr/share/man/man1/sopel.1"
}
