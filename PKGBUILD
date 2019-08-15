# Maintainer: Pedro A. López-Valencia <youremail@domain.com>
pkgname=tnftpd
pkgver=20190602
pkgrel=5
pkgdesc="Also known as lukemftpd, it is the default NetBSD FTP server"
arch=('x86_64')
url="https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/"
license=('custom:BSD-2clause')
depends=('pam')
backup=(etc/ftpd.conf etc/ftpusers)
conflicts=('bftpd' 'vsftpd')
source=("http://ftp.netbsd.org/pub/NetBSD/misc/tnftp/$pkgname-$pkgver.tar.gz"{,.asc} 
	'tnftpd.service' 
	'tnftpd@.service' 
	'tnftpd.socket'
	'tnftpd.pam'
	'etc_ftpd.conf'
	'etc_ftpusers')
sha256sums=('905519d239745ebec41c91e357af299f3bce04b59f84f2ba5f7654738439ac1c'
            'SKIP'
            '7c34b35ae14a04b7a7da2165467ca5796c97ee5757cfe1fc796e17e212a61cfc'
            '9e96e30acac10290b03a8d0b761c0cd95d24345b24a8175cc6df371634bc90fe'
            '6f3a47accdbd0e45aa2daca1c3362a225747356d51ffc3e179a16e211f48d185'
            'e0513358204dcb310c07d906b45b83f40bff584c3031583a1a901bfadd702f97'
            '7844c647396c179a5c2544e3f801b9cc3a6742a84b82789e4d5bef82ad81444e'
            'dd98d58e69b89da4f7a17904e5c14c2f761586a43841e7b75f4501f58667b03a')
validpgpkeys=('2A8E22EDB07B5414548D8507A4186D9A7F332472')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/bin
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -D -m 644 ../tnftpd.service "$pkgdir/usr/lib/systemd/system/tnftpd.service"
	install -D -m 644 ../tnftpd@.service "$pkgdir/usr/lib/systemd/system/tnftpd@.service"
	install -D -m 644 ../tnftpd.socket "$pkgdir/usr/lib/systemd/system/tnftpd.socket"
	install -D -m 644 ../tnftpd.pam "$pkgdir/etc/pam.d/ftpd"
	install -D -m 644 "../etc_ftpd.conf" "$pkgdir/etc/ftpd.conf"
	install -D -m 644 "../etc_ftpusers" "$pkgdir/etc/ftpusers"
	install -D -m 644 "examples/ftpd.conf" "$pkgdir/usr/share/doc/$pkgname/ftpd.conf"
	install -D -m 644 "examples/ftpusers" "$pkgdir/usr/share/doc/$pkgname/ftpusers"
	rm -r "$pkgdir/usr/share/examples"
	mv "$pkgdir/usr/share/man/man5/ftpusers.5" "$pkgdir/usr/share/man/man5/ftpusers.tnftpd.5"
	# This can be useful sometimes.
	#groff -mdoc -f N -rS12 "src/ftpd.conf.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/ftpd.conf.5.pdf"
	#groff -mdoc -f N -rS12 "src/ftpusers.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/ftusers.5.pdf"
	#groff -mdoc -f N -rS12 "src/tnftpd.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/tnftpd.8.pdf"
}
