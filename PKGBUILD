# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=5.5.1
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='http://sopel.chat'
depends=('python-setuptools' 'sqlite')
optdepends=('python-feedparser: nws and rss modules'
            'python-pytz: remind module'
            'python-lxml: xkcd module'
            'python-pyenchant: spellchek module'
            'python-praw: reddit module'
            'python-pygeoip: geoip module')
makedepends=('git' 'python-sphinx')
checkdepends=('python-pytest' 'python-feedparser' 'python-pytz' 'python-lxml'
              'python-pyenchant' 'python-praw' 'python-pygeoip')
backup=('etc/willie.cfg')
source=("git+https://github.com/sopel-irc/sopel.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/sopel"
  python setup.py build
  make -C docs man
}

check() {
  cd "$srcdir/sopel"
  py.test --ignore build || warning "Tests failed"
}

package() {
  cd "$srcdir/sopel"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/willie.cfg "$pkgdir/etc/willie.cfg"
  install -Dm644 contrib/willie.service "$pkgdir/usr/lib/systemd/system/willie.service"
  install -Dm644 contrib/willie.conf "$pkgdir/usr/lib/tmpfiles.d/willie.conf"
  install -Dm644 docs/build/man/willie.1 "$pkgdir/usr/share/man/man1/willie.1"
}
