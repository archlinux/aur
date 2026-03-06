# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="ellipse-bin"
_cratever="1.0.1"
pkgname="ellipse"
pkgver=1.0.1
pkgrel=2
pkgdesc='Command that truncates and ellipses strings in a human-friendly way'
url='https://crates.io/crates/ellipse-bin'
license=('GPL-3.0-only')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/ellipse-bin/1.0.1/download")
sha512sums=('885d585413b8da7b33e8c177153ee00c87aeff0ac1a840f5275f2f0d0b629b3598b4d755af38eaa955018e71f716adb9b877f31880a231d8a8b9ec2791671816')

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
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/ellipse" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
