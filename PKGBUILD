# Greylisting daemon from Debian project. Requires 'start-stop-daemon'.
# Contributor: Vladimir Koshelenko <koshelenko@rndavia.ru>
# Maintainer: Denis Yantarev <denis dot yantarev at gmail dot com>

pkgname=greylistd
pkgver=0.8.8.5
pkgrel=1
pkgdesc="Simple greylisting system for mail transport agents"
url="http://packages.debian.org/stable/mail/greylistd"
depends=('python2' 'start-stop-daemon')
source=(http://ftp.debian.org/debian/pool/main/g/greylistd/${pkgname}_${pkgver}.tar.xz
	greylistd.service
	greylistd.tmpfiles
	greylistd.install
	python2.patch)
md5sums=('2a5bca5486441b0037c9e9e532fed5fc'
         'ad1f516bdb732982fec38f492134d5b8'
         '5c76ca975a41ef967f6a1f8bfc760446'
         '7c309496b15079820b852c7140194d8c'
         'ef3b973a0a07fecd673ed5f9c0df026e')
backup=(etc/greylistd/config)
install=greylistd.install
arch=('x86_64' 'i686')
license=('GPL')

build() {
	cd $srcdir || return 1
	patch -p0 <python2.patch || return 1
}

package() {
	cd $srcdir

	# configuration
	mkdir -p $pkgdir/etc/greylistd || return 1
	install -D -m644 $srcdir/$pkgname-$pkgver/config/config $pkgdir/etc/greylistd/ || return 1
	install -D -m644 $srcdir/$pkgname-$pkgver/config/whitelist-hosts $pkgdir/etc/greylistd/ || return 1
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/examples/exim4-acl-example.txt $pkgdir/etc/greylistd/ || return 1

	# systemd scripts
	mkdir -p $pkgdir/usr/lib/systemd/system || return 1
	install -D -m644 $srcdir/greylistd.service $pkgdir/usr/lib/systemd/system/ || return 1

	mkdir -p $pkgdir/usr/lib/tmpfiles.d || return 1
	install -D -m644 $srcdir/greylistd.tmpfiles $pkgdir/usr/lib/tmpfiles.d/greylistd.conf || return 1

	# man pages
	mkdir -p $pkgdir/usr/man/man1 || return 1
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/man1/greylist.1 $pkgdir/usr/man/man1/ || return 1
	gzip $pkgdir/usr/man/man1/greylist.1

	mkdir -p $pkgdir/usr/man/man8 || return 1
	install -D -m644 $srcdir/$pkgname-$pkgver/doc/man8/greylistd.8 $pkgdir/usr/man/man8/ || return 1
	gzip $pkgdir/usr/man/man8/greylistd.8

	# binaries
	mkdir -p $pkgdir/usr/bin || return 1
	install -D -m755 $srcdir/$pkgname-$pkgver/program/greylist $pkgdir/usr/bin/ || return 1
	install -D -m755 $srcdir/$pkgname-$pkgver/program/greylistd $pkgdir/usr/bin/ || return 1
}
