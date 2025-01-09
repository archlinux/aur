# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-duplicates"
_cratever="0.7.0"
pkgname="cargo-duplicates"
pkgver=0.7.0
pkgrel=2
pkgdesc='Cargo subcommand for displaying when different versions of a same dependency ...'
url='https://crates.io/crates/cargo-duplicates'
license=('MIT')

depends=('gcc-libs' 'curl')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-duplicates/0.7.0/download")
sha512sums=('0d25a04413aab445c108bda6b9b7c8279ea3c80140c06a37f351c64933ea311cd57e660141c448185212372eb7e9e187a6440829e49e2c074434f7307e5b1486')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-$_cratever"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	LIBSSH2_SYS_USE_PKG_CONFIG='1' \
	cargo auditable build \
		--frozen \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/cargo-duplicates" -t "$pkgdir/usr/bin"
}