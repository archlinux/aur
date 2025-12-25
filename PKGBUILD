# Maintainer: Horror Proton <107091537+horror-proton@users.noreply.github.com>
pkgname=maa-cli
_pkgver=0.6.0-beta.3
pkgver=${_pkgver//-/}
pkgrel=1
pkgdesc="A simple CLI for MAA by Rust."
arch=('x86_64' 'aarch64')
url="https://github.com/MaaAssistantArknights/maa-cli"
license=('AGPL-3.0-only')
depends=('gcc-libs' 'libgit2' 'openssl' 'zip')
makedepends=('cargo')
optdepends=('maa-assistant-arknights: for preinstalled maa core')
source=("$url/archive/refs/tags/v${_pkgver}.tar.gz")
md5sums=('2464d132429555c43a2be286eff79122')
sha256sums=('23041f4e89362a58cd98c5f4b19e9e68713fe773b8fe947d698b09fae81d102a')
options=(!lto)

prepare() {
	cd "$srcdir/maa-cli-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/maa-cli-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target

	export MAA_EXTRA_SHARE_NAME=maa-assistant-arknights
	cargo build --frozen --release --no-default-features --features=core_installer,git2
}

check() {
	cd "$srcdir/maa-cli-$_pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/maa-cli-$_pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/maa"
	mkdir -p "$pkgdir/usr/share"
	# ln -s maa-assistant-arknights "$pkgdir/usr/share/maa"

	install -Dm644 <("$pkgdir"/usr/bin/maa complete bash) "$pkgdir/usr/share/bash-completion/completions/maa"
	install -Dm644 <("$pkgdir"/usr/bin/maa complete zsh) "$pkgdir/usr/share/zsh/site-functions/_maa"
	install -Dm644 "$srcdir/maa-cli-$_pkgver"/crates/maa-cli/completions/*.fish -t "$pkgdir/usr/share/fish/vendor_completions.d/"

	mkdir -p "$pkgdir/usr/share/man/man1"
	"$pkgdir/usr/bin/maa" mangen --path "$pkgdir/usr/share/man/man1"
}
