# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=typstudio
pkgver=0.1.0
_suffix=105e6da5305b925af2edb948ba50f769aace223d
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
_archive="$pkgname-$pkgver-$_suffix"
source=("$url/archive/refs/tags/v$pkgver-$_suffix/$_archive.tar.gz")
sha256sums=('939cb60075e1ca0304c780484b55e4652449b6edae16cbfe04aa90374b834cc9')

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
