# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=hayagriva
pkgver=0.6.0
pkgrel=1
pkgdesc="Format references and citations for your YAML-encoded or BibLaTeX bibliography files and query bibliographies using selectors."
arch=('any')
url="https://github.com/typst/hayagriva"
license=('Apache-2.0 OR MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/hayagriva/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("7ca3df50d33ffd27fd27b5a1681452e164c62d062a17f56600cc8804a17bc1f6a2c80255998fd79a8d0fe3c6591a07223d0cf3fa6281e84cfadf9c4763fb53af")

prepare() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	cargo update
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd $pkgname-$pkgver
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --bin hayagriva --features cli
}

#check() {
#	cd $pkgname-$pkgver
#	export RUSTUP_TOOLCHAIN=stable
#	cargo test --frozen --bin hayagriva --features cli
#}

package() {
	cd $pkgname-$pkgver
	install -Dm644 LICENSE-APACHE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
	install -Dm644 LICENSE-MIT "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
