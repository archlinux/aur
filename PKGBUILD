# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=refinery_cli
_bins=(refinery)
pkgver=0.6.0
pkgrel=1
pkgdesc='Run Refinery migrations via cli.'
arch=('x86_64')
license=('MIT')
depends=('openssl' 'sqlite')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('317144130fe44632c15e5ac2bf1ba0d74121c964736aa97dc5ef5a46a53c586acd047a27dc01d97e5ae620f75c0c99e55238ce2e87b2f4546a4110821d80b581')

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
