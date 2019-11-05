# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=6.6.9
pkgrel=2
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='https://sopel.chat'
depends=('ipython' 'python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-geoip2' 'python-pyenchant' 'python-requests' 'python-dnspython' 'python-sqlalchemy')
makedepends=('python-sphinx')
checkdepends=('python-pytest-runner')
backup=('etc/sopel.cfg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sopel-irc/sopel/archive/v$pkgver.tar.gz")
sha512sums=('d1c91bc972742136cb786cad1cac09b485c6efd5ba11686002005a6f212ba326e2338c085cf6dffe5c23a04a1b414ab82933ef671bb9153c13875041a1ecd771')

export LC_CTYPE=en_US.UTF-8

prepare() {
  cd sopel-$pkgver
  sed -i 's/<6/<7/' requirements.txt
  sed -e 's|Hey|Hi|' -i sopel/modules/translate.py # Update test for current Google translate results
}

build() {
  cd sopel-$pkgver
  python setup.py build
  make -C docs man
}

check() {
  cd sopel-$pkgver
  python setup.py pytest --addopts "--ignore build/"
}

package() {
  cd sopel-$pkgver
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/sopel.cfg "$pkgdir/etc/sopel.cfg"
  install -Dm644 contrib/sopel.service "$pkgdir/usr/lib/systemd/system/sopel.service"
  install -Dm644 contrib/sopel.conf "$pkgdir/usr/lib/tmpfiles.d/sopel.conf"
  install -Dm644 docs/build/man/sopel.1 "$pkgdir/usr/share/man/man1/sopel.1"
}
