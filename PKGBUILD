# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]

_crate="llm-cli"
_cratever="0.1.1"
pkgname="llm-cli"
pkgver=0.1.1
pkgrel=2
pkgdesc='A CLI for running inference on supported Large Language Models. Powered by th...'
url='https://crates.io/crates/llm-cli'
license=('Apache-2.0' 'MIT')

depends=('gcc-libs')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/llm-cli/0.1.1/download")
sha512sums=('dd013d9b8f27001ed695a203b6f647e140c46bf6b7228b0c1b3d9b83abdff3e2f0060263e9cdd0ded967f7f13bdf568e1d2f2415b08679302911a894757e6a45')

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

	cargo auditable build \
		--frozen \
		--release
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/llm" -t "$pkgdir/usr/bin"
}