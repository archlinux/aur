# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=7.0.4
pkgrel=1
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='https://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-geoip2' 'python-requests' 'python-dnspython' 'python-sqlalchemy')
makedepends=('python-sphinx' 'python-sphinxcontrib-autoprogram')
checkdepends=('python-pytest-runner')
backup=('etc/sopel.cfg')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sopel-irc/sopel/archive/v$pkgver.tar.gz")
sha512sums=('1674d2f9f5040d0697e10f9961a8d83c87429b6fc1b93c53157d60addd0b5476ac3aac2fa33d123089710e07f332acfec402b0d7da0e2cb1849b9d47843d62da')

prepare() {
  cd sopel-$pkgver
  sed -i 's/<3/<4/;s/<6/<8/' {dev-,}requirements.txt
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
