# Maintainer: Pedro A. López-Valencia <youremail@domain.com>
pkgname=tnftpd
pkgver=20200704
pkgrel=1
pkgdesc="Also known as lukemftpd, it is the default NetBSD FTP server"
arch=('x86_64')
url="https://ftp.netbsd.org/pub/NetBSD/misc/tnftp/"
license=('custom:BSD-2clause')
depends=('pam')
backup=(etc/tnftpchroot etc/tnftpmotd etc/tnftpd.conf etc/tnftpusers etc/tnftpwelcome)
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
b2sums=('3de6285deee3e916d8d68049bc93e0119fac1b4e1fc25ae2e1b5e6ae058484aacd0fb93b45c9cd2e3d567a0cc4862fe24eb95bfd849f7be637f4560053361ba3'
        'SKIP'
        '40d5637b0e2a7bb8945ea7bcadd70d608e87998c96d7c4d71e116f042c814f7e240403854d959312b18a356b32256bfec90ec680ff90dc3191e6ca1542b8e364'
        '52c12c7802fec30400c653eb70592f8f44909cdeef42cd9debac7a61f4d3aaf6aa1be946266107297b7ef8c92699545b85280b615816763cd384f20252a11dff'
        '70ee508ab7bdbd1b7a852e4fe7c7d5e93a8eafebba91940e781baacbc49d18aac417d462f15863fe6711470bc554d792017ebcf7f4f2a91060d78eb9050b43f3'
        '69fe6918d49bf13dce2f6ae6f346ef010054df67640401d52a0c63e78e6cb17ba93d1d45c6a0fc2f033b3e7c1911b4bf108bc832658949ad2f3894fe05f03446'
        'd5c392ede8b5f8469acb21166b885d36c4924f5f3bd6788a397cb7c260d373b27c85da2112475275cf9af6bc2481aa14d49851f852a59d1161c9e77a9731b6ba'
        'ee59375a038cbea45460300cd20676ae08f2a450bb980eb3434004c085af3de6c469c0f2e2a9bb645327a577e27372c403b9475c07cc46beb6832fd57d89fff8'
        '8bae05a96fcfaa97054dbd8d58584e8000358ef876af727f8bcefefa9832efea8183138349dfaa30b0f7b21334cbc526c3bffff3ad1981319d6e196b03f9f11a'
        'e7c8f56747c8f1f1acb164b744c49735f205c02810f50856d7be4280bde133a127b291cf2f644f0098c94c869d4977faa185ada26867998dd504030fc8e637c9'
        'cc07b783b77073a5100ab14d1dc610dd76a4a6db3f53c74de0b30905647169f9e5284e6394ea672ed8bbfbb71b86d8112a363f37ff72026e65d72fd0271129fe'
        'd00fd1ddb0af694d352e81d8c6e71cff14bab960bd689d9f1a46217a520cabdb095f7fefb087a88e80073a18756b286aedf2509d50860a5d564b510fa846573e')
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
