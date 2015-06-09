# Maintainer: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>
pkgname=soundmodem
pkgver=0.18
pkgrel=4
pkgdesc="Multiplatform Soundcard Packet Radio Modem"
url="http://pv529.ncsrv.de/soundmodem/"
license=('GPL2')
source=('soundmodem.conf'
	'soundmodem_conf.d'
	'soundmodem_rc.d'
    http://pv529.ncsrv.de/soundmodem/${pkgname}-${pkgver}.tar.gz
	'soundmodem.service'
  '0001-Search-replace-of-extern-inline-static-inline.patch')
md5sums=('c9d051d31675d5543c86adc0bb52cd56'
         '14303acf07a3127bd4f1fb3edfbb4df6'
         '88bd23a85eb9e39629f87752512f8f8e'
         '5058b3cc0397f11f23c3eb519960c47e'
         '84c6e81fcf548e802aa7ee2f6eb7c529'
         'e265cf3d47ca02a8677c5e2dd5ad1f6d')
arch=('i686' 'x86_64')
backup=('etc/ax25/soundmodem.conf'
        'etc/conf.d/soundmodem')
depends=('audiofile' 'gtk2')
makedepends=('make' 'libxml2' 'alsa-lib' 'gtk2' 'audiofile')

build() {
  cd $srcdir/${pkgname}-${pkgver}

  echo "Applying patch..."
  patch -p1 <$srcdir/0001-Search-replace-of-extern-inline-static-inline.patch

  ./configure --prefix=/usr
  make clean
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make install DESTDIR=$pkgdir

  mkdir -p $pkgdir/etc/ax25
  mkdir -p $pkgdir/etc/conf.d
  mkdir -p $pkgdir/etc/rc.d
  mkdir -p $pkgdir/usr/lib/systemd/system
  install -m 644 $srcdir/soundmodem.conf $pkgdir/etc/ax25/soundmodem.conf
  install -m 644 $srcdir/soundmodem_conf.d $pkgdir/etc/conf.d/soundmodem
  install -m 755 $srcdir/soundmodem_rc.d $pkgdir/etc/rc.d/soundmodem
  install -m 644 $srcdir/soundmodem.service $pkgdir/usr/lib/systemd/system/soundmodem.service
  mv $pkgdir/usr/sbin/soundmodem $pkgdir/usr/bin/soundmodem
  rmdir $pkgdir/usr/sbin
}
