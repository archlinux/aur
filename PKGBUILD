# Maintainer: Max1Truc <max1truc @ disroot dot org>
# Contributor: Caleb Maclennan <caleb@alerque.com>

_pkgname=magic-wormhole.rs
pkgname=wormhole-rs
pkgver=0.4.0
pkgrel=4
pkgdesc='Rust implementation of Magic Wormhole, with new features and enhancements'
arch=(x86_64)
url="https://github.com/magic-wormhole/$_pkgname"
license=('custom:EUPL-1.2+')
depends=(libxcb)
makedepends=(cargo git)
_archive="$_pkgname-$pkgver"
source=("$url/archive/$pkgver/$_archive.tar.gz"
        "$pkgname-cli-clipboard-dep.patch::$url/commit/1606112.patch")
sha256sums=('4773a5f179d1f26b61eed8a95b586b30cc45b205255d1427ba735e6df5804061'
            '0c0d6afe4ecc8869ef5a8f4afed9d15a423c462c99e9af22984f0085802fae7d')

prepare() {
   cd "$_archive"
   patch -p1 < ../${source[1]%::*}
   cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
}

build() {
   cd "$_archive"
   export RUSTUP_TOOLCHAIN=stable
   export CARGO_TARGET_DIR=target
   cargo build --frozen --release --all-features
}

package() {
   cd "$_archive"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE-EUPL-1.2" LICENSE
}
