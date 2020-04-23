# Maintainer: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Marco A Rojas <marco.rojas@zentek.com.mx>

pkgname=kannel
pkgver=1.4.5
pkgrel=3
pkgdesc="Kannel is a compact and very powerful open source WAP and SMS gateway, it comes with extras!"
arch=('any')
license=('custom')
url="https://kannel.org/"
install=kannel.install
depends=('bison' 'libxml2')
makedepends=('mariadb' 'postgresql' 'sqlite' 'hiredis')
optdepends=('mariadb: MySQL database backend'
            'postgresql: database backend'
            'sqlite: SQLite3 database backend'
            'hiredis')
groups=('base-devel')
source=("https://kannel.org/download/${pkgver}/gateway-${pkgver}.tar.gz"
        kannel.conf
        modems.conf
        kannel.default
        kannel.tmpfiles
        kannel-bearerbox.service
        kannel-smsbox.service
        kannel-wapbox.service
        gateway-${pkgver}.bison.patch)
md5sums=('b6b5b48edb646e0e0e2ea5378c8ac9ff'
         '7090740f6f82d8973bf07ba538a3dd80'
         '24ae1183521fe871e39f499eed27b93a'
         '7575cd21bcd397bcc02a01b57fb4d429'
         'ed309e56b6fa05e65d8eb70f15bbfee6'
         '43c8248224a130e27ca2bad84eca9e42'
         '7aedab47cc36958e2848c5c357ffb34b'
         'e4bac33d1ff8dc6947f5850c6fe3d6b0'
         '5adb3c84885e70da557ea083c9dd205c')

prepare()
{
  cd ${srcdir}/gateway-${pkgver}
  patch -p1 < ${srcdir}/gateway-${pkgver}.bison.patch
}

build() {
  cd ${srcdir}/gateway-${pkgver}
  ./configure --prefix=/usr/local --mandir=/usr/share/man --enable-start-stop-daemon --with-mysql --with-sqlite3 --with-pgsql --with-redis
  make libgw.a
  make libgwlib.a
  make
}

check() {
  cd ${srcdir}/gateway-${pkgver}
  make check
}

package() {
  cd ${srcdir}
  install -dm770 $pkgdir/var/log/kannel
  install -dm770 $pkgdir/var/spool/kannel

  install -Dm644 kannel.conf "$pkgdir/etc/kannel/kannel.conf"
  install -Dm644 modems.conf "$pkgdir/etc/kannel/modems.conf"
  install -Dm644 kannel.default "$pkgdir/etc/default/kannel"
  install -Dm644 kannel-bearerbox.service "$pkgdir/usr/lib/systemd/system/kannel-bearerbox.service"
  install -Dm644 kannel-smsbox.service "$pkgdir/usr/lib/systemd/system/kannel-smsbox.service"
  install -Dm644 kannel-wapbox.service "$pkgdir/usr/lib/systemd/system/kannel-wapbox.service"
  install -Dm644 kannel.tmpfiles "$pkgdir/usr/lib/tmpfiles.d/kannel.conf"

  cd gateway-${pkgver}
  make DESTDIR=${pkgdir} install

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
