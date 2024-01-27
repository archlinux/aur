# Maintainer: Horror Proton <107091537+horror-proton@users.noreply.github.com>
pkgname=maa-cli
pkgver=0.4.2
pkgrel=1
pkgdesc="A simple CLI for MAA by Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/MaaAssistantArknights/maa-cli"
license=('AGPL-3.0-or-later')
depends=('gcc-libs' 'libgit2' 'openssl')
makedepends=('cargo')
optdepends=('maa-assistant-arknights: for preinstalled maa core')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('758145b908291652437ac162e3f04b8a')

prepare() {
	cd "$srcdir/maa-cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/maa-cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	export MAA_EXTRA_SHARE_NAME=maa-assistant-arknights
	cargo build --frozen --release --no-default-features --features=core_installer,git2
}

check() {
	cd "$srcdir/maa-cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/maa-cli-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/maa"
	mkdir -p "$pkgdir/usr/share"
	# ln -s maa-assistant-arknights "$pkgdir/usr/share/maa"

	install -Dm644 <("$pkgdir"/usr/bin/maa complete bash) "$pkgdir/usr/share/bash-completion/completions/maa"
	install -Dm644 <("$pkgdir"/usr/bin/maa complete zsh) "$pkgdir/usr/share/zsh/site-functions/_maa"
	install -Dm644 "$srcdir/maa-cli-$pkgver"/maa-cli/completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"
}
