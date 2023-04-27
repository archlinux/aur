# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: pinks <aur at papepati dot page>

pkgname=rome
pkgver=12.0.0
pkgrel=1
pkgdesc='Formatter, linter, bundler, and more for Javascript, Typescript, JSON, HTML, Markdown, and CSS'
arch=(x86_64)
url="https://$pkgname.tools"
license=(MIT)
makedepends=(cargo)
_archive="tools-cli-v$pkgver"
source=("https://github.com/rome/tools/archive/cli/v$pkgver/$_archive.tar.gz")
sha256sums=('b31df7271e0b00bac2871480c52fe842b456b91ea70103c4db04b1c1f5453495')

prepare() {
	cd "$_archive/crates/rome_cli"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build -p rome_cli --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test -p rome_cli --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" "LICENSE"
}
