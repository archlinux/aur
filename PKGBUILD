# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="cargo-diet"
_cratever="1.3.2"
pkgname="cargo-diet"
pkgver=1.3.2
pkgrel=1
pkgdesc='Make your crate lean by computing size-optimal include directives for Cargo m...'
url='https://crates.io/crates/cargo-diet'
license=('MIT')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/cargo-diet/1.3.2/download")
sha512sums=('c900f72a588cec841df28ee88ae6c71f4d28c02e9b9a268d375857e272d37e717cb8543f7451e79389e5b4512380cf36b41884a0075ecd8bc0743b35fa0cce01')

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
	install -Dm755 "target/release/cargo-diet" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE.md' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
