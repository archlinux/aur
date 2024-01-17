# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

_crate="mstickereditor"
pkgname="mstickereditor"
pkgver=0.3.3
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker ...'
url='https://crates.io/crates/mstickereditor'
license=('Apache')

depends=('gcc-libs' 'ffmpeg' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang' 'lld')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/mstickereditor/0.3.3/download")
sha512sums=('6b3e73fc6ae0f6aeaff6e156365b22602e32d78bcaf35c5cc89f73c4349f3f60cd7a7559f0d8a6823ea740d09426019c5d95119f0c8e9fa5bc965952b9444f62')

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

	./target/release/mstickereditor shell-completion bash >bashcompletion
}

package() {
	cd "$srcdir/$_crate-$pkgver"
	install -Dm755 "target/release/mstickereditor" -t "$pkgdir/usr/bin"
	install -Dm644 bashcompletion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}