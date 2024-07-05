# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=hayagriva
pkgver=0.5.3
pkgrel=1
pkgdesc="Format references and citations for your YAML-encoded or BibLaTeX bibliography files and query bibliographies using selectors."
arch=('any')
url="https://github.com/typst/hayagriva"
license=('Apache-2.0 OR MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/hayagriva/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("32bd05c2e98e25462662b9a8e390f1d621ba1d8c0348f632299b85cf6f38ffea67f1a15e86701a24a8d01c50a839576ef815da58b3ee6ec7e928170352da4708")

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
