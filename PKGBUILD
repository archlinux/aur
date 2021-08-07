# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=runebender-git
pkgver=0.0.0.r307.g07d182a
pkgrel=1
pkgdesc='A font editor written in Rust'
arch=(x86_64)
url="https://github.com/linebender/${pkgname%-git}"
license=(Apache)
depends=(atk
         cairo
         gdk-pixbuf2
         gtk3
         pango)
makedepends=(cargo
             git)
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

prepare() {
	cd "$pkgname"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

pkgver() {
	cd "$pkgname"
	git tag | grep -Fq '0.0.0' || git tag '0.0.0' 4bf91df
	git describe --long --tags --abbrev=7 --match='[0-9]*' |
		sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	export RB_THEME_PATH="/usr/share/$pkgname/default.theme"
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/${pkgname%-git}"
	install -Dm0644 -t "$pkgdir/usr/share/$pkgname/" resources/*.theme
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE resources/aglfn.txt
}
