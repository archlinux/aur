# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=sqlx-cli
pkgver=0.5.1
pkgrel=1
pkgdesc='Command-line utility for SQLx, the Rust SQL toolkit.'
arch=('x86_64')
license=('Apache' 'MIT')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('8d5b2feeb0e145f56f48321ea614922ae4382243dbc5e14a74af8c22320a5539ab160d1e88199abad131a209a58bedf2253de329775500dd17b1325e41023ad2')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	# crates.io packages aren't supposed to contain a Cargo.lock file so
	# don't use --locked  flag
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	install -Dm755 "target/release/sqlx" -t "$pkgdir/usr/bin"
	install -Dm755 "target/release/cargo-sqlx" -t "$pkgdir/usr/bin"

	# install whatever license files the distribution included
	for file in $(ls | grep -i -e license -e copying -e copyring); do
		install -Dm644 "$file" -t "$pkgdir/usr/share/licenses/$pkgname"
	done
}
