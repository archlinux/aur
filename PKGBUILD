# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

_crate="mstickereditor"
pkgname="mstickereditor"
pkgver=0.3.0
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker ...'
url='https://crates.io/crates/mstickereditor'
license=('Apache')

depends=('gcc-libs' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang' 'lld')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/mstickereditor/0.3.0/download")
sha512sums=('5d20694fd0c73408fd88b2cfc3dad2e332d92cdb0c93e95e82413ddb04a46e8e270cbdc1c6b1cdbda8ebfc05d9e23b68ea216fb1f244edd98ed378c5cfb905af')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

prepare() {
	cd "$srcdir/$_crate-$pkgver"

	cargo fetch --locked
}

build() {
	cd "$srcdir/$_crate-$pkgver"
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
}