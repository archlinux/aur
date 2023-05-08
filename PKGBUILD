# Maintainer: Caleb Maclennan <caleb@alerque.com>

# Note: upstream versioning is a borked scheme. I initially assumed appending
# the commit hash to the tag was just some weird workflow, but since new hashes
# with the same base tag have since shown up it is apparenly being used as
# a counter to disambiguate sequential dev releases. There is howeveer no
# sequential data in the tag itself. It will probably require an epoch to
# straighten this out, but until upstream announces what tagging scheme they
# are actually using for now I'm just going to overload pgkrel to track
# suffixes. See https://github.com/Cubxity/typstudio/issues/6

pkgname=typstudio
pkgver=0.1.0
_suffix=58d39e358f7e9219a50c3edceaca88da9cc89a81
pkgrel=3
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
sha256sums=('84c4fce631c96395715a816d4c7c30a743171c209d6803a0680d3c790d45cc8f')

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
