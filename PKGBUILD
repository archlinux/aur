# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-duplicates"
_cratever="0.9.0"
pkgname="cargo-duplicates"
pkgver=0.9.0
pkgrel=1
pkgdesc='Cargo subcommand for displaying when different versions of a same dependency ...'
url='https://crates.io/crates/cargo-duplicates'
license=('MIT')

depends=('libgcc' 'curl')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-duplicates/0.9.0/download")
sha512sums=('f4b1e07b4f244e19af9aa2d77739b0e5e22ad9f3e28c68c2d3f20d1a24a0fb7c2df8d10fa6753246ee805f61b0f76fea47213335c7fa8d6f3b6049b7ac4f139a')

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
