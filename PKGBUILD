# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-duplicates"
pkgname="cargo-duplicates"
pkgver=0.7.0
pkgrel=1
pkgdesc='Cargo subcommand for displaying when different versions of a same dependency ...'
url='https://crates.io/crates/cargo-duplicates'
license=('MIT')

depends=('gcc-libs' 'curl')
makedepends=('cargo')

source=("$_crate-0.7.0.tar.gz::https://crates.io/api/v1/crates/cargo-duplicates/0.7.0/download")
sha512sums=('0d25a04413aab445c108bda6b9b7c8279ea3c80140c06a37f351c64933ea311cd57e660141c448185212372eb7e9e187a6440829e49e2c074434f7307e5b1486')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.7.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.7.0"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-0.7.0"
	install -Dm755 "target/release/cargo-duplicates" -t "$pkgdir/usr/bin"
}