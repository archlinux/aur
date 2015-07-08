# Maintainer: Malte Rabenseifner <mail@malte-rabenseifner.de>
# Contributor: bebehei <bebe@bebehei.de>

pkgname=icinga2
pkgver=2.3.6
pkgrel=1
pkgdesc="An open source host, service and network monitoring program."
license=('GPL')
arch=('i686' 'x86_64')
url="http://www.icinga.org"
depends=('boost-libs' 'yajl')
makedepends=('boost' 'cmake' 'libmariadbclient' 'postgresql-libs' 'yajl')
optdepends=('monitoring-plugins: plugins needed for icinga checks'
            'libmariadbclient: for MySQL support'
            'postgresql-libs: for PostgreSQL support')
backup=(etc/default/icinga2
        etc/icinga2/features-available/{api,checker,command,compatlog}.conf
        etc/icinga2/features-available/{debuglog,gelf,graphite,icingastatus}.conf
        etc/icinga2/features-available/{ido-mysql,ido-pgsql,livestatus,mainlog}.conf
        etc/icinga2/features-available/{notification,perfdata,statusdata,syslog}.conf
        etc/icinga2/{constants,icinga2,init,zones}.conf
        etc/logrotate.d/icinga2)
install='icinga2.install'
source=("https://github.com/Icinga/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('712d13e997fc6fbf02f8c2046851b1fda1291305f0d3d6792cbebf5fb1558225')

build() {
  mkdir -p "$srcdir/$pkgname-$pkgver/build"
  cd "$srcdir/$pkgname-$pkgver/build"

  cmake "$srcdir/$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DICINGA2_RUNDIR=/run \
    -DCMAKE_INSTALL_SBINDIR=/usr/bin \
    -DCMAKE_INSTALL_LIBDIR=/usr/lib \
    -DCMAKE_INSTALL_LOCALSTATEDIR=/var \
    -DICINGA2_SYSCONFIGFILE=/etc/default/icinga2 \
    -DICINGA2_PLUGINDIR=/usr/lib/monitoring-plugins \
    -DUSE_SYSTEMD=ON

  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/build"

  make DESTDIR="$pkgdir" install

  mv "$pkgdir/etc/icinga2/conf.d" "$pkgdir/etc/icinga2/conf.d.example"
  mkdir "$pkgdir/etc/icinga2/conf.d"
  rm "$pkgdir/etc/icinga2/features-enabled/checker.conf"
  rm "$pkgdir/etc/icinga2/features-enabled/mainlog.conf"
  rm "$pkgdir/etc/icinga2/features-enabled/notification.conf"
  rm -r "$pkgdir/run"

  mkdir -p "$pkgdir/usr/lib/tmpfiles.d"
  cat > "$pkgdir/usr/lib/tmpfiles.d/icinga2.conf" <<- EOF
	d /run/icinga2 0750 icinga icingacmd -
	d /run/icinga2/cmd 2750 icinga icingacmd -
	EOF

  cd "$srcdir/$pkgname-$pkgver"

  install -Dm644 tools/syntax/vim/ftdetect/icinga2.vim "$pkgdir/usr/share/vim/vimfiles/ftdetect/icinga2.vim"
  install -Dm644 tools/syntax/vim/syntax/icinga2.vim "$pkgdir/usr/share/vim/vimfiles/syntax/icinga2.vim"
  install -Dm644 tools/syntax/nano/icinga2.nanorc "$pkgdir/usr/share/nano/icinga2.nanorc"

  chmod 750 "$pkgdir/etc/icinga2" \
            "$pkgdir/var/lib/icinga2" \
            "$pkgdir/var/spool/icinga2" \
            "$pkgdir/var/cache/icinga2" \
            "$pkgdir/var/log/icinga2"
}
