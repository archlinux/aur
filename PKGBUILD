# Contributor: Franco Tortoriello
# Contributor: Aaron Griffin <aaron@archlinux.org>
# Contributor: Aurelien Foret <orelien@chez.com>

pkgname=irda-utils
pkgver=0.9.18
pkgrel=3
pkgdesc='Utilities for infrared communication between devices'
url="http://irda.sourceforge.net"
arch=(i686 x86_64)
license=(GPL)
depends=(glib2 pciutils)
source=(http://downloads.sourceforge.net/irda/$pkgname-$pkgver.tar.gz
	irda.service)
md5sums=('84dc12aa4c3f61fccb8d8919bf4079bb'
	 'cdcee6ba50ce437a9804250119134ee7')

prepare(){
  cd "$srcdir/$pkgname-$pkgver"

  # Fix header locations
  sed -e 's|asm/io.h|sys/io.h|' -i \
	findchip/{winbond,smc,nsc}.c pcmcia/ircard_cs.c

  sed -i -e 's|inline ||g' irdadump/*.c

  # Fix paths
  sed -e 's|$(PREFIX)/usr/man|$(ROOT)/usr/share/man|' -i man/Makefile
  sed -e 's|/usr/sbin/|$(ROOT)/usr/bin|' -i irnetd/Makefile
  # /usr/sbin -> /usr/bin
  sed -e 's|sbin|bin|' -i \
	{irdaping,irdadump,findchip,irattach,smcinit}/Makefile
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/bin"
  make ROOT="$pkgdir" install

  install -Dm644 "$srcdir/irda.service" "$pkgdir/usr/lib/systemd/system/irda.service"
  install -Dm644 etc/modules.conf.irda "$pkgdir/etc/modprobe.conf.irda"
}
