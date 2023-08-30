# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

_crate="mstickereditor"
pkgname="mstickereditor"
pkgver=0.3.2
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker ...'
url='https://crates.io/crates/mstickereditor'
license=('Apache')

depends=('gcc-libs' 'ffmpeg' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang' 'lld')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/mstickereditor/0.3.2/download")
sha512sums=('1b3cfd9dac7318894eb864cecbb1d21931ccd0e590ba59db92fcc69edb07b0603201e4cca3c20ff5687375210b3061b607e1f39c9e93b1170e4de5af473c84fd')

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
	install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}