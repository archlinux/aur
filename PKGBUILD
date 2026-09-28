# Maintainer: Yangtse Su <yangtsesu@gmail.com>

pkgname=fxrate
pkgver=0.5.2
pkgrel=1
pkgdesc="Offline currency conversion CLI backed by Frankfurter or exchange-api rates"
arch=('x86_64' 'aarch64')
url="https://github.com/YangtseSu/fxrate"
license=('GPL-3.0-only')
# Runtime linkage (ldd/readelf on the packaged binary): libgcc_s.so.1 from
# libgcc, libc/libm/ld from glibc. rusqlite uses its bundled SQLite.
depends=('glibc' 'libgcc')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('447de0183ce14a70da412f0295eb4de449ab9671b3ebbd425bea799c80687b30')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	# ring's bundled C/assembly does not link with Arch's global LTO flag.
	CFLAGS="${CFLAGS//-flto=auto/}" \
		CXXFLAGS="${CXXFLAGS//-flto=auto/}" \
		cargo build --release --locked
}

check() {
	cd "$srcdir/$pkgname-$pkgver"
	# Bundled C code (ring, SQLite) does not link in debug/test
	# builds with Arch's global LTO flag; same treatment as build().
	CFLAGS="${CFLAGS//-flto=auto/}" \
		CXXFLAGS="${CXXFLAGS//-flto=auto/}" \
		cargo test --locked
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm755 target/release/fxrate "$pkgdir/usr/bin/fxrate"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
