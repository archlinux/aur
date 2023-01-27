# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

_crate="mstickereditor"
pkgname="mstickereditor"
pkgver=0.3.1
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker ...'
url='https://crates.io/crates/mstickereditor'
license=('Apache')

depends=('gcc-libs' 'libwebp' 'rlottie')
makedepends=('cargo' 'clang' 'lld')

source=("$_crate-$pkgver.tar.gz::https://crates.io/api/v1/crates/mstickereditor/0.3.1/download")
sha512sums=('d1e8281f8c1f59df6bc48ac2f12debfe94bbe2d523a9b9a65b957d0083e228e1c4ae37046129e98c1abf2f6d47bb344ee6e7a11ce80ad832c9db65d6131899d0')

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