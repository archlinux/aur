# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=hayagriva
pkgver=0.9.1
pkgrel=1
pkgdesc="Format references and citations for your YAML-encoded or BibLaTeX bibliography files and query bibliographies using selectors."
arch=('any')
url="https://github.com/typst/hayagriva"
license=('Apache-2.0 OR MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/hayagriva/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("82db0c47508e37e209556d0006203b527da29e73c05213855c6c18627ad6e850a509df0c748bf9ddd209236a4dd6f2237bfc6f78fa5225d8df2a8aa00d3d3b18")

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
