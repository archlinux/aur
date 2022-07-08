# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: LuckyTurtleDev [aur at lukas1818 dot de]
# Contributor: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname="mstickereditor"
pkgver=0.2.0
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker for Matrix'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url='https://github.com/LuckyTurtleDev/mstickereditor'
depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('6b057c617a6f9ae45fe60d737b38f085c18c38efa361af44b1f88799b00167b9d2d0cecf182e768dea463c3e848860b4f94a69ab58fd1f73be5dc20a132c3054')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	
	cargo build --locked --release
	
	cd target/release
	mkdir -p share/bash-completion/completions
	./mstickereditor shell-completion bash > share/bash-completion/completions/mstickereditor
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	
	install -Dm755 "target/release/mstickereditor" -t "$pkgdir/usr/bin"
	cp -r "target/release/share" "$pkgdir/usr/share"
}
