# Maintainer: Duncan X Simpson <duncan@k7dxs.net>
# Contributor: Andreas Schreiner <andreas.schreiner@sonnenmulde.at>
# Contributor: Ruslan Nabioullin <rnabioullin at gmail dot com>
# Contributor: Gordon JC Pearce <gordon at gjcp dot net>
pkgname=soundmodem
pkgver=0.20
pkgrel=1
pkgdesc="Multiplatform Soundcard Packet Radio Modem"
url="http://gna.org/projects/soundmodem"
license=('GPL2')
source=('soundmodem.conf'
	'soundmodem_conf.d'
	'soundmodem_rc.d'
	'https://archive.org/download/${pkgname}-${pkgver}/${pkgname}-${pkgver}.tar.gz'
	'soundmodem.service')
sha512sums=('e77bbdd13c0076e9fa9cd27da2313925798087315acaea5778ba37642de9689d68e72e02c114deea6c4ccda390b676127edff3f050a7307761c9bc4c76c01473'
            'ef9bac681e6e33823544092a3d1eb9655211c1d300dc7fbf12f2d46d89ed33c20175cc76bcd2d539ce28308e2837fb11dd3e346bfb894d69a73d3c8b705f68e0'
            'c82992c9fdbe99ca70733a3905be8f69e7af7c18a4c4aef12bf4588e9d08a23363cbbcca4ad7f2a016e644b7b073e543cdce0a5d945a42f4ab221eaf44a44769'
            '6970fc607ba9f5105ee7118305cbfc87df007beb5a0d500a6de513d58f30206f2622847192d499d921af44ec3e1d238c1e0b38430f5743602e6a238fe26a7226'
            '45c153ded629ea96acd9aa2abd98e47fd2d9916a50437bff3ebfcfd813363384946402562f0fbc25d35705b1e6bb82b4894bb721a918ae94bc3fb5a399e2e9b2')
arch=('i686' 'x86_64')
backup=('etc/ax25/soundmodem.conf'
        'etc/conf.d/soundmodem')
depends=('audiofile' 'gtk2')
makedepends=('make' 'libxml2' 'alsa-lib')

build() {
  cd $srcdir/${pkgname}-${pkgver}
  CXXFLAGS+=" -fpermissive"
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
