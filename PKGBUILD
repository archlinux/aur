# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-duplicates"
_cratever="0.8.4"
pkgname="cargo-duplicates"
pkgver=0.8.4
pkgrel=1
pkgdesc='Cargo subcommand for displaying when different versions of a same dependency ...'
url='https://crates.io/crates/cargo-duplicates'
license=('MIT')

depends=('gcc-libs' 'curl')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-duplicates/0.8.4/download")
sha512sums=('309c5e3a84b306b219c44358d6887ca304c63ed6049f3599488f5aa09a32b49c2990cf85a393f6a3a18aba7bec1319f3351de7cb81dd07e4b449749b4355bb5c')

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
