# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=cargo-diet
pkgver=1.2.0
pkgrel=2
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo manifests'
arch=('x86_64')
license=('MIT')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('b2205482834bfafcdf3d76138fba84498fe083a81be0408d30a05b178aaad2771b2060ccc85fde75c20e87473d2473d78dae49f39e4cb9029f904a7eb69c8d6f')

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
