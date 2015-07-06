# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=elog
pkgver=2.9.2.1
pkgrel=1
pkgdesc="Electronic logbook w/ attached file support, doesn't use a database."
arch=('i686' 'x86_64')
url="http://midas.psi.ch/elog/"
license=('GPL')
depends=('openssl')
optdepends=('imagemagick: inline thumbnail support'
            'ghostscript: inline thumbnail support')
install=elog.install
backup=('etc/elog/elogd.cfg')
source=(https://midas.psi.ch/elog/download/tar/elog-2.9.2-1.tar.gz elogd.service)
md5sums=('4ae5010a2e83e2846b81295bce22aec1'
         'a56aee958b9d524312c9392c74484e9e')
build() {
  cd $srcdir/$pkgname-2.9.2
  # make things more Arch-friendly
  sed -i '/^ELOGDIR/s/$(PREFIX)\/elog/\/etc\/elog/' Makefile
  sed -i '/^BINOWNER/s/bin/root/' Makefile
  sed -i '/^BINGROUP/s/bin/root/' Makefile
  # make
  make PREFIX=/usr
  }
package() {
  cd $srcdir/$pkgname-2.9.2
  # install
  make PREFIX=/usr ROOT=$pkgdir MANDIR=$pkgdir/usr/share/man install
  # substitute an elogd.service file in place of the default init script
  install -d $pkgdir/usr/lib/systemd/system
  cp $srcdir/elogd.service $pkgdir/usr/lib/systemd/system
  rm -Rf $pkgdir/etc/rc.d
  # move files to standard Arch locations
  mv $pkgdir/usr/sbin/elogd $pkgdir/usr/bin
  rmdir $pkgdir/usr/sbin
  install -d $pkgdir/usr/share/elog
  mv $pkgdir/etc/elog/resources $pkgdir/usr/share/elog
  mv $pkgdir/etc/elog/scripts $pkgdir/usr/share/elog
  mv $pkgdir/etc/elog/themes $pkgdir/usr/share/elog
  install -d $pkgdir/var/lib/elog
  mv $pkgdir/etc/elog/logbooks $pkgdir/var/lib/elog
  # tell elogd about the new locations
  sed -i '/\[global\]/s/$/\nLogbook dir = \/var\/lib\/elog\/logbooks/' \
    $pkgdir/etc/elog/elogd.cfg
  sed -i '/\[global\]/s/$/\nResource dir = \/usr\/share\/elog/' \
    $pkgdir/etc/elog/elogd.cfg
}
