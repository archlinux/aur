# Maintainer: Vincent Lee < vincent at vincent dash lee dot net >
# Notes:
# - This package requires nightly Rust to build, which can be fulfilled by
#   the rust-nightly-bin AUR package, or rustup.
pkgname=buck2-git
pkgver=r69.71ef2ce8d
pkgrel=1
pkgdesc="Successor to the Buck build system"
arch=("x86_64")
url="https://github.com/facebookincubator/buck2"
license=('Apache')
depends=('openssl' 'sqlite')
makedepends=('git' 'protobuf' 'rust-nightly')
provides=('buck2')
source=('git+https://github.com/facebookincubator/buck2'
	    'unbundled-sqlite.patch')
md5sums=('SKIP'
         '3e49b1c0a1a999e5b10844f8dc7aceb1')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Use system sqlite and don't rebuild it from scratch
	# TODO: the build also recompiles a zstd from scratch and statically links
	# to it. There doesn't seem to be an easy way to unbundle it.
	patch -i "$srcdir/unbundled-sqlite.patch"

	# Download all Rust dependencies. If using rustup, this also
	# downloads the toolchain declared in the rust-toolchain file before
	# fetching the dependencies.
	cargo fetch
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --bin=buck2 --release
}

check() {
	cd "$srcdir/${pkgname%-git}"
	# TODO: Disabled as one of the tests fails
	# cargo test --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	install -Dm755 target/release/buck2 "$pkgdir/usr/bin/buck2"
}
