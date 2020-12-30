# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=cargo-readme
pkgver=3.2.0
pkgrel=3
pkgdesc='A cargo subcommand to generate README.md content from doc comments'
arch=('x86_64')
license=('Apache' 'MIT')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('49fdfcde0913e330e4f79e56d41ff675e2a1b0d0e11b09d8b3db348e11fabe9024ec71eeef72465113e92aa49324b6d5ab5e7607e196d35730d4fe059feeb5e9')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	# crates.io packages aren't supposed to contain a Cargo.lock file so
	# don't use --locked  flag
	cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	# change this if the crate has other binaries as well!
	install -Dm755 "target/release/$pkgname" -t "$pkgdir/usr/bin"

	# install whatever license files the distribution included
	for file in $(ls | grep -i -e license -e copying -e copyring); do
		install -Dm644 "$file" -t "$pkgdir/usr/share/licenses/$pkgname"
	done
}
