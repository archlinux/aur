# Maintainer: raf <raf at raf dot org>
pkgname=noexcuses
pkgver=1.0
pkgrel=1
pkgdesc="Runs important cronjobs until they succeed"
arch=("any")
url=https://raf.org/noexcuses/
license=("GPL")
depends=("perl>=5.6" "inetutils")
source=("https://github.com/raforg/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("cab7819d9a4aa76d9019cb86ee4d53cec257b22b8d59cfcbf3edace13ea2449f")

prepare()
{
	cd "$pkgname-$pkgver"
	# Adapt -m test to troff warnings and tty escapes even when piped
	perl -pi \
		-e 's/noexcuses -m 2>[&]1/noexcuses -m 2>&-/;' \
		-e "s/^.*NOEXCUSES.*$/'NOEXCUSES.+USER COMMANDS.+NOEXCUSES' \\\\/" \
		run-tests
}

check()
{
	cd "$pkgname-$pkgver"
	make test
}

package()
{
	cd "$pkgname-$pkgver"
	make PREFIX="$pkgdir"/usr ETCDIR="$pkgdir"/etc VARDIR="$pkgdir/var" MANDIR="$pkgdir"/usr/share/man/man1 install
}

