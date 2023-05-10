# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=typstudio
pkgver=0.1.0dev.15
_pkgver=${pkgver/dev/-dev}
pkgrel=1
pkgdesc='desktop application for typst'
url="https://github.com/Cubxity/$pkgname"
arch=(x86_64)
license=(GPL3)
depends=(libsoup
         typst
         webkit2gtk)
makedepends=(cargo
             cargo-tauri
             jq
             moreutils
             pnpm)
_archive="$pkgname-$_pkgver"
source=("$url/archive/refs/tags/v$_pkgver/$_archive.tar.gz")
sha256sums=('a777068965f8dde1505a9ec42f92807fadb0de21c6d75449c69b7d5f0ca6f7c0')

prepare() {
	cd "$_archive"
	local conf=src-tauri/tauri.conf.json
	jq '.tauri.bundle.active |= false' "$conf" | sponge "$conf"
	pnpm install --frozen-lockfile
	export RUSTUP_TOOLCHAIN=stable
	cargo fetch --locked --target "$CARCH-unknown-linux-gnu" --manifest-path src-tauri/Cargo.toml
}

build() {
	cd "$_archive"
	export RUSTUP_TOOLCHAIN=stable
	export CARGO_TARGET_DIR=target
	cargo-tauri build
}

package() {
	cd "$_archive"
	local target="src-tauri/target/release/$pkgname"
	install -Dm0755 -t "$pkgdir/usr/bin/" "$target"
}
