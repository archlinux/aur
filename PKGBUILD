# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=7.1.1
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='https://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-geoip2' 'python-requests' 'python-dnspython' 'python-sqlalchemy')
makedepends=('python-sphinx' 'python-sphinxcontrib-autoprogram')
checkdepends=('python-pytest-runner' 'python-requests-mock')
backup=('etc/sopel.cfg')
source=("https://github.com/sopel-irc/sopel/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('b310d2357ae6b0344acc583e412c9c2f80a53453b0c4fd5356dcdbd1ddf7659cdbb48f87f3bb6776bf6a789b29e6972ef6e632983c9627dab8fc88aff25ca681')

prepare() {
  cd sopel-$pkgver
  sed -i 's/<6/<8/' {dev-,}requirements.txt
}

build() {
  cd sopel-$pkgver
  python setup.py build egg_info
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd sopel-$pkgver
  LC_CTYPE=en_US.UTF-8 python setup.py pytest --addopts "--ignore build/"
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
