# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Idares <idares at seznam dot cz>

pkgname=monitoring-plugins
pkgver=2.1.2
pkgrel=3
pkgdesc="Plugins for Icinga, Naemon, Nagios, Shinken, Sensu and other monitoring applications"
arch=('i686' 'x86_64')
url="http://www.monitoring-plugins.org"
license=('GPL3')
makedepends=('net-snmp' 'postgresql-libs' 'libdbi' 'libmariadbclient'
  'procps-ng' 'iputils' 'fping' 'dnsutils' 'rpcbind' 'smbclient' 'openssh'
  'inetutils' 'postfix' 'perl-net-snmp')
optdepends=('net-snmp: for SNMP checking'
  'postgresql-libs: for check_pgsql'
  'libmariadbclient: for check_mysql_query and check_mysql'
  'libdbi: for check_dbi'
  'libldap: for check_ldap')
provides=('nagios-plugins')
conflicts=('nagios-plugins')
replaces=('nagios-plugins')
source=(https://www.monitoring-plugins.org/download/$pkgname-$pkgver.tar.gz)
md5sums=('4a210f7db012571ea58e214cef74f612')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr --libexecdir=/usr/lib/monitoring-plugins \
    --with-ping-command='/usr/bin/ping -4 -n -U -w %d -c %d %s' \
    --with-ping6-command='/usr/bin/ping -6 -n -U -w %d -c %d %s'

  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 LEGAL "$pkgdir"/usr/share/licenses/$pkgname/LEGAL

  for i in ABOUT-NLS ACKNOWLEDGEMENTS AUTHORS CODING ChangeLog \
    FAQ NEWS README REQUIREMENTS SUPPORT THANKS; do
    install -Dm644 $i "$pkgdir"/usr/share/doc/$pkgname/$i
  done
}
