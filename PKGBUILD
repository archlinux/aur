# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Lukas1818 aur at lukas1818 dot de
# Contributor: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname="mstickereditor"
pkgver=0.1.1
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker for Matrix'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url='https://github.com/Lukas1818/mstickereditor'
depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('8d827eb1e565baed5e2420e1867e93827ab726911ea482fefdd71c3ff82dcac3b39fab5ec13347697d5ba857ffb8178c80090b5135eaf9846a1a7291ce0a8d00')

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
