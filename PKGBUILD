# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname=cargo-sort-ck
pkgver=2.1.1
pkgrel=1
pkgdesc='Check if tables and items in a .toml file are lexically sorted'
arch=('x86_64')
license=('Apache' 'MIT')

# Generic Stuff for cargo packages
url="https://crates.io/crates/$pkgname"
depends=('gcc-libs')
makedepends=('cargo')
source=("$pkgname.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('90d2c18ffb944960eb2f4b5e264c9b9b5537942afc8cf26581a72390776bd9f1caf355943b9d1eb245cde4302fa4d0e1e3df44474ce72be95b569529c946703c')

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
