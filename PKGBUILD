# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=7.1.5
pkgrel=1
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
        $pkgname-requests-2.27.patch::https://github.com/sopel-irc/sopel/commit/d25ec2025b66b097d55ea1c7e23cf6ed4945258e.patch)
sha512sums=('e1bcbfa78fccf15b78695ecb216f0e03d224e0debb8d8ca11fec3d50a1a8804a7d8255af52a8dabacddfe851ece0cd87037588169d2ca880e85c5c4a82950add'
            'b4a7538c3034df24568eb61d9150dc8ee29273205a1563b79b36d137547036b49c315fc4f10408c328664a13e73b8eb4ef6be11447cd6e09564af3240cf2cee0')

prepare() {
  cd sopel-$pkgver
  patch -p1 -i ../$pkgname-requests-2.27.patch
  sed -i 's/<6/<8/;s/==0.12/>=0.12/' {dev-,}requirements.txt
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
