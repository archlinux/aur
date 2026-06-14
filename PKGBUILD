# Maintainer: Stefan Gehr <stefan@gehr.xyz>

pkgname=hayagriva
pkgver=0.10.1
pkgrel=1
pkgdesc="Format references and citations for your YAML-encoded or BibLaTeX bibliography files and query bibliographies using selectors."
arch=('any')
url="https://github.com/typst/hayagriva"
license=('Apache-2.0 OR MIT')
makedepends=(cargo)
source=("$pkgname-$pkgver.tar.gz::https://github.com/typst/hayagriva/archive/refs/tags/v$pkgver.tar.gz")
b2sums=("59a6b7d1d84ea94cb6ae7dcd50fd242b09360e50b9b72329df0dc1189f42835da09875b07297cf0946ad3c3a1c96e6c6b95e8c914c38deae9a35a952ffb53039")

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
