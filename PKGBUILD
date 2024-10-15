# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=hayagriva
pkgver=0.8.0
pkgrel=1
pkgdesc="Format references and citations for your YAML-encoded or BibLaTeX bibliography files and query bibliographies using selectors."
arch=('any')
url="https://github.com/typst/hayagriva"
license=('Apache-2.0 OR MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/hayagriva/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("2ea83196c498cfa95165e16802274883990f33caa523d9685614a0fdfb226ff9442d20156a8fb5e72ff7d0f6bf2669ddeb0587c6116b640cdc3d78c5c0565808")

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
