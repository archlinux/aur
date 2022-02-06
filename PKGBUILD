# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>

pkgname=untree
pkgver=0.9.9
pkgrel=1
pkgdesc='Inverts tree diagrams back to directory structures'
arch=('x86_64')
url='https://github.com/codeinred/untree'
license=('MIT')
depends=('gcc-libs')
makedepends=('cargo' 'git')
source=("$pkgname::git+$url#tag=v$pkgver?signed")
sha256sums=('SKIP')
validpgpkeys=('C5E8A4C01F5A0F9E7E65C0FB7F67C72ED1182321') ## Alecto Irene Perez

prepare() {
	cd "$pkgname"
	cargo update
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cd "$pkgname"
	cargo build --frozen --release --all-features
}

check() {
	export RUSTUP_TOOLCHAIN=stable
	cd "$pkgname"
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname"
	install -D "target/release/$pkgname" -t "$pkgdir/usr/bin/"
	install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
