# Maintainer: Pedro A. López-Valencia <youremail@domain.com>
pkgname=tnftpd
pkgver=20190602
pkgrel=8
pkgdesc="Also known as lukemftpd, it is the default NetBSD FTP server"
arch=('x86_64')
url="https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/"
license=('custom:BSD-2clause')
depends=('pam')
backup=(etc/tnftpchroot etc/tnftpmotd etc/tnftpd.conf etc/tnftpusers etc/tnftpwelcome)
conflicts=('bftpd' 'vsftpd' 'proftpd' 'pure-ftpd' 'pure-ftpd-db') # also inetutils ftpd
source=("http://ftp.netbsd.org/pub/NetBSD/misc/tnftp/$pkgname-$pkgver.tar.gz"{,.asc} 
	'pathnames.h'
	'tnftpd.service'  # daemon service
	'tnftpd@.service' # socket-dependent service
	'tnftpd.socket'
	'tnftpd.pam'
	'tnftpd.conf'
	'tnftpusers'
	'tnftpchroot'
	'tnftpmotd'
	'tnftpwelcome')
sha256sums=('905519d239745ebec41c91e357af299f3bce04b59f84f2ba5f7654738439ac1c'
            'SKIP'
            '33af1ae07363a06d5e1fea13bc82060f068f2691eba9a1a69f85c8d3d9d7cda4'
            'd8c767c8289e44e6a8f9c369ebf9dc7b2d27ad404c302c1d001c82494018888e'
            '1830bdf1ecd807642fb113b4d3d9f4a2508e3c0488d0f399d8357a436da5c83c'
            '6f3a47accdbd0e45aa2daca1c3362a225747356d51ffc3e179a16e211f48d185'
            'e4ef3ed9333c88c32dcd62a54a41cab63bd8ab36ee0b194547ef886d30fb5fab'
            '987fdf84107b9df685638c12ea7561c5ec8ac0628f9b68338e8191d13e2a09df'
            'c09e4ffcb4e16fbfa6e780fadbac19a4d4738f14e9d545963d354ce09bfc95cf'
            '91071b811473d5b1f047e1aedab867a8999347493bcac88f60e85d83e6be53b6'
            '07368d4d8fc196c0c00f8614fa4b8a443553be4f6a1deac125a776d301a13122'
            '62de2047c87bd48f7cc304e22ccca1caac8e353f4dd793f9ee2e6afa670074de')
validpgpkeys=('2A8E22EDB07B5414548D8507A4186D9A7F332472')

prepare() {
	cd "$pkgname-$pkgver"
	cp ../pathnames.h src/
}

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr --sysconfdir=/etc --libexecdir=/usr/bin
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
	install -D -m 644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
	install -D -m 644 ../tnftpd.service "$pkgdir/usr/lib/systemd/system/tnftpd.service"
	install -D -m 644 ../tnftpd@.service "$pkgdir/usr/lib/systemd/system/tnftpd@.service"
	install -D -m 644 ../tnftpd.socket "$pkgdir/usr/lib/systemd/system/tnftpd.socket"
	install -D -m 644 ../tnftpd.pam "$pkgdir/etc/pam.d/ftpd"
	install -D -m 644 "../tnftpd.conf" "$pkgdir/etc/tnftpd.conf"
	install -D -m 644 "../tnftpusers" "$pkgdir/etc/tnftpusers"
	install -D -m 644 "../tnftpchroot" "$pkgdir/etc/tnftpchroot"
	install -D -m 644 "../tnftpmotd" "$pkgdir/etc/tnftpmotd"
	install -D -m 644 "../tnftpwelcome" "$pkgdir/etc/tnftpwelcome"
	install -D -m 644 "examples/ftpd.conf" "$pkgdir/usr/share/doc/$pkgname/tnftpd.conf"
	install -D -m 644 "examples/ftpusers" "$pkgdir/usr/share/doc/$pkgname/tnftpusers"
	rm -r "$pkgdir/usr/share/examples"
	mv "$pkgdir/usr/share/man/man5/ftpd.conf.5" "$pkgdir/usr/share/man/man5/tnftpd.conf.5"
	mv "$pkgdir/usr/share/man/man5/ftpusers.5" "$pkgdir/usr/share/man/man5/tnftpusers.5"
	#
	# If you want printable docs.
	#
	#groff -mdoc -f N -rS12 "src/ftpd.conf.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/tnftpd.conf.5.pdf"
	#groff -mdoc -f N -rS12 "src/ftpusers.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/tnftusers.5.pdf"
	#groff -mdoc -f N -rS12 "src/tnftpd.man" | ps2pdf -dPDFA - "$pkgdir/usr/share/doc/$pkgname/tnftpd.8.pdf"
}
