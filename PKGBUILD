# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="faketty"
pkgname="faketty"
pkgver=1.0.17
pkgrel=1
pkgdesc='Wrapper to exec a command in a pty, even if redirecting the output'
url='https://crates.io/crates/faketty'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-1.0.17.tar.gz::https://crates.io/api/v1/crates/faketty/1.0.17/download")
sha512sums=('90b4ebf65e6a60fb6e42230cccf5ef5fb83247a47798c42f88166806756ee87e9ba6e325182fc27b29fcd02025c96f20e7955283ed7ba5c4cba293fde0ba5b33')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-1.0.17"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-1.0.17"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-1.0.17"
	install -Dm755 "target/release/faketty" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}