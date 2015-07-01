# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
pkgname="burp-backup14"
_pkgname="burp"
pkgver=1.4.40
pkgrel=1
pkgdesc="Burp is a backup and restore program. Built from 1.4.x stable candidate releases"
arch=('i686' 'x86_64')
license=("AGPLv3")
depends=('librsync' 'openssl')
install=$_pkgname.install
url='http://burp.grke.org/'
source=(
    "http://downloads.sourceforge.net/project/${_pkgname}/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}.tar.bz2"
    "$_pkgname.install"
    "$_pkgname.service"
)
sha256sums=('4108eb45e14740de990d918a2adbb661d88f90de48d6e2e3a6b54fd12b16fa5e'
            'ce030820046da1372949f9cc5a5123c6dcc1bda73acd18b6c02f96db1402e0c9'
            'fe6ad8f3bf94132437aa05958337f6729a2daf92daecdb237cfa8bb7f63233fc')

# make sure that config files that might be changed by the user do not
# get overwritten on upgrade.
backup=('etc/burp/burp.conf'
        'etc/burp/burp-server.conf'
	'etc/burp/CA.cnf'
	'etc/burp/notify_script'
	'etc/burp/ssl_extra_checks_script'
	'etc/burp/summary_script'
	'etc/burp/timer_script'
	'etc/cron.d/burp'
	'etc/logrotate.d/burp')

prepare() {

  cd $_pkgname-$pkgver
  sed -i 's/\/var\/run/\/run/' Makefile.in

}

build() {

  cd $_pkgname-$pkgver
  ./configure --sbindir=/usr/bin
  make

}

check() {

  cd $_pkgname-$pkgver
  make test

}


package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install

 # cron.d logrotate systemd
  mkdir -p $pkgdir/etc/cron.d
  cp debian/burp.cron.d $pkgdir/etc/cron.d/burp
  mkdir -p $pkgdir/etc/logrotate.d
  cp debian/logrotate $pkgdir/etc/logrotate.d/burp
  mkdir -p $pkgdir/usr/lib/systemd/system
  cp $srcdir/burp.service $pkgdir/usr/lib/systemd/system/burp.service

 # fix permissions
  mkdir -p $pkgdir/var/spool/burp
  chmod 755 $pkgdir/var/spool
  chmod 0600 $pkgdir/etc/burp/burp.conf
  chmod 0600 $pkgdir/etc/burp/burp-server.conf
  chmod 0700 $pkgdir/etc/burp/clientconfdir
  chmod 0700 $pkgdir/var/spool/burp

}
