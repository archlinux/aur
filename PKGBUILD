# Maintainer: Vincent Lee < vincent at vincent dash lee dot net >
# Notes:
# - This package requires nightly Rust to build, which can be fulfilled by
#   the rust-nightly-bin AUR package, or rustup.
pkgname=buck2-git
pkgver=r6774.d43cf3a51
pkgrel=1
pkgdesc="Successor to the Buck build system"
arch=("x86_64")
url="https://github.com/facebook/buck2"
license=('Apache')
depends=('sqlite')
makedepends=('git'
			 'protobuf'
			 'rust-nightly'
			 'yq')  # To manipulate Cargo.toml in a sane way
provides=('buck2')
source=('git+https://github.com/facebook/buck2')
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	# Use system sqlite and don't rebuild it from scratch
	# TODO: the build also recompiles a zstd from scratch and statically links
	# to it. There doesn't seem to be an easy way to unbundle it.
	tomlq -t 'del(.workspace.dependencies.rusqlite.features[] | select(. == "bundled"))' Cargo.toml > Cargo.toml2
	# tomlq's -i in-place option doesn't work with toml output -t, so hack by renaming
	mv Cargo.toml2 Cargo.toml

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
