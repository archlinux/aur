# Greylisting daemon from Debian project. Requires 'start-stop-daemon'.
# Contributor: Vladimir Koshelenko <koshelenko@rndavia.ru>
# Maintainer: Denis Yantarev <denis dot yantarev at gmail dot com>

pkgname=greylistd
pkgver=0.9.0.3+nmu1
pkgrel=1
pkgdesc="Simple greylisting system for mail transport agents"
url="https://packages.debian.org/sid/greylistd"
depends=('start-stop-daemon')
source=(http://ftp.debian.org/debian/pool/main/g/greylistd/${pkgname}_${pkgver}.tar.xz
	greylistd.service
	greylistd.tmpfiles
	greylistd.install)
md5sums=('0f40747abe6ce568c2a3b328736f48a3'
         'ad1f516bdb732982fec38f492134d5b8'
         '5c76ca975a41ef967f6a1f8bfc760446'
         '7c309496b15079820b852c7140194d8c')
backup=(etc/greylistd/config)
install=greylistd.install
arch=('x86_64' 'i686')
license=('GPL')

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
