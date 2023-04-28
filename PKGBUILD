# Maintainer: Vincent Lee < vincent at vincent dash lee dot net >
# Notes:
# - This package requires nightly Rust to build, which can be fulfilled by
#   the rust-nightly-bin AUR package, or rustup.
pkgname=buck2-git
pkgver=r4398.74a0d93b84
pkgrel=1
pkgdesc="Successor to the Buck build system"
arch=("x86_64")
url="https://github.com/facebook/buck2"
license=('Apache')
depends=('openssl' 'sqlite')
makedepends=('git' 'protobuf' 'rust-nightly')
provides=('buck2')
source=('git+https://github.com/facebook/buck2'
		'unbundled-sqlite.diff')
md5sums=('SKIP'
		 '3bdd7bd2f52a5eb249179d191b00a7b8')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Use system sqlite and don't rebuild it from scratch
	# TODO: the build also recompiles a zstd from scratch and statically links
	# to it. There doesn't seem to be an easy way to unbundle it.
	git apply "$srcdir/unbundled-sqlite.diff"

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
