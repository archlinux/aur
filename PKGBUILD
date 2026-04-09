# Maintainer: Aikawa Yataro <aikawayataro at protonmail dot com>
# Contributor: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=complgen
pkgver=0.8.3
pkgrel=1
pkgdesc="Generate bash/fish/zsh completions from a single declarative grammar"
arch=('x86_64')
url="https://github.com/adaszko/complgen"
license=('GPL-3.0-or-later')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')

source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('9130091cc5677760fc7b8ef2b80424bc214efa8e8798c6d9f4694876b7c044a5e587a5826231b561c25f4d23eebfa31f9f275bd42a5b35ba6009442b460e7a8e')

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
