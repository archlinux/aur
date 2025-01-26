# Maintainer: Thomas Weißschuh <thomas t-8ch de>

pkgname=dedoc
pkgver=0.2.6
pkgrel=1
pkgdesc='terminal based viewer for DevDocs'
arch=('x86_64')
url='https://github.com/toiletbril/dedoc'
license=('GPL-3.0-only')
depends=('gcc-libs' 'glibc' 'openssl')
makedepends=('rust')
source=("$pkgname-$pkgver.tar.gz::https://github.com/toiletbril/dedoc/archive/refs/tags/${pkgver}.tar.gz")
sha512sums=('f823e1f01c92322fd702585de97c94d790b8b679c6a6d6325e6776be946321abe683672eb6d520e311ffec90302e581052f1f97f11c124e03f59489a565de200')

build() {
	cd "$pkgname-$pkgver"

	# Cross language LTO does not work properly
	# https://github.com/briansmith/ring/issues/1444
	# This would also work:
	# CC=clang RUSTFLAGS="-Clinker-plugin-lto -Clinker=clang  -Clink-arg=-fuse-ld=lld " CFLAGS="-flto=thin"
	CFLAGS+=" -fno-lto "

	cargo build --release --locked
}

check() {
	cd "$pkgname-$pkgver"

	cargo test --release --locked
}

package() {
	cd "$pkgname-$pkgver"

	install -Dm755 "target/release/dedoc" "$pkgdir/usr/bin/dedoc"

	install -Dm644 "README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
}
