# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=complgen
pkgver=0.7.4
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('x86_64')
url="https://github.com/adaszko/complgen"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('601b991998de5755344a7993b8227bce811d9307b7e9f2882fafe78ef8b742ed958b2ec764ce938e7c6ab79b13376bdada953549bebc23c88850e6c0a2d5f3af')

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
