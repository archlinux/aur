# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-duplicates"
pkgname="cargo-duplicates"
pkgver=0.6.0
pkgrel=1
pkgdesc='Cargo subcommand for displaying when different versions of a same dependency ...'
url='https://crates.io/crates/cargo-duplicates'
license=('MIT')

depends=('gcc-libs' 'curl')
makedepends=('cargo')

source=("$_crate-0.6.0.tar.gz::https://crates.io/api/v1/crates/cargo-duplicates/0.6.0/download")
sha512sums=('f3f5ebde062f9acad355f3e1922383d705312cfe1382b11a2194c948364472dc3be0fde6eb919248924c3865dcc9d4138673d737ea06dc582f206770cd092a40')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.6.0"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.6.0"
	
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
	cd "$srcdir/$_crate-0.6.0"
	install -Dm755 "target/release/cargo-duplicates" -t "$pkgdir/usr/bin"
}