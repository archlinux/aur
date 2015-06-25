pkgname="linuxigd"
pkgver="1.0"
pkgrel=9
pkgdesc="Linux UPnP Internet Gateway Device."
url="http://linux-igd.sourceforge.net/"
arch=('i686' 'x86_64')
license=('GPL')
depends=('libupnp>=1.4.1' 'iptables')
#source=("http://downloads.sourceforge.net/sourceforge/linux-igd/$pkgname-$pkgver.tar.gz"
#  'igd-iptables-arch.patch' 'igd-install-destdir.patch'
#  'Makefile.patch' 'upnpd.rc' 'upnpd.conf' 'upnpd.init')
source=("http://downloads.sourceforge.net/sourceforge/linux-igd/$pkgname-$pkgver.tar.gz"
  'igd-iptables-arch.patch' 'igd-install-destdir.patch'
  'Makefile.patch' 'upnpd.conf' 'upnpd.service')
backup=('etc/upnpd.conf' 'etc/conf.d/upnpd')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -p1 -i "$srcdir/igd-iptables-arch.patch"
  patch -p1 -i "$srcdir/igd-install-destdir.patch"
  patch -p1 -i "$srcdir/Makefile.patch"

  CFLAGS+=\ -D_GNU_SOURCE
  sed -i '1i#include <stdio.h>' gatedevice.c pmlist.c
  sed -i '1i#include <string.h>' main.c pmlist.c	
  make

}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  #install -d $pkgdir/etc/{rc,conf}.d
  #install -d $pkgdir/usr/lib/upnpd
  #install -m744 $srcdir/upnpd.rc $pkgdir/etc/rc.d/upnpd
  install -d "$pkgdir/etc/conf.d"
  #install -d $pkgdir/usr/lib/upnpd
  install -d "$pkgdir/usr/lib/systemd/system"
  install -m644 "$srcdir/upnpd.conf" "$pkgdir/etc/conf.d/upnpd"
  #install -m744 $srcdir/upnpd.init $pkgdir/usr/lib/upnpd/upnpd
  install -m644 "$srcdir/upnpd.service" "$pkgdir/usr/lib/systemd/system/upnpd.service"
  install -d "$pkgdir/usr/bin"
  mv "${pkgdir}/usr/sbin/upnpd" "${pkgdir}/usr/bin/upnpd"
  rm -r "${pkgdir}/usr/sbin"
}

sha256sums=('f6335273fd6bfad7fb32e94e36461e8b74f9523e7994bad8be9fac29bee9f4cd'
            'f94d0cb9a4b2c4d5a8e080c0c6e7f84404253833979cbf89e38ec27364ec2f40'
            '3eb373026af582b06bdc74bceccb038d98a97cddd9916bbf39de1fd42d90e6f8'
            '04abf7e4dec6c09644c16269aec60b0e64396185df5937d324ff87bf022b488f'
            'a2d9036fc288b1636aa9bf97cd76ecd3a70c8ff6c536537612586d50bf294feb'
            '1ed5dab4a28a5eeed738f1abf5576382da9f5fa364c14c0d74d86ad2908d6ee7')

# vim: ts=2 sw=2 et
