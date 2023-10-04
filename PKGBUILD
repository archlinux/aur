# Maintainer: Horror Proton <107091537+horror-proton@users.noreply.github.com>
pkgname=maa-cli
pkgver=0.3.9
pkgrel=1
pkgdesc="A simple CLI for MAA by Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/MaaAssistantArknights/maa-cli"
license=('AGPL')
depends=('gcc-libs')
makedepends=('cargo')
optdepends=('maa-assistant-arknights: for preinstalled maa core')
source=("$url/archive/refs/tags/v$pkgver.tar.gz")
md5sums=('20517c76f49569ec56ef75e72a20c9cb')

prepare() {
	cd "$srcdir/maa-cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/maa-cli-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	export MAA_EXTRA_SHARE_NAME=/usr/share/maa-assistant-arknights
	cargo build --frozen --release --all-features
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

	"$pkgdir"/usr/bin/maa complete bash | install -D /dev/stdin "$pkgdir/usr/share/bash-completion/completions/maa"
	"$pkgdir"/usr/bin/maa complete zsh | install -D /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_maa"
	cp -r "$srcdir/maa-cli-$pkgver/maa-cli/share" "$pkgdir/usr"
}
