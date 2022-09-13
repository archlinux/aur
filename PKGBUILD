# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=sopel
pkgver=7.1.6
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
sha512sums=('bd0272ce4058f231a17da3f1ef48a368adf3dce758c4de2b28dd4f4894bc7c4a42c5d1c1f0094a4aef745fbd4deb3093c839659e837435525618cfa278efdd93'
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
