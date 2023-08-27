# Maintainer: Vadim Yanitskiy <fixeria@osmocom.org>
# Contributor: Maxim Kurnosenko <asusx2@mail.ru>
# Contributor: Marco A Rojas <marco.rojas@zentek.com.mx>

# Workaround for kannel.org SSL certificate issues
DLAGENTS=("https::/usr/bin/curl -k -o %o %u")

pkgname=kannel
pkgver=1.4.5
pkgrel=5
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
backup=("etc/${pkgname}/kannel.conf"
        "etc/${pkgname}/modems.conf")
source=("https://kannel.org/download/${pkgver}/gateway-${pkgver}.tar.gz"
        kannel.conf
        modems.conf
        kannel.default
        kannel.tmpfiles
        kannel-bearerbox.service
        kannel-smsbox.service
        kannel-wapbox.service
        gateway-${pkgver}.bison.patch
        10_fix_multiple_definitions.patch)
md5sums=('b6b5b48edb646e0e0e2ea5378c8ac9ff'
         '4ce997cc057720b29a9635d478968fdb'
         '24ae1183521fe871e39f499eed27b93a'
         '7575cd21bcd397bcc02a01b57fb4d429'
         'ed309e56b6fa05e65d8eb70f15bbfee6'
         '840ce8e0872cbed6cdf4bb23f7fcf8b0'
         '80f533ba7042d5ef29685b864601d3ae'
         '5b0d139b7a153390598cfc278d80d5ea'
         '5adb3c84885e70da557ea083c9dd205c'
         '8e013264da946255b7e1040eead7b657')

prepare()
{
  cd ${srcdir}/gateway-${pkgver}
  patch -p1 < ${srcdir}/gateway-${pkgver}.bison.patch
  patch -p1 < ${srcdir}/10_fix_multiple_definitions.patch
}

build() {
  cd ${srcdir}/gateway-${pkgver}
  ./configure \
      --prefix=/usr \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --mandir=/usr/share/man \
      --enable-start-stop-daemon \
      --with-mysql \
      --with-sqlite3 \
      --with-pgsql \
      --with-redis
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
