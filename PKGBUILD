# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

_crate="mstickereditor"
_cratever="0.3.7"
pkgname="mstickereditor"
pkgver=0.3.7
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker ...'
url='https://crates.io/crates/mstickereditor'
license=('Apache-2.0')

depends=('gcc-libs' 'ffmpeg' 'libwebp' 'rlottie')
makedepends=('cargo' 'cargo-auditable' 'clang' 'lld')

source=("$_crate-$_cratever.tar.gz::https://static.crates.io/crates/mstickereditor/0.3.7/download")
sha512sums=('0e610577f93353d4a2a0024f0bed5943414e56cc723e7053c963c7d99d74d2daf4355c4abd43e0a3dc77517b9b2b52d39c7eb75858a20731c3a221d2b1c8c6f8')

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

	./target/release/mstickereditor shell-completion bash >bashcompletion
}

package() {
	cd "$srcdir/$_crate-$_cratever"
	install -Dm755 "target/release/mstickereditor" -t "$pkgdir/usr/bin"
	install -Dm644 bashcompletion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 'LICENSE' -t "$pkgdir/usr/share/licenses/$pkgname/"
}