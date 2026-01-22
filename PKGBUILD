# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=pdpmake
pkgdesc='Publix Domain POSIX Make'
pkgver=2.0.4
pkgrel=1
license=(custom)
depends=(glibc)
url=https://frippery.org/make
arch=(x86_64)
source=("$url/$pkgname-$pkgver.tgz")
b2sums=('776b83a31946ee1a689444a7d0439b7506cfac293c0ff9bb2b57f8c981c9895cada7ece279459996c14050b8ff602c23ca1d7489280d2542aeb57ac2cc6db3da')

# Enable all features and POSIX 2024 mode by default.
_pdpmake_cppflags=(
	-DENABLE_FEATURE_MAKE_EXTENSIONS
	-DENABLE_FEATURE_MAKE_POSIX_2024
	-DDEFAULT_POSIX_LEVEL=1
)

build () {
	cd "$pkgname-$pkgver"

	# Bootstrap.
	${CC:-gcc} ${CFLAGS} ${LDFLAGS} ${CPPFLAGS} -o make0 *.c

	# Build the version that gets installed.
	./make0 PREFIX=/usr CPPFLAGS="$CPPFLAGS ${_pdpmake_cppflags[*]}"
}

package () {
	cd "$pkgname-$pkgver"
	./make0 PREFIX=/usr DESTDIR="$pkgdir" install
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

check () {
	cd "$pkgname-$pkgver/testsuite"
	./runtest
}
