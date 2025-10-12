# Maintainer: aksr <aksr at t-com dot me>
pkgname=rc-git
pkgver=1.7.4.r663.2bab312
pkgrel=1
pkgdesc='Independent re-implementation for Unix of the Plan 9 shell (from circa 1992).'
arch=('i686' 'x86_64')
url='https://github.com/rakitzis/rc'
license=('custom:zlib')
depends=('readline')
makedepends=('git')
install="${pkgname}.install"
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "%s.r%s.%s" \
		"$(git describe --long | sed 's/^v//;s/-.*//')" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$pkgname"
	make config.h
	CFLAGS="$CFLAGS -std=gnu11" make EDIT=readline RC_ADDON=1 RC_DEVELOP=1
}

#check() {
#	cd "$srcdir/$pkgname"
#	make check
#}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="$pkgdir/usr" install
#	install -D -m644 history.1 $pkgdir/usr/share/man/man1/rc-history.1
	install -D -m644 EXAMPLES $pkgdir/usr/share/doc/${pkgname%-*}/EXAMPLES
	install -D -m644 COPYING $pkgdir/usr/share/licenses/${pkgname%-*}/COPYING
}
