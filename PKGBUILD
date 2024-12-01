# Maintainer: Alex Hirzel <alex at hirzel period us>

pkgname=print_chords
pkgver=0.1.4
pkgrel=1
pkgdesc='A stand-alone jack application that listens to a midi port and prints the chord names.'
url='https://crates.io/crates/print_chords'
license=('AGPL-3.0-only')
makedepends=(cargo)
depends=(gcc-libs glibc jack)
arch=(x86_64)
source=("$pkgname-$pkgver.tar.gz::https://static.crates.io/crates/$pkgname/$pkgname-$pkgver.crate")
sha512sums=('76aaaa694b73d278c73bfd5c86c7617adc8378beef4362d793669a5821116acf87b522ab0f2350829298e73bd4e0197f08a84cfa369f076e54fcaeba1ae1f805')

prepare() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo build --frozen --release --all-features
}

check() {
	cd "$pkgname-$pkgver"
	export RUSTUP_TOOLCHAIN=stable
	cargo test --frozen --all-features
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
}
