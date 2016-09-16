# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=6.4.0
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='http://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-pyenchant' 'python-pygeoip')
makedepends=('git' 'python-sphinx')
checkdepends=('python-pytest' 'ipython')
backup=('etc/sopel.cfg')
source=("git+https://github.com/sopel-irc/sopel.git#tag=$pkgver")
md5sums=('SKIP')

prepare() {
  sed -i 's/requests>.*/requests/' sopel/requirements.txt

  export LC_CTYPE=en_US.UTF-8
}

build() {
  cd sopel
  python setup.py build
  make -C docs man
}

check() {
  cd sopel
  py.test --ignore=sopel.py --ignore=build/ || warning "Tests failed"
}

package() {
  cd sopel
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 contrib/sopel.cfg "$pkgdir/etc/sopel.cfg"
  install -Dm644 contrib/sopel.service "$pkgdir/usr/lib/systemd/system/sopel.service"
  install -Dm644 contrib/sopel.conf "$pkgdir/usr/lib/tmpfiles.d/sopel.conf"
  install -Dm644 docs/build/man/sopel.1 "$pkgdir/usr/share/man/man1/sopel.1"
}
