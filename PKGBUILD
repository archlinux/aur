# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-readme"
pkgname="cargo-readme"
pkgver=3.3.1
pkgrel=1
pkgdesc='A cargo subcommand to generate README.md content from doc comments'
url='https://crates.io/crates/cargo-readme'
license=('Apache' 'MIT')

depends=('gcc-libs')
makedepends=('cargo')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/cargo-readme/3.3.1/download")
sha512sums=('8b8c6a89eb98855c3db682f7ed6199aeb537e8a1b492dba1a4b973065d2d8d7d8f36795cd6340fa1661ce062b9b3f395115db038a16ea3a52bb0ea7c145bfe76')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/$_crate-$pkgver"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	
	cargo build \
		--offline \
		--locked \
		--release
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/cargo-readme" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}