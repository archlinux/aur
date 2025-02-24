# Maintainer: Tyler Cook <aur@fossable.org>
pkgdesc='Sandpolis client instance'
pkgname='sandpolis-client'
pkgver='8.0.0'
pkgrel='1'
url='https://github.com/fossable/sandpolis'
arch=('x86_64')
license=('GNU Affero General Public License v3.0')
depends=('fuse3' 'alsa-lib' 'wayland')
makedepends=('cargo' 'pkg-config')
source=("sandpolis-$pkgver.tar.gz::https://static.crates.io/crates/sandpolis/sandpolis-$pkgver.crate")
sha512sums=('SKIP')

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname-$pkgver"
	cargo build --frozen --release --features client-tui --features client-gui
	local compgen="target/release/$pkgname --completion"
	$compgen bash >"completions/$pkgname"
	$compgen fish >"completions/$pkgname.fish"
	$compgen zsh >"completions/_$pkgname"
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname-$pkgver"
	cargo test --frozen --features client-tui --features client-gui
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin"
	install -Dm 644 README.md -t "$pkgdir/usr/share/doc/$pkgname"
	install -Dm 644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
	install -Dm 644 "completions/$pkgname" -t "$pkgdir/usr/share/bash-completion/completions/"
	install -Dm 644 "completions/$pkgname.fish" -t "$pkgdir/usr/share/fish/vendor_completions.d/"
	install -Dm 644 "completions/_$pkgname" -t "$pkgdir/usr/share/zsh/site-functions/"
}

