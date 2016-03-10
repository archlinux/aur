# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=6.3.1
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='http://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-pyenchant' 'python-pygeoip')
makedepends=('git' 'python-sphinx')
checkdepends=('python-pytest-runner' 'ipython')
backup=('etc/sopel.cfg')
source=("git+https://github.com/sopel-irc/sopel.git#tag=$pkgver")
md5sums=('SKIP')

build() {
  cd "$srcdir/sopel"
  python setup.py build
  make -C docs man
}

check() {
  cd "$srcdir/sopel"
  mv build ../
  python setup.py ptr || warning "Tests failed"
  mv ../build ./
}

package() {
  cd "$srcdir/sopel"
  python setup.py install --root="${pkgdir}" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/sopel.cfg "$pkgdir/etc/sopel.cfg"
  install -Dm644 contrib/sopel.service "$pkgdir/usr/lib/systemd/system/sopel.service"
  install -Dm644 contrib/sopel.conf "$pkgdir/usr/lib/tmpfiles.d/sopel.conf"
  install -Dm644 docs/build/man/sopel.1 "$pkgdir/usr/share/man/man1/sopel.1"
}
