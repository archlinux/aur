# Maintainer: Jonathan Steel <jsteel at archlinux.org>

pkgbase=naemon
pkgname=('naemon-core' 'naemon-livestatus' 'naemon-thruk')
pkgver=1.0.3
pkgrel=2
arch=('i686' 'x86_64')
url="http://naemon.org"
license=('GPL2')
makedepends=('gperf' 'rsync' 'gd' 'mariadb-clients')
source=(http://labs.consol.de/naemon/release/v$pkgver/src/$pkgbase-$pkgver.tar.gz
        $pkgbase.service)
md5sums=('0d6873669bd44375978c97174529e258'
         'd6a77534e612e8f65ff3360336faec77')

prepare() {
  cd $pkgbase-$pkgver

  # Break up the install process so we can package the separate components
  sed -i '60iinstall-livestatus:' Makefile
  sed -i '62iinstall-thruk:' Makefile
}

build() {
  cd $pkgbase-$pkgver

  ./configure --prefix=/usr \
              --bindir=/usr/bin \
              --datadir="/usr/share/naemon" \
              --libdir="/usr/lib/naemon" \
              --localstatedir="/var/lib/naemon" \
              --sysconfdir="/etc/naemon" \
              --with-pkgconfdir="/etc/naemon" \
              --mandir="/usr/share/man" \
              --enable-event-broker \
              --with-pluginsdir="/usr/lib/monitoring-plugins" \
              --with-tempdir="/var/cache/naemon" \
              --with-checkresultdir="/var/cache/naemon/checkresults" \
              --with-logdir="/var/log/naemon" \
              --with-initdir="/etc/init.d" \
              --with-logrotatedir="/etc/logrotate.d" \
              --with-naemon-user="naemon" \
              --with-naemon-group="naemon" \
              --with-lockfile="/run/naemon.pid" \
              --with-thruk-user="http" \
              --with-thruk-group="naemon" \
              --with-thruk-libs="/usr/lib/naemon/perl5" \
              --with-thruk-tempdir="/var/cache/naemon/thruk" \
              --with-thruk-vardir="/var/lib/naemon/thruk" \
              --with-httpd-conf="/etc/httpd/conf/extra/" \
              --with-htmlurl="/naemon"

  make
}

check() {
  cd $pkgbase-$pkgver/naemon-core

  make check
}

package_naemon-core() {
pkgdesc="System and network monitoring application"
depends=('bash')
optdepends=('logrotate'
            'monitoring-plugins')
backup=('etc/logrotate.d/naemon' 'etc/naemon/conf.d/commands.cfg'
  'etc/naemon/conf.d/contacts.cfg' 'etc/naemon/conf.d/localhost.cfg'
  'etc/naemon/conf.d/printer.cfg' 'etc/naemon/conf.d/switch.cfg'
  'etc/naemon/conf.d/templates/contacts.cfg'
  'etc/naemon/conf.d/templates/hosts.cfg'
  'etc/naemon/conf.d/templates/services.cfg'
  'etc/naemon/conf.d/timeperiods.cfg' 'etc/naemon/conf.d/windows.cfg'
  'etc/naemon/naemon.cfg' 'etc/naemon/resource.cfg')
install=$pkgbase.install

  cd $pkgbase-$pkgver

  make DESTDIR="$pkgdir" install

  chown -R 44:44 "$pkgdir"/var/{cache,log}/$pkgbase
  chmod -R 770 "$pkgdir"/var/{cache,log}/$pkgbase

  install -Dm644 "$srcdir"/$pkgbase.service \
    "$pkgdir"/usr/lib/systemd/system/$pkgbase.service

  # Remove init script
  rm -rf "$pkgdir"/etc/init.d
}

package_naemon-livestatus() {
pkgdesc="Standard API for Naemon"
depends=('icu')

  cd $pkgbase-$pkgver

  make DESTDIR="$pkgdir" install-livestatus
}

package_naemon-thruk() {
pkgdesc="Monitoring Webinterface for Naemon"
depends=('gd' 'mariadb-clients' 'apache' 'mod_fcgid')
backup=('etc/naemon/cgi.cfg' 'etc/naemon/htpasswd'
  'etc/naemon/log4perl.conf' 'etc/naemon/menu_local.conf'
  'etc/naemon/naglint.conf' 'etc/httpd/conf/extra/thruk.conf'
  'etc/httpd/conf/extra/thruk_cookie_auth_vhost.conf'
  'etc/naemon/thruk_local.conf' 'etc/naemon/thruk.conf'
  'etc/naemon/conf.d/thruk_bp_generated.cfg'
  'etc/naemon/conf.d/thruk_templates.cfg' 'etc/logrotate.d/thruk')

  cd $pkgbase-$pkgver

  make DESTDIR="$pkgdir" install-thruk

  chown -R 44:44 "$pkgdir"/var/{cache,lib,log}/$pkgbase
  chmod -R 770 "$pkgdir"/var/{cache,lib,log}/$pkgbase

  # Remove init script
  rm -rf "$pkgdir"/etc/init.d
}
