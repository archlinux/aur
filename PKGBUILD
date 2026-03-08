# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-doc2readme"
_cratever="0.7.0"
pkgname="cargo-doc2readme"
pkgver=0.7.0
pkgrel=1
pkgdesc='cargo subcommand to create a readme file containing the rustdoc comments from...'
url='https://crates.io/crates/cargo-doc2readme'
license=('Apache-2.0')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-doc2readme/0.7.0/download")
sha512sums=('b2e60e822b65eab3af4483b9039b29e0f868063b30a8c1f0a4a7f629668a97c3e2bcc2b99851936f31bcf6d38386143991946de747a971609da103b2dc06c03d')

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

	./target/release/cargo-doc2readme completion bash >bashcompletion
}

_check() {
	cd "$srcdir/$_crate-$_cratever"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	cargo test \
		--frozen \
		--release \
		"${@}"
}

check() {
	_check --bins
	_check --lib
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/cargo-doc2readme" -t "$pkgdir/usr/bin"
	install -Dm644 bashcompletion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
