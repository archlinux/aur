# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=riff
_pkgname=${pkgname##rust-}
pkgver=1.0.2
pkgrel=2
pkgdesc='automatically provide external dependencies for Rust projects'
arch=(x86_64)
url="https://github.com/DeterminateSystems/$_pkgname"
license=(MPL2)
depends=(cargo
         nix)
_archive="$_pkgname-$pkgver"
source=("$url/archive/v$pkgver/$_archive.tar.gz")
sha256sums=('957128c5e08f6d3ca6358363f7ad437081eddc4a4bcebc29b1c1ce217f4526a0')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$_archive"
	cargo build --frozen --release --all-features
}

check() {
	cd "$_archive"
	cargo test --frozen --all-features
}

package() {
	cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
}
