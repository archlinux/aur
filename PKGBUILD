# Maintainer: Pedro A. López-Valencia <youremail@domain.com>
pkgname=tnftpd
pkgver=20190602
pkgrel=2
pkgdesc="a.k.a. lukemftpd, it is the default NetBSD FTP server"
arch=('x86_64')
url="https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/"
license=('custom:BSD-2clause')
depends=('pam')
backup=('etc/ftpd.conf' 'etc/ftpusers')
source=("http://ftp.netbsd.org/pub/NetBSD/misc/tnftp/$pkgname-$pkgver.tar.gz"{,.asc} 
	'tnftpd.service' 
	'tnftpd@.service' 
	'tnftpd.socket')
sha256sums=('905519d239745ebec41c91e357af299f3bce04b59f84f2ba5f7654738439ac1c'
            'SKIP'
            '70ab3564b717fabc8a06068d893ee7a935314d1eee60f2b9d033f0424be3106b'
            'faf5d0dbc7b33aa4fe42c6fb719712835aebfcfcd336728c474966a764d9f582'
            '6f3a47accdbd0e45aa2daca1c3362a225747356d51ffc3e179a16e211f48d185')
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
	install -d -m 755 "$pkgdir/usr/share/doc/$pkgname"
	install -d -m 755 "$pkgdir/etc"
	mv "$pkgdir/usr/share/man/man5/ftpusers.5" "$pkgdir/usr/share/man/man5/ftpusers.tnftpd.5"
	mv "$pkgdir/usr/share/examples/tnftpd" "$pkgdir/usr/share/doc/"
	#groff -mdoc -f N -rS12 "src/ftpd.conf.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/ftpd.conf.5.pdf"
	#groff -mdoc -f N -rS12 "src/ftpusers.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/ftusers.5.pdf"
	#groff -mdoc -f N -rS12 "src/tnftpd.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/tnftpd.8.pdf"
	rmdir "$pkgdir/usr/share/examples"
	cp -a "$pkgdir/usr/share/doc/$pkgname/ftpd.conf" "$pkgdir/etc"
	cp -a "$pkgdir/usr/share/doc/$pkgname/ftpusers" "$pkgdir/etc"
}
