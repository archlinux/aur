# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="faketty"
_cratever="1.0.20"
pkgname="faketty"
pkgver=1.0.20
pkgrel=2
pkgdesc='Wrapper to exec a command in a pty, even if redirecting the output'
url='https://crates.io/crates/faketty'
license=('Apache-2.0' 'MIT')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/faketty/1.0.20/download")
sha512sums=('b58962a1968a72e3949b5de19db85b9b14e95e9f47666614a453ff464d2d96c8ec99d166e880e61bfd63129ddb65ae6fef1b67aad8195261a3e9025841b5a393')

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
	_check --tests
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/faketty" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE-APACHE' -t "$pkgdir/usr/share/licenses/$pkgname/"
	install -Dm644 'LICENSE-MIT' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
