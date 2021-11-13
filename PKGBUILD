# Maintainer: Jonathan Steel <jsteel at archlinux.org>
# Contributor: Idares <idares at seznam dot cz>

pkgname=monitoring-plugins
pkgver=2.3.1
pkgrel=2
pkgdesc="Plugins for Icinga, Naemon, Nagios, Shinken, Sensu and other monitoring applications"
arch=('x86_64')
url="https://www.monitoring-plugins.org"
license=('GPL3')
depends=('perl')
makedepends=('net-snmp' 'postgresql-libs' 'libdbi' 'mariadb-libs'
  'procps-ng' 'iputils' 'fping' 'dnsutils' 'rpcbind' 'smbclient' 'openssh'
  'inetutils' 'postfix' 'perl-net-snmp')
optdepends=('net-snmp: for SNMP checking'
  'postgresql-libs: for check_pgsql'
  'mariadb-libs: for check_mysql_query and check_mysql'
  'libdbi: for check_dbi'
  'libldap: for check_ldap')
provides=('nagios-plugins')
conflicts=('nagios-plugins')
replaces=('nagios-plugins')
source=("https://www.monitoring-plugins.org/download/$pkgname-$pkgver.tar.gz")
sha256sums=('f56eb84871983fd719247249e3532228b37e2efaae657a3979bd14ac1f84a35b')

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

  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING

  for i in ABOUT-NLS ACKNOWLEDGEMENTS AUTHORS CODING ChangeLog \
    FAQ NEWS README REQUIREMENTS SUPPORT THANKS; do
    install -Dm644 $i "$pkgdir"/usr/share/doc/$pkgname/$i
  done
}
