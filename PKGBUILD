# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=refinery_cli
_bins=(refinery)
pkgver=0.4.0
pkgrel=2
pkgdesc='Run Refinery migrations via cli.'
arch=('x86_64')
license=('MIT')
depends=('openssl' 'sqlite')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
makedepends=('cargo')
source=("$pkgname.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('7b0f3ab39db12ea655f4cc26e4c4186c711dd9297b318ba4032e9e1ff59d9020a0aee67ccb84ba69e747746d39035feb4221131d514bc75d9bcc6ff63d3467c9')

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
