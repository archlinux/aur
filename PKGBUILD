# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=gitbutler
pkgver=0.13.15
pkgrel=1
url="https://github.com/${pkgname}app/$pkgname"
pkgdesc='Version control client, backed by Git, powered by Tauri/Rust/Svelte'
arch=(x86_64)
license=(LicenseRef-FSL-1.1-MIT)
depends=(gtk4
         webkit2gtk-4.1)
makedepends=(cargo-nightly
             cargo-tauri
             cmake
             nodejs
             pnpm)
options=(!lto)
_archive="$pkgname-release-$pkgver"
source=("$url/archive/release%2F$pkgver/$_archive.tar.gz")
sha256sums=('2e9d7165f18eb455406991fc8eec3684cb637479101476b25ee8b5fd33af8cfc')

prepare() {
	cd "$_archive"
	cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
	pnpm install --frozen-lockfile
}

build() {
	cd "$_archive"
	export RUSTFLAGS+=' --cfg tokio_unstable'
	env \
		RUSTUP_TOOLCHAIN=nightly \
		CARGO_TARGET_DIR=target \
	cargo build --release
	# cargo tauri build --bundles deb
}

package() {
	cd "$_archive"
	local target="target/release/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$target"-{tauri,git-askpass,git-setsid}
}
