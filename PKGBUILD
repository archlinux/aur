# Maintainer: Nimrod Maclomair <nimrod4garoa at gmail dot com>
pkgname=olsrd
pkgrel=1
pkgver=0.9.0.3
pkgdesc='The olsr.org implementation of the Optimized Link State Routing Protocol.'
arch=('i686' 'x86_64' 'armv6h')
url='http://www.olsr.org/mediawiki/index.php/Olsrd'
license=('custom')
depends=()
makedepends=('bison' 'flex')
install='olsrd.install'
source=('https://github.com/OLSR/olsrd/archive/v0.9.0.3.tar.gz'
		'olsrd.install'
		'olsrd.service')
sha256sums=('1b1a64e73109d8bfbc8cc10432baaca6f6da9adddade196b7f8caa5f01f86e09'
            '16b93b2e9d6e80e554b5b49b4a12fe17bd831d54015b4e3de7f452bb14e6c33e'
            '321f2e0d30af597a38442eb8f039757767efc5da88205b85cf96819384c94ac7')

build(){
	cd $pkgname-$pkgver
	make build_all
}

package(){
	
	mkdir instroot
	cd $pkgname-$pkgver
	make DESTDIR=`pwd`/../instroot install_all
	cd ..
	
	# manual install, because make install seems messed up to me.
	mkdir --parents $pkgdir/etc/olsrd
	mkdir --parents $pkgdir/usr/bin
	mkdir --parents $pkgdir/usr/lib/${pkgname}
	mkdir --parents $pkgdir/usr/share/licenses/${pkgname}
	mkdir --parents $pkgdir/usr/share/man/{man5,man8}
	mkdir --parents $pkgdir/usr/lib/systemd/system
	
	mv instroot/etc/olsrd/* $pkgdir/etc/olsrd/
	mv instroot/usr/local/lib/libOlsrdPudWireFormat.so* $pkgdir/usr/lib/
	mv instroot/usr/local/lib/libnmea.so* $pkgdir/usr/lib/
	mv instroot/usr/local/lib/* $pkgdir/usr/lib/${pkgname}/
	mv instroot/usr/local/sbin/* $pkgdir/usr/bin/
	mv instroot/usr/local/share/man/man5/* $pkgdir/usr/share/man/man5/
	mv instroot/usr/local/share/man/man8/* $pkgdir/usr/share/man/man8/
	
	mv $pkgname-$pkgver/license.txt $pkgdir/usr/share/licenses/${pkgname}/LICENSE
	
	cp 'olsrd.service' $pkgdir/usr/lib/systemd/system/
}
