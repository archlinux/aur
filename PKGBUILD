# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

_crate="b64url"
_cratever="0.1.2"
pkgname="b64url"
pkgver=0.1.2
pkgrel=1
pkgdesc='Command line URL-safe Base-64 encoder/decoder'
url='https://crates.io/crates/b64url'
license=('MIT')

depends=('libgcc')
makedepends=('cargo' 'cargo-auditable')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/b64url/0.1.2/download")
sha512sums=('a052dacd578bda936dcb7b69d11fa7afa99f364f3ed8bd2b587fb38c763abaf98c2ac0b713ca8476e20e648b2f6a44be6ae3e2988f8df54098b8c14fd69c5485')

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
	install -Dm755 "target/release/b64url" -t "$pkgdir/usr/bin"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}
