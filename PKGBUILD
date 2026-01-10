# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=complgen
pkgver=0.6.0
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('x86_64')
url="https://github.com/adaszko/complgen"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('bb8d39c107ee08810b9e8bc73a1456fd903e4e1a10c40a4db75fd7cd66ced418dcb19c955e099aac628f307d039317ce5cea5f43e5812562071ef5759d222a29')

prepare() {
	cd "$pkgname-$pkgver"

    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc --print host-tuple)"
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

	install -Dm0755 "target/release/complgen" -t "$pkgdir/usr/bin"
}
