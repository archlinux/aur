# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=complgen
pkgver=0.11.0
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('x86_64')
url="https://github.com/adaszko/complgen"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('4b4552809e45631bfc271948e59b2a8c45eaf4258bec0b9128a0f68b3b6fa792678ae1536f129a8d07d0d59257ef60aee9e8e27ccb9b1230cf96a5600fcb762a')

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
