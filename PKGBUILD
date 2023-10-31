# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: pinks <aur at papepati dot page>

pkgname=biome
pkgver=1.3.3
pkgrel=1
pkgdesc='Formatter, linter, and more for Javascript, Typescript, JSON, and CSS'
arch=(x86_64)
url=https://biomejs.dev
license=(MIT)
depends=(gcc-libs
         glibc)
makedepends=(cargo)
replaces=(rome)
_archive="$pkgname-cli-v$pkgver"
source=("https://github.com/biomejs/biome/archive/cli/v$pkgver/$_archive.tar.gz")
sha256sums=('bed6b68b0f256efbbf072c26d451e33923e4ceadb02032fe51683f98177038c0')

prepare() {
	cd "$_archive/crates/${pkgname}_cli"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build -p "${pkgname}_cli"  --frozen --release --all-features
}

check() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	cargo test -p "${pkgname}_cli" --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
