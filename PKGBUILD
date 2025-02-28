# Maintainer: Adrian Perez de Castro <aperez@igalia.com>

pkgname=pdpmake
pkgdesc='Publix Domain POSIX Make'
pkgver=2.0.3
pkgrel=5
license=(custom)
depends=(glibc)
url=https://frippery.org/make
arch=(x86_64)
source=("$url/$pkgname-$pkgver.tgz")
b2sums=('e0828bc721d2825efb1c507d9f128d6968417a1e5279540ae7cde7ed13026c805227ca0fcb665d04a8f27a73a610b8cf6822a0eb74d38c245b7fe73f3082069d')

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
