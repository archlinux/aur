# Maintainer: P. A. López-Valencia <vorbote AT users DOT sourceforge DOT net>
# Submitter: Xavi Soler <xavi AT interrupciones DOT net>
pkgname=aee
pkgver=2.2.15b
pkgrel=2
pkgdesc="Advanced Easy Editor. Classic text editor with both curses and X11 interfaces. "
arch=('i686' 'x86_64')
url="http://www.users.qwest.net/~hmahon/"
license=('PerlArtistic')
groups=(editors)
depends=('libx11')
source=(http://www.users.qwest.net/~hmahon/sources/$pkgname-$pkgver.tar.gz
	fix_init_file_loc.patch
	fix_help_file_loc.patch
	fix_help_file_txt.patch)
sha256sums=('7abbaffe35018f9de87c8685f9bee2ea3f261e88ce60674f1a5a9a3a0f54d752'
            '1d41f9cabed74b20be28da6345af5e139cde13598aef692fbf905cfa3cc7ddce'
            '8d9c63ac16c0e06e7fe53ec322f3d09f4c9751a45a3e0955b8366e61ec15d81a'
            'ad45d4bce57a3ce5392f83a680869353bcba236dc1c1bee7677c29e62cb005fc')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	chmod 644 aee.c help.c localize.c help.ae
	patch -p0 < "$srcdir/fix_init_file_loc.patch"
	patch -p0 < "$srcdir/fix_help_file_loc.patch"
	patch -p0 < "$srcdir/fix_help_file_txt.patch"
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make || return 1
	make xae || return 1
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	gzip -1N aee.1
	# Create directories
	install -d "$pkgdir/usr/share/$pkgname"
	install -d "$pkgdir/usr/share/doc/$pkgname"
	install -d "$pkgdir/usr/share/licenses/$pkgname"
	install -d "$pkgdir/usr/share/man/man1"
	install -d "$pkgdir/usr/bin"
	# Install files
	install -pm644 aee.1.gz "$pkgdir/usr/share/man/man1"
	install -pm644 help.ae "$pkgdir/usr/share/$pkgname"
	install -pm644 README.aee "$pkgdir/usr/share/doc/$pkgname"
	install -pm644 Changes "$pkgdir/usr/share/doc/$pkgname"
	install -pm644 aee.1.ps "$pkgdir/usr/share/doc/$pkgname"
	install -pm644 Artistic "$pkgdir/usr/share/licenses/$pkgname"
	install -pm755 aee "$pkgdir/usr/bin"
	install -pm755 xae "$pkgdir/usr/bin"
}

