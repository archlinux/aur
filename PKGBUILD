# Maintainer: Yakov Till <yakov.till@gmail.com>
# Contributor: iamawacko <iamawacko at protonmail dot com>
# Contributor: Grafcube <grafcube at disroot dot org>

pkgname=cargo-leptos
pkgver=0.3.9
pkgrel=1
pkgdesc="Build tool for the Rust framework Leptos"
url='https://github.com/leptos-rs/cargo-leptos'
arch=('x86_64')
license=('MIT')
depends=('cargo' 'binaryen' 'wasm-bindgen' 'libgit2' 'libgit2.so' 'openssl')
makedepends=('pkgconf')
optdepends=('dart-sass: sass support'
            'tailwindcss: tailwind support')
options=(!lto)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fd77042aa0fa0e2cc75c93767fb61d7f8216efce44e6375c16f3af38c93e5993')

latestver() {
  gh api repos/leptos-rs/cargo-leptos/releases/latest --jq '.tag_name' | sed 's/^v//'
}

prepare() {
	cd "$pkgname-$pkgver"
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
	# Link the system libgit2/openssl instead of cargo-generate's vendored static copies
	sed -i 's/^cargo-generate = { version = "\([^"]*\)", features = \["vendored-openssl"\] }$/cargo-generate = { version = "\1", default-features = false }/' Cargo.toml
	grep -q '^cargo-generate = { version = "[^"]*", default-features = false }$' Cargo.toml ||
		{ echo "cargo-generate dependency line in Cargo.toml changed upstream; update the sed in prepare()" >&2; return 1; }
	# Drop the now-unused vendored crates from Cargo.lock so --frozen accepts it (removals only, no upgrades)
	cargo update --workspace --offline
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
