# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=sqlx-cli
pkgver=0.2.0
pkgrel=1
pkgdesc='Command-line utility for SQLx, the Rust SQL toolkit.'
arch=('x86_64')
license=('Apache' 'MIT')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
depends=('gcc-libs' 'openssl')
makedepends=('cargo')
source=("$pkgname.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('35ec6c85b3e8f3361781d080fe1f2925e52e8ceb72e0002103eee6547d5c647700d955197f337915f7ef74bdf347a43dff6127466c948d9ac80868f9c5cb56da')

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
