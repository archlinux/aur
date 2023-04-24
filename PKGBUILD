# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=7.1.9
pkgrel=2
pkgdesc="An easy-to-use and highly extensible IRC Bot framework (Formerly Willie)"
arch=('any')
license=('custom:EFL')
url='https://sopel.chat'
depends=('python-setuptools' 'sqlite' 'python-xmltodict' 'python-pytz' 'python-praw'
         'python-geoip2' 'python-requests' 'python-dnspython' 'python-sqlalchemy1.3')
makedepends=('python-sphinx' 'python-sphinxcontrib-autoprogram')
checkdepends=('python-pytest' 'python-pytest-vcr' 'python-requests-mock')
backup=('etc/sopel.cfg')
source=("https://github.com/sopel-irc/sopel/archive/v$pkgver/$pkgname-$pkgver.tar.gz"
	"open-U-deprecated.patch")
sha512sums=('55fd81f7d16bf3a46c216a0ae68b72df3cc2f4d1d282786f87eadadf51d19838f92d2e29a6a424905099dbf9e27ea495f6d54e676947dcd5c3edcff1d7b5aea3'
            'aa3d13fad475bc5004545303694c3ce7eb7de9f780e266858aa70a47ca098b851395754962604210e3fb839af8e86ee237e36e2d15d3fe9dba5390f65e9a8db3')

prepare() {
  cd sopel-$pkgver
  sed -i 's/<6/<8/;s/==0.12/>=0.12/' {dev-,}requirements.txt
  patch -Np1 -i ${srcdir}/open-U-deprecated.patch
}

build() {
  cd sopel-$pkgver
  python setup.py build egg_info
  PYTHONPATH="$PWD" make -C docs man
}

check() {
  cd sopel-$pkgver
  PYTHONPATH="$PWD" pytest --ignore build/ -p no:nose
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
