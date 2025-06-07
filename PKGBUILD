pkgname=nosync
pkgver=1.1
pkgrel=2
pkgdesc="Preload library for disabling file's content synchronization"
arch=('i686' 'x86_64')
url="https://github.com/kjn/$pkgname"
license=('Apache-2.0')
depends=('glibc')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz"
        "$pkgname-open-segfault.patch::$url/pull/4.patch"
        "$pkgname-ldflags.patch")
sha256sums=('998f21e6e599f6372795ca5d30144362597eb73c9a5a38a6bfe60370feccaf4f'
            'cec118c1cb2940ed1948324eb34db433ed15ac98e58a785986556c553381bedd'
            '5b99e70b6a0fde15d8888a366c5c825fc122e90fb63a1da20a08189930b67660')

prepare() {
	cd "$pkgname-$pkgver"

	# Eliminate dependency on ELF constructor ordering
	# Solves segfaults during buildroot population in mock with nosync
	# enabled for builds with openssl
	# "FIPS module installed state definition is modified" changes
	# https://bugzilla.redhat.com/show_bug.cgi?id=1837809
	# https://github.com/kjn/nosync/pull/4
	patch -p1 -i "$srcdir/$pkgname-open-segfault.patch"
	patch -p1 -i "$srcdir/$pkgname-ldflags.patch"
}

build() {
	cd "$pkgname-$pkgver"

	make CFLAGS="$CFLAGS"
}

package() {
	cd "$pkgname-$pkgver"

	make prefix="$pkgdir/usr/" install

	install -Dp -m644 AUTHORS   "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
	install -Dp -m644 NOTICE    "$pkgdir/usr/share/doc/$pkgname/NOTICE"
	install -Dp -m644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}

# vim: set ft=sh ts=4 sw=4 noet:
