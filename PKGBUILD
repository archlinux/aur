# Maintainer: Andrew O'Neill <andrew at meanjollies dot com>

pkgname=nostromo
pkgver=1.9.6
pkgrel=1
pkgdesc='A simple, fast, and secure HTTP server'
arch=('i686' 'x86_64')
url='http://www.nazgul.ch/dev_nostromo.html'
license=('custom:ISC')
depends=('openssl')
makedepends=('openssl')
backup=("etc/$pkgname/conf/nhttpd.conf"
        "etc/$pkgname/conf/mimes"
        "etc/logrotate.d/$pkgname")
install=$pkgname.install
source=(http://www.nazgul.ch/dev/$pkgname-$pkgver.tar.gz
        $pkgname.service
        $pkgname.logrotate
        $pkgname.patch
        $pkgname.install
        LICENSE)
sha1sums=('6f3d8ebc15486398f819ac55a9d2a9ac14c3b35e'
         '57eee54e5ba9f0ee60cceae13ba96d060f870812'
         'a0069cb13614bee9b3bef76188597de3948be71d'
         '4ac52e8978c2f5222f58f01e1e2ec255978f1ade'
         '73d871a104e7c1c5e197961dee96f33b0909c41e'
         'e5abcccacf9d1c9136e55de2cc0dceaabdb02ec1')

prepare() {
  cd $pkgname-$pkgver

  patch -p1 -i ../$pkgname.patch
}

build() {
  cd $pkgname-$pkgver

  make
}

package() {
  cd $pkgname-$pkgver

  install -d $pkgdir/usr/bin
  install -d $pkgdir/usr/share/man/man8

  make DESTDIR="$pkgdir" install

  install -Dm644 $srcdir/$pkgname.logrotate $pkgdir/etc/logrotate.d/$pkgname
  install -Dm644 $srcdir/$pkgname.service $pkgdir/usr/lib/systemd/system/$pkgname.service
  install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
