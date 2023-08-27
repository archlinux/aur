# Maintainer: Toby Vincent <tobyv@tobyvin.dev>

pkgname=flavours-git
pkgdesc='A simple and easy cli to build and use base16 schemes'
pkgver=0.6.1.r21.g884dadc
pkgrel=1
arch=('any')
url='https://github.com/Misterio77/flavours'
license=('MIT')
depends=('git')
makedepends=('rust')
source=("${pkgname%-git}::git+$url")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --long --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

prepare() {
	cd "$srcdir/${pkgname%-git}"

	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features

	cargo run --release  -- --completions bash > bash
	cargo run --release  -- --completions fish > fish
	cargo run --release  -- --completions zsh > zsh
}

check() {
	cd "$srcdir/${pkgname%-git}"

	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$srcdir/${pkgname%-git}"

	install -Dm755 "target/release/${pkgname%-git}" "$pkgdir/usr/bin/${pkgname%-git}"
	install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-git}/LICENSE"
	install -Dm644 "example.toml" "$pkgdir/etc/${pkgname%-git}.conf"
	install -Dm644 "bash" "$pkgdir/usr/share/bash-completion/completions/${pkgname%-git}"
	install -Dm644 "fish" "$pkgdir/usr/share/fish/vendor_completions.d/${pkgname%-git}.fish"
	install -Dm644 "zsh"  "$pkgdir/usr/share/zsh/site-functions/_${pkgname%-git}"
}
