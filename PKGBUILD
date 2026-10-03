# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: iamawacko <iamawacko at protonmail dot com>
# Contributor: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.3.11
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos"
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'binaryen' 'wasm-bindgen')
makedepends=()
optdepends=('dart-sass: sass support'
            'tailwindcss: tailwind support')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('30f1652c60221286defc8a805126d846d5ceab3fb80577915894388959797ea3')

latestver() {
  gh api repos/leptos-rs/cargo-leptos/releases/latest --jq '.tag_name' | sed 's/^v//'
}

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
	cd "$pkgname-$pkgver"
	export RUSTFLAGS="$RUSTFLAGS --remap-path-prefix=$srcdir="
	cargo build --frozen --release --features no_downloads
}

package() {
	cd "$pkgname-$pkgver"
	install -Dm755 "target/release/${pkgname}" -t "${pkgdir}/usr/bin"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
