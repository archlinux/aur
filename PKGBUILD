pkgname=calendarserver
pkgver=6.0
pkgrel=1
arch=('i686' 'x86_64')
license=('Apache')
pkgdesc="standalone CalDAV server"
depends=('glibc' 'python2-twisted' 'python2-zope-interface' 'python2-vobject' 'python2-pyopenssl' 'python2-pyflakes' 'krb5' 'python2-memcached' 'memcached' 'postgresql')
makedepends=('subversion' 'curl')
url='http://calendarserver.org/'
install=calendarserver.install
backup=(etc/caldavd/caldavd-dev.plist etc/caldavd/auth/accounts.xml)
source=($pkgname::svn+http://svn.calendarserver.org/repository/calendarserver/CalendarServer/tags/release/CalendarServer-$pkgver
        caldavd.plist)
md5sums=('SKIP'
         '6760eb45c54a5c40575fac82a02c8b00')

build() {
  cd "$pkgname"

  ./bin/run -s
}

package() {
  mkdir -p "$pkgdir/opt/caldavd" "$pkgdir/etc" "$pkgdir/var/"{spool/caldavd,run/caldavd,log/caldavd}
  svn export "$srcdir/$pkgname" "$pkgdir/opt/caldavd/CalendarServer"

  mv "$pkgdir/opt/caldavd/CalendarServer/conf" "$pkgdir/etc/caldavd"
  ln -s ../../../etc/caldavd "$pkgdir/opt/caldavd/CalendarServer/conf"
  cp "$srcdir/caldavd.plist" "$pkgdir/etc/caldavd/caldavd-dev.plist"
  rm -f $pkgdir/etc/caldavd/caldavd.plist
  ln -s caldavd-dev.plist $pkgdir/etc/caldavd/caldavd.plist
  ln -s ../../../var/log/caldavd $pkgdir/opt/caldavd/CalendarServer/logs
  ln -s ../../../var/spool/caldavd $pkgdir/opt/caldavd/CalendarServer/root
  ln -s ../../../var/run/caldavd $pkgdir/opt/caldavd/CalendarServer/data
}
