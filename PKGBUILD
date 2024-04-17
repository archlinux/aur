# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

_crate="mstickereditor"
pkgname="mstickereditor"
pkgver=0.3.5
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker ...'
url='https://crates.io/crates/mstickereditor'
license=('Apache-2.0')

depends=('gcc-libs' 'ffmpeg' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang' 'lld')

source=("$_crate-0.3.5.tar.gz::https://crates.io/api/v1/crates/mstickereditor/0.3.5/download")
sha512sums=('6a7d0c63033ca46c036588ee1c300688ccaee3068576f8a1ef3c7536ae0c2bba0eba03979b313930fc3003757d205ecb0fce4d22a8f4617031f6ca58fc2c3fc3')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-0.3.5"

	export RUSTUP_TOOLCHAIN=stable

	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$srcdir/$_crate-0.3.5"
	
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	CFLAGS+=" -ffat-lto-objects"

	
	cargo build \
		--offline \
		--locked \
		--release

	./target/release/mstickereditor shell-completion bash >bashcompletion
}

package() {
	cd "$srcdir/$_crate-0.3.5"
	install -Dm755 "target/release/mstickereditor" -t "$pkgdir/usr/bin"
	install -Dm644 bashcompletion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}