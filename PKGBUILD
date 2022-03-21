# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Lukas1818 aur at lukas1818 dot de
# Contributor: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname="mstickereditor"
pkgver=0.1.3
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
sha512sums=('8d59a2e04fd18fee7c9791d3b94401408ecc0a3bfd189835f1629f41c3a2c9f99328189b8c99cfa3f8ca12427f5e0357ed9234b5b186d7b8c310ee8271164fa4')

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
