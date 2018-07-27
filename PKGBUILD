# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=6.5.3
pkgrel=2
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='https://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-pyenchant' 'python-pygeoip')
makedepends=('python-sphinx')
checkdepends=('python-pytest-runner' 'ipython')
backup=('etc/sopel.cfg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sopel-irc/sopel/archive/v$pkgver.tar.gz")
sha512sums=('6f8f3003c87f8092a7a05320197237033f8d650402155f1f71482078e2bb851aa5f1942d2ccf378d3446011326f174087f478754e212b40e2216e2ad46a82812')

export LC_CTYPE=en_US.UTF-8

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
