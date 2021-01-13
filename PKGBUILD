# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=refinery_cli
_bins=(refinery)
pkgver=0.5.0
pkgrel=1
pkgdesc='Run Refinery migrations via cli.'
arch=('x86_64')
license=('MIT')
depends=('openssl' 'sqlite')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('6398c8564b47f9cbca2ac75db0cd0dc79b095aa671e3878a287e752455d6e7a7c8aefb44978ce5df2b6e419f6859f1215cd991d82225c8eadde81775bd48fae9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	# crates.io packages aren't supposed to contain a Cargo.lock file so
	# don't use --locked  flag
	cargo build --release --no-default-features --features postgresql,mysql,sqlite
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# install all of the binaries
	for bin in ${_bins[@]}; do
		install -Dm755 "target/release/$bin" -t "$pkgdir/usr/bin"
	done

	# install whatever license files the distribution included
	for file in $(ls | grep -i -e license -e copying -e copyring); do
		install -Dm644 "$file" -t "$pkgdir/usr/share/licenses/$pkgname"
	done
}
