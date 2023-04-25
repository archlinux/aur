# Maintainer: David Scholl <djscholl at gmail dot com>
pkgname=elog
_pkgver=3.1.5
_pkgver2=1
pkgver=$_pkgver.$_pkgver2
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
source=(https://elog.psi.ch/elog/download/tar/${pkgname}-${_pkgver}-${_pkgver2}.tar.gz
        elogd.service)
sha256sums=('165fdeec01819c06a1fe14cd1741e9ab284a961053df9ba9f8680f8f7f9e299f'
            'deb0a58546262562ecaa89886e7ec18e4382d76718fb1afdcd9f384e96fb079e')

build() {

  cd $srcdir/${pkgname}-${_pkgver}-${_pkgver2}
  # make things more Arch-friendly
  sed -i '/^ELOGDIR/s/$(PREFIX)\/elog/\/etc\/elog/' Makefile
  sed -i '/^BINOWNER/s/bin/root/' Makefile
  sed -i '/^BINGROUP/s/bin/root/' Makefile
  # make
  make PREFIX=/usr

}

package() {

  cd $srcdir/${pkgname}-${_pkgver}-${_pkgver2}
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
