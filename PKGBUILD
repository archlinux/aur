# -*- mode: Shell-script; eval: (setq indent-tabs-mode 't); eval: (setq tab-width 4) -*-
# Maintainer: Dominic Meiser [git at msrd0 dot de]

# Package Information
pkgname="mstickereditor-git"
pkgver=0.1.1.r90.ga6474043
pkgrel=1
pkgdesc='import sticker packs from telegram, to be used at the Maunium sticker picker for Matrix'
license=('Apache')

# Tier 1 architectures supported by Rust (https://doc.rust-lang.org/nightly/rustc/platform-support.html#tier-1)
arch=('aarch64' 'i686' 'x86_64')

# Generic Stuff for cargo packages
url='https://github.com/Lukas1818/mstickereditor'
depends=('gcc-libs' 'rlottie' 'libwebp')
makedepends=('cargo' 'clang' 'lld')
source=("$pkgname::git+$url")
sha512sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	_tag=$(git describe --tags --abbrev=0 || true)
	_count=$(git rev-list --count HEAD)
	_hash=$(git rev-parse HEAD | cut -c 1-8)
	if [ -n "$_tag" ]; then
		printf '%s.r%d.g%s' $(echo $_tag | tr -d '[:alpha:]') $_count $_hash
	else
		printf 'r%d.g%s' $_count $_hash
	fi
}

build() {
	cd "$srcdir/$pkgname"
	
	cargo build --locked --release
	
	cd target/release
	mkdir -p share/bash-completion/completions
	./mstickereditor shell-completion bash > share/bash-completion/completions/mstickereditor
}

package() {
	provides=("mstickereditor=${pkgver/.r*/}")
	conflicts=("mstickereditor")
	
	cd "$srcdir/$pkgname"
	
	install -Dm755 "target/release/mstickereditor" -t "$pkgdir/usr/bin"
	cp -r "target/release/share" "$pkgdir/usr/share"
}
